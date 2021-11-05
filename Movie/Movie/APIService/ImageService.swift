// ImageService.swift
// Copyright © Edo. All rights reserved.

import Foundation
import UIKit

protocol ImageServiceProtocol {
    func getImage(url: String, complition: @escaping ((UIImage)?) -> Void)
}

final class ImageService: ImageServiceProtocol {
    func getImage(url: String, complition: @escaping ((UIImage)?) -> Void) {
        let imageAPIService = ImageAPIService()
        let cacheImageService = CacheImageService()
        let proxy = Proxy(imageAPIService: imageAPIService, caceImageService: cacheImageService)

        proxy.loadImage(imageAdress: url) { result in
            switch result {
            case let .success(image):
                complition(image)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
