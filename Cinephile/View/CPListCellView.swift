//
//  CPListCellView.swift
//  Cinephile
//
//  Created by Setu Desai on 2/5/24.
//

import SwiftUI

struct CPListCellView: View {
    
    var cineMovieList = [CPMovie]()
    
    var body: some View {
        List {
            ForEach(cineMovieList) { movieDetail in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                        HStack(alignment: .top) {
                            CPPosterImageView(moviePosterUrlString: movieDetail.posterPath)
                                .scaledToFill()
                                .frame(width: 105, alignment: .topLeading)
                                .cornerRadius(10)
                            VStack(alignment: .leading, spacing: 8) {
                                Text(movieDetail.name ?? movieDetail.title ?? "")
                                    .font(.title2)
                                    .fontWeight(.heavy)
                                    .multilineTextAlignment(.leading)
                                Text(movieDetail.overview ?? "")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                    .lineLimit(5)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.top, 1)
                        }.padding(.trailing, 3)
                    }
                    .padding(.bottom, 5)
                    .overlay {
                        NavigationLink("", value: movieDetail).opacity(0)
                    }
            }
            .listRowSeparator(.hidden)
        }.listStyle(.plain)
    }
}

#Preview {
    CPListCellView()
}
