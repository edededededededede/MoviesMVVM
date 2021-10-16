// RepositoryProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol RepositoryProtocol: AnyObject {
    associatedtype Entity
    func getData() -> [Entity]?
    func saveData(object: [Entity])
}
