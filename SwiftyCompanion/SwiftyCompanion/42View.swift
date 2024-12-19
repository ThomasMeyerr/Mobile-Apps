//
//  42View.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 19/12/2024.
//

import SwiftUI


enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}


struct _42View: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func downloadData<T: Codable>(fromUrl: String) async -> T? {
        do {
            guard let url = URL(string: fromUrl) else { throw NetworkError.badUrl }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse }
        } catch NetworkError.badUrl {
            //
        } catch NetworkError.invalidRequest {
            //
        } catch NetworkError.badResponse {
            //
        } catch NetworkError.badStatus {
            //
        } catch NetworkError.failedToDecodeResponse {
            //
        } catch {
            //
        }
            
        return nil
    }
}

#Preview {
    _42View()
}
