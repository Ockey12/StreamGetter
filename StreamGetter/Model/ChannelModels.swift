//
//  ChannelModels.swift
//  StreamGetter
//
//  Created by オナガ・ハルキ on 2023/05/16.
//

import Foundation

/// 1つのチャンネルの情報を保持する型
struct Channel: Identifiable {
    let id: String
    let channelTitle: String
    let description: String
    let thumbnailURL: URL
    
    init(item: ChannelItem) {
        self.id = item.snippet.channelId
        self.channelTitle = item.snippet.channelTitle
        self.description = item.snippet.description
        self.thumbnailURL = URL(string: item.snippet.thumbnails.default.url)!
    }
}

/// JSONファイルのitemsをデコードした結果を保持する型
struct ChannelResponse: Codable {
    let items: [ChannelItem]
}

/// JSONファイルのitems.itemをデコードした結果を保持する型
struct ChannelItem: Codable {
    let snippet: ChannelSnippet
}

/// JSONファイルのitems.item.snippetをデコードした結果を保持する型
struct ChannelSnippet: Codable {
    let channelId: String
    let channelTitle: String
    let description: String
    let thumbnails: Thumbnails
    let liveBroadcastContent: String
    
    struct Thumbnails: Codable {
        let `default`: Thumbnail
        let medium: Thumbnail
        let high: Thumbnail
        
        struct Thumbnail: Codable {
            let url: String
        }
    }
}
