//
//  AsyncImageView.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 30.08.2024.
//

import SwiftUI
import NukeUI

struct AsyncImageView: View {
    var image: URL?
    
    var body: some View {
        LazyImage(url: image) { state in
            if state.image != nil {
                state.image?
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                Color.blue
            }
        }
    }
}

#Preview {
    AsyncImageView(image: URL(string: "https://picsum.photos/id/574/400/600"))
}
