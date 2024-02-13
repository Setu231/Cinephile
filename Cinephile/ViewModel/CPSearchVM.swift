//
//  CPSearchVM.swift
//  Cinephile
//
//  Created by Setu Desai on 2/5/24.
//

import Foundation

final class CPSearchVM: ObservableObject {
    
    @Published var searchedMovieList = [CPMovie]()
    @Published var searchText = ""
    @Published var isLoading = false
    
    func getSearchAPICall(searchText: String) {
        isLoading = true
        let searchURL = String(format: CPServiceCallString.searchAll.rawValue, searchText)
        guard let URLRequest = NetworkManager.shared.getRequestMethod(searchURL) else { return }
        URLSession.shared.dataTask(with: URLRequest) { data, response, error in
            guard error == nil else { return }
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else { return }
            guard let data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let dataMovieList = try decoder.decode(CPMovieResponse.self, from: data)
                DispatchQueue.main.async {
                    self.searchedMovieList = dataMovieList.results ?? [CPMovie]()
                    self.isLoading = false
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
    
    var searchResults: [CPMovie] {
        return searchText.isEmpty ? [] : searchedMovieList
    }
    
    var isSearchedListEmpty: Bool {
        return searchedMovieList.isEmpty && !searchText.isEmpty
    }
}
