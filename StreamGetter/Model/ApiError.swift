//
//  ApiError.swift
//  StreamGetter
//
//  Created by オナガ・ハルキ on 2023/05/16.
//

import Foundation

enum ApiError: Error {
    case invalidURL
    case noData
    case decodingError
    case requestFailed
    case invalidData
}
