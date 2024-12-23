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
    let displayname: String
    let image_url: String
    let correction_point: Int
    let wallet: Int
    let location: String?
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
    private let clientID = "u-s4t2ud-f4010b1ce4c0ef5510945c3e4c5bfdc7ad3dc45a811d1b6b3178c31458c63e08"
    private let clientSecret = "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"
    private let tokenURL = "https://api.intra.42.fr/oauth/token"
        
    private func getAccessToken() async throws {
        guard let url = URL(string: tokenURL) else { throw NetworkError.badUrl }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let parameters = [
            "grant_type": "client_credentials",
            "client_id": clientID,
            "client_secret": clientSecret
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

    func downloadData<T: Codable>(fromUrl: String) async -> T? {
        do {
            if accessToken.isEmpty {
                try await getAccessToken()
            }
            
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

