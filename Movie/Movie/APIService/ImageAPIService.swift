// ImageAPIService.swift
// Copyright © Edo. All rights reserved.

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
            completion(.success(image))
        }.resume()
    }
}
