//
//  SearchChannelsView.swift
//  StreamGetter
//
//  Created by オナガ・ハルキ on 2023/05/28.
//

import SwiftUI

struct SearchChannelsView: View {
    var body: some View {
        Button {
            let requester = ChannelRequester()
            
            Task {
                do {
                    _ = try await requester.searchChannels(channelKeyWord: "Polka Ch.")
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        } label: {
            Text("\"Polka Ch.\"でチャンネルを検索")
        }

    }
}

struct SearchChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchChannelsView()
    }
}
