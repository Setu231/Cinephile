//
//  CPPosterImageView.swift
//  Cinephile
//
//  Created by Setu Desai on 2/5/24.
//

import SwiftUI

struct CPPosterImageView: View {
    
    @StateObject var CPImageViewModel = CPImageVM()
    var moviePosterUrlString: String?
    
    var body: some View {
        Image(uiImage: CPImageViewModel.posterImage)
            .resizable()
            .task {
                CPImageViewModel.getPosterAPICall(urlString: moviePosterUrlString)
            }
    }
}

#Preview {
    CPPosterImageView()
}
