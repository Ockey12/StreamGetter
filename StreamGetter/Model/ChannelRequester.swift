//
//  ChannelRequester.swift
//  StreamGetter
//
//  Created by オナガ・ハルキ on 2023/05/16.
//

import Foundation

struct ChannelRequester {
    //    func searchChannels(channelKeyWord: String, completion: @escaping (Result<[Channel], Error>) -> Void) {
    //        var components = URLComponents()
    //        components.scheme = "https"
    //        components.host = "www.googleapis.com"
    //        components.path = "/youtube/v3/search"
    //
    //        let apiKey = ApiKeyGetter.YouTubeApiKey
    //        components.queryItems = [
    //            URLQueryItem(name: "part", value: "snippet"),
    //            URLQueryItem(name: "q", value: channelKeyWord),
    //            URLQueryItem(name: "type", value: "channel"),
    //            URLQueryItem(name: "key", value: apiKey),
    //            URLQueryItem(name: "maxResults", value: "20")
    //        ]
    //
    //        guard let url = components.url else {
    //            completion(.failure(ApiError.invalidURL))
    //            return
    //        }
    //
    //        URLSession.shared.dataTask(with: url) { (data, response, error) in
    //            if let error = error {
    //                completion(.failure(error))
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completion(.failure(ApiError.noData))
    //                return
    //            }
    //
    //            if let json = String(data: data, encoding: .utf8) {
    //                print("Response JSON: \(json)")
    //            }
    //
    //            do {
    //                let decoder = JSONDecoder()
    //                let response = try decoder.decode(ChannelResponse.self, from: data)
    //                let channels = response.items.map(Channel.init)
    //                completion(.success(channels))
    //            } catch {
    //                print("Decoding error: \(error)")
    //                completion(.failure(error))
    //            }
    //        }.resume()
    //    } // end func searchChannels
    
    func searchChannels(channelKeyWord: String) async throws -> [Channel] {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.googleapis.com"
        components.path = "/youtube/v3/search"
        
        let apiKey = ApiKeyGetter.YouTubeApiKey
        components.queryItems = [
            URLQueryItem(name: "part", value: "snippet"),
            URLQueryItem(name: "q", value: channelKeyWord),
            URLQueryItem(name: "type", value: "channel"),
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "maxResults", value: "20")
        ]
        
        guard let url = components.url else {
            throw ApiError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
#if DEBUG
            guard let responsedJson = String(data: data, encoding: .utf8) else {
                fatalError()
            }
            print("--- searchChannels responsed JSON ---")
            print(responsedJson)
#endif
            
            let decoder = JSONDecoder()
            let response = try decoder.decode(ChannelResponse.self, from: data)
            let channels = response.items.map(Channel.init)
            return channels
        } catch {
            fatalError()
        }
    } // func searchChannels
}
