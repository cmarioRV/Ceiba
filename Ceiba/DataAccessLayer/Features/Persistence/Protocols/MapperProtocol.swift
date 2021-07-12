//
//  MapperProtocol.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

protocol MapperProtocol {
    func mapToDomain<DBEntity: Storable, DomainEntity: Mappable>(from dbEntity: DBEntity, target domainEntity: inout DomainEntity)
    func mapToDB<DomainEntity: Mappable, DBEntity: Storable>(from domainEntity: DomainEntity, target dbEntity: DBEntity)
}
