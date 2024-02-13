//
//  CPMovieDetailView.swift
//  Cinephile
//
//  Created by Setu Desai on 2/5/24.
//

import SwiftUI

struct CPMovieDetailView: View {
    
    @StateObject var CPMovieDetailViewModel = CPMovieDetailVM()
    @State var movieID: Int?
    @State var posterPath: String?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    CPPosterImageView(moviePosterUrlString: posterPath)
                        .scaledToFill()
                }.padding(.bottom, 10)
                    .padding(.top, -16)
                VStack(alignment: .leading, spacing: 10) {
                    Text(CPMovieDetailViewModel.movieDetail.title ?? "")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                    Text(CPMovieDetailViewModel.movieDetail.overview ?? "")
                        .font(.footnote)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                }.padding(10)
            }
        }
        .task {
            CPMovieDetailViewModel.getMovieDetailAPICall(movieID: String(movieID ?? 0))
        }
    }
}

#Preview {
    CPMovieDetailView()
}
