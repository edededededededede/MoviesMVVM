// RepositoryProtocol.swift
// Copyright © Edo. All rights reserved.

import Foundation

protocol RepositoryProtocol: AnyObject {
    associatedtype Entity
    func getData() -> [Entity]?
    func saveData(object: [Entity])
}
