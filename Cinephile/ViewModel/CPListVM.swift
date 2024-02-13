//
//  CPListVM.swift
//  Cinephile
//
//  Created by Setu Desai on 2/4/24.
//

import Foundation

final class CPListVM: ObservableObject {
    
    @Published var movieList = [CPMovie]()
    
    func getMovieListAPICall() {
        guard let URLRequest = NetworkManager.shared.getRequestMethod(CPServiceCallString.allMovie.rawValue) else { return }
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
                    self.movieList = dataMovieList.results ?? [CPMovie]()
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
