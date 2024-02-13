//
//  CPMovieDetailVM.swift
//  Cinephile
//
//  Created by Setu Desai on 2/5/24.
//

import SwiftUI

final class CPMovieDetailVM: ObservableObject {
    
    @Published var movieDetail = CPMovieDetail()
    
    func getMovieDetailAPICall(movieID: String) {
        let searchURL = String(format: CPServiceCallString.movieDetail.rawValue, movieID)
        guard let URLRequest = NetworkManager.shared.getRequestMethod(searchURL) else { return }
        URLSession.shared.dataTask(with: URLRequest) { data, response, error in
            guard error == nil else { return }
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else { return }
            guard let data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let dataMovieList = try decoder.decode(CPMovieDetail.self, from: data)
                DispatchQueue.main.async {
                    self.movieDetail = dataMovieList
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
