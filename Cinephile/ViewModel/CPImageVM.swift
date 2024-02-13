//
//  CPImageVM.swift
//  Cinephile
//
//  Created by Setu Desai on 2/5/24.
//

import UIKit

final class CPImageVM: ObservableObject {
    
    @Published var posterImage = UIImage()
    
    func getPosterAPICall(urlString: String?) {
        guard let urlString else {
            self.posterImage = UIImage(systemName: "photo") ?? UIImage()
            return
        }
        let imageURL = CPServiceCallString.posterImage.rawValue + urlString
        if let cachedImage = NetworkManager.shared.cachedImage.object(forKey: NSString(string: imageURL)) {
            posterImage = cachedImage
        } else {
            NetworkManager.shared.downloadPosterImage(urlString: imageURL) { image in
                DispatchQueue.main.async {
                    self.posterImage = image ?? UIImage(systemName: "photo") ?? UIImage()
                }
            }
        }
    }
}
