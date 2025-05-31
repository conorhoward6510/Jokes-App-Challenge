//
//  DataService.swift
//  Jokes App Challenge
//
//  Created by Conor Howard on 31/05/2025.
//

import Foundation

struct DataService {
    
    enum JokeAPIError: Error {
        case invalidURL
        case requestFailed(Error)
        case decodingFailed(Error)
    }

    func getJoke() async throws -> JokeResponse {
        guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any") else {
            throw JokeAPIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            do {
                return try JSONDecoder().decode(JokeResponse.self, from: data)
            } catch {
                throw JokeAPIError.decodingFailed(error)
            }
        } catch {
            throw JokeAPIError.requestFailed(error)
        }
    }
    
}
