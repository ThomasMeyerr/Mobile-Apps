//
//  WebService.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 19/12/2024.
//

import Foundation


enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}


struct TokenResponse: Codable {
    let access_token: String
    let token_type: String
    let expires_in: Int
}


struct User: Codable {
    let id: Int
    let email: String
    let login: String
    let firstName: String
    let lastName: String
    let kind: String
    let image: UserImage
    let correctionPoint: Int
    let location: String?
    let wallet: Int
    let cursusUsers: [CursusUser]
    let projectsUsers: [ProjectsUser]
    
    enum CodingKeys: String, CodingKey {
        case id, email, login
        case firstName = "first_name"
        case lastName = "last_name"
        case kind, image
        case correctionPoint = "correction_point"
        case location, wallet
        case cursusUsers = "cursus_users"
        case projectsUsers = "projects_users"
    }
    
    #if DEBUG
    static let cursusUsers = [CursusUser(id: 1, grade: "Learner", level: 10.97), CursusUser(id: 1, grade: "Member", level: 10.97)]
    static let example = User(id: 1, email: "omg@gmail.com", login: "thmeyer", firstName: "Thomas", lastName: "Meyer", kind: "student", image: UserImage.example, correctionPoint: 31, location: nil, wallet: 1064, cursusUsers: cursusUsers, projectsUsers: ProjectsUser.example)
    #endif
}


struct UserImage: Codable {
    let link: String
    
    #if DEBUG
    static let example = UserImage(link: "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
    #endif
}


struct CursusUser: Codable {
    let id: Int
    let grade: String?
    let level: Double
    
    enum CodingKeys: String, CodingKey {
        case id, grade, level
    }
}


struct ProjectsUser: Codable, Identifiable {
    let id: Int
    let finalMark: Int?
    let validated: Bool?
    let project: Project
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case finalMark = "final_mark"
        case validated = "validated?"
        case project
        case updatedAt = "updated_at"
    }
    
    #if DEBUG
    static let example = [ProjectsUser(id: 1, finalMark: 125, validated: true, project: Project.example, updatedAt: "2024-12-05T08:46:54.908Z"), ProjectsUser(id: 2, finalMark: nil, validated: nil, project: Project.example, updatedAt: "2024-12-05T08:46:54.908Z"), ProjectsUser(id: 2, finalMark: nil, validated: nil, project: Project.example, updatedAt: "2023-12-07T15:01:22.295Z")]
    #endif
}


struct Project: Codable {
    let id: Int
    let name: String
    
    #if DEBUG
    static let example = Project(id: 1, name: "ft_transcendence")
    #endif
}


struct Coalition: Codable {
    let id: Int
    let name: String
    let color: String
}
typealias Coalitions = [Coalition]


class WebService {
    // globale var
    static var accessToken = ""
    static var code = ""
    
    var alertString = ""
    
    // Configuration 42 API
    let clientID = "u-s4t2ud-f4010b1ce4c0ef5510945c3e4c5bfdc7ad3dc45a811d1b6b3178c31458c63e08"
    private let clientSecret = "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"
    let redirectUri = "swiftycompanion://callback"
    let encodedRedirectUri = "swiftycompanion://callback".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    private let tokenURL = "https://api.intra.42.fr/oauth/token"
    
    private func getAccessToken(code: String) async throws {
        guard let url = URL(string: tokenURL) else { throw NetworkError.badUrl }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let parameters = [
            "grant_type": "authorization_code",
            "client_id": clientID,
            "client_secret": clientSecret,
            "code": code,
            "redirect_uri": redirectUri
        ]
                
        request.httpBody = parameters
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
            .data(using: .utf8)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badStatus
        }
        
        let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: data)
        WebService.accessToken = tokenResponse.access_token
    }

    func downloadData<T: Codable>(fromUrl: String, code: String) async -> T? {
        do {
            if WebService.accessToken.isEmpty {
                try await getAccessToken(code: code)
            }
                        
            guard let url = URL(string: fromUrl) else { throw NetworkError.badUrl }
            
            var request = URLRequest(url: url)
            request.setValue("Bearer \(WebService.accessToken)", forHTTPHeaderField: "Authorization")

            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse }
            
            return decodedResponse
        } catch NetworkError.badUrl {
            alertString = "There was an error creating the URL"
        } catch NetworkError.badResponse {
            alertString = "Did not get a valid response"
        } catch NetworkError.badStatus {
            alertString = "Did not get a 2xx status code from the response"
        } catch NetworkError.failedToDecodeResponse {
            alertString = "Failed to decode response into the given type"
        } catch {
            alertString = "An error has occured downloading the data"
        }
        
        return nil
    }
}

