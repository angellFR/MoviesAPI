//
//  ViewLoginEntity.swift
//  PeliculasNewTiss
//
//  Created by Administrator on 12/04/23.
//

import Foundation

struct TokenResponse: Codable {
    let success: Bool
    let expiresAt, requestToken: String

    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
