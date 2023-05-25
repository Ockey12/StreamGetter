//
//  ApiKeyGetter.swift
//  StreamGetter
//
//  Created by オナガ・ハルキ on 2023/05/16.
//

import Foundation

/// Secrets.plistからAPIキーを取得し，static変数として渡す
struct ApiKeyGetter {
    /// YouTubeAPI  v3と通信をするためのAPIキーをSecrets.plistから取得し，APIキーの文字列を返す
    static var YouTubeApiKey: String {
        guard let filePath = Bundle.main.path(forResource: "Secrets", ofType: "plist") else {
            fatalError("Couldn't find Secrets.plist")
        }
        
        guard let plist = NSDictionary(contentsOfFile: filePath) else {
            fatalError("Couldn't read Secrets.plist")
        }
        
        guard let apiKey = plist["YouTubeAPIKey"] as? String else {
            fatalError("Failed to load YouTube API key")
        }
        return apiKey
    }
}
