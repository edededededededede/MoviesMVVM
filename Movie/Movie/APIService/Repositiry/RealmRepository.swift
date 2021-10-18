// RealmRepository.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

final class RealmRepository<RealmEntity: Object>: DataBaseRepository<RealmEntity> {
    override func getData() -> [RealmEntity]? {
        do {
            let realm = try Realm()
            let objects = realm.objects(RealmEntity.self)
            var entities: [Entity] = []
            objects.forEach { movie in
                entities.append(movie)
            }
            return entities
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }

    override func saveData(object: [RealmEntity]) {
        do {
            let realm = try Realm()
            try? realm.write {
                let oldObject = realm.objects(Entity.self)
                realm.delete(oldObject)
                realm.add(object)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
