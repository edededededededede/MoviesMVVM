// ImageAPIService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

protocol ImageAPIServiceProtocol {
    func getPhoto(url: URL, completion: @escaping (Result<UIImage?, Error>) -> Void)
}

final class ImageAPIService: ImageAPIServiceProtocol {
    func getPhoto(url: URL, completion: @escaping (Result<UIImage?, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let image = UIImage(data: data) else { return }

            DispatchQueue.main.async {
                completion(.success(image))
            }

        }.resume()
    }
}
