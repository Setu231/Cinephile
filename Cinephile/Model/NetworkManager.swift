//
//  NetworkManager.swift
//  Cinephile
//
//  Created by Setu Desai on 2/4/24.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    var cachedImage = NSCache<NSString, UIImage>()
    
    let headers = [
      "accept": "application/json",
      "Authorization": "Bearer \(Bundle.main.infoDictionary?["API_KEY"] as? String ?? "")"
    ]
    
    func getRequestMethod(_ apiString: String) -> URLRequest? {
        guard let url = URL(string: apiString) else { return nil }
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        return request
    }
    
    func downloadPosterImage(urlString: String, completion: @escaping ((UIImage?) -> Void) ) {
        guard let URLRequest = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: URLRequest) { data, response, error in
            guard error == nil else { return }
            guard let data, let image = UIImage(data: data) else { return }
            completion(image)
        }.resume()
    }
}
