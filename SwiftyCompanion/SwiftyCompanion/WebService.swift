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
    let active: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, email, login
        case firstName = "first_name"
        case lastName = "last_name"
        case kind, image
        case correctionPoint = "correction_point"
        case location, wallet, active
    }
}


struct UserImage: Codable {
    let link: String
}


struct TokenResponse: Codable {
    let access_token: String
    let token_type: String
    let expires_in: Int
}


class WebService {
    private var accessToken = ""
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
        self.accessToken = tokenResponse.access_token
    }

    func downloadData<T: Codable>(fromUrl: String, code: String) async -> T? {
        do {
            if accessToken.isEmpty {
                try await getAccessToken(code: code)
            }
            
            print(accessToken)
            
            guard let url = URL(string: fromUrl) else { throw NetworkError.badUrl }
            
            var request = URLRequest(url: url)
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

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

