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


struct Data: Identifiable, Codable {
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
    private let clientID = "u-s4t2ud-0641e8121d22316b7f963f6a3d5b39c86a4316f814cfd097b912781e356ad05d"
    private let clientSecret = "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"
    private let tokenURL = "https://api.intra.42.fr/oauth/token"
    
    private func getAccessToken() async throws {
        guard let url = URL(string: tokenURL) else { throw NetworkError.badUrl }
        
        
    }

    func downloadData<T: Codable>(fromUrl: String) async -> T? {
        do {
            guard let url = URL(string: fromUrl) else { throw NetworkError.badUrl }
            let (data, response) = try await URLSession.shared.data(from: url)
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

