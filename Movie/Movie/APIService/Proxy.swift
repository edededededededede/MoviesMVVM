// Proxy.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol ProxyProtocol {
    func loadImage(imageAdress: String, complition: @escaping (Result<UIImage?, Error>) -> Void)
}

final class Proxy: ProxyProtocol {
    private let imageAPIService: ImageAPIServiceProtocol
    private let caceImageService: CacheImageServiceProtocol

    init(imageAPIService: ImageAPIServiceProtocol, caceImageService: CacheImageServiceProtocol) {
        self.imageAPIService = imageAPIService
        self.caceImageService = caceImageService
    }

    func loadImage(imageAdress: String, complition: @escaping (Result<UIImage?, Error>) -> Void) {
        guard let url = URL(string: imageAdress) else { return }

        let image = caceImageService.getImageFromCache(url: url.absoluteString)

        if image == nil {
            imageAPIService.getPhoto(url: url) { result in
                switch result {
                case let .success(image):
                    self.caceImageService.saveImageToCache(url: url.absoluteString, image: image ?? UIImage())
                    complition(.success(image))
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
        } else {
            guard let image = image else { return }
            complition(.success(image))
        }
    }
}
