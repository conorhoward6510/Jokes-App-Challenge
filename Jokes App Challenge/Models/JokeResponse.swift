//
//  JokeResponse.swift
//  Jokes App Challenge
//
//  Created by Conor Howard on 31/05/2025.
//

import Foundation

struct JokeResponse: Codable {
    let error: Bool
    let category: String
    let type: JokeType
    let joke: String?
    let setup: String?
    let delivery: String?
    let flags: JokeFlags
    let id: Int
    let safe: Bool
    let lang: String
}

enum JokeType: String, Codable {
    case single
    case twopart
}

struct JokeFlags: Codable {
    let nsfw: Bool
    let religious: Bool
    let political: Bool
    let racist: Bool
    let sexist: Bool
    let explicit: Bool
}
