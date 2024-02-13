//
//  CPListView.swift
//  Cinephile
//
//  Created by Setu Desai on 2/4/24.
//

import SwiftUI
import CoreData

struct CPListView: View {
    
    @StateObject var CPListViewModel = CPListVM()
    
    var body: some View {
        NavigationStack {
            CPListCellView(cineMovieList: CPListViewModel.movieList)
                .navigationTitle("Trending")
                .navigationDestination(for: CPMovie.self) { movie in
                    CPMovieDetailView(movieID: movie.id, posterPath: movie.posterPath)
                }
        }
        .task {
            CPListViewModel.getMovieListAPICall()
        }
    }
}

#Preview {
    CPListView()
}
