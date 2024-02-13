//
//  CPSearchView.swift
//  Cinephile
//
//  Created by Setu Desai on 2/4/24.
//

import SwiftUI

struct CPSearchView: View {
    
    @StateObject var CPSearchListVM = CPSearchVM()
    
    var body: some View {
        NavigationStack {
            CPListCellView(cineMovieList: CPSearchListVM.searchResults)
                .overlay(content: {
                    if CPSearchListVM.isLoading {
                        ProgressView()
                    } else if CPSearchListVM.isSearchedListEmpty {
                        ContentUnavailableView.search(text: CPSearchListVM.searchText)
                    } else if CPSearchListVM.searchResults.isEmpty {
                        EmptyView()
                    }
                })
                .searchable(text: $CPSearchListVM.searchText, placement: .navigationBarDrawer(displayMode: .always))
                .onChange(of: CPSearchListVM.searchText, { _, text in
                    CPSearchListVM.getSearchAPICall(searchText: text)
                })
                .navigationDestination(for: CPMovie.self) { movie in
                    CPMovieDetailView(movieID: movie.id, posterPath: movie.posterPath)
                }
                .navigationTitle("Search")
        }
    }
}

#Preview {
    CPSearchView(CPSearchListVM: CPSearchVM())
}
