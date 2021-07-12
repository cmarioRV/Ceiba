//
//  UserMapper.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation
import CoreData
import Runtime

class UserMapper: MapperProtocol {
    func mapToDomain<DBEntity: Storable, DomainEntity: Mappable>(from dbEntity: DBEntity, target domainEntity: inout DomainEntity) {

        guard let managedObject: NSManagedObject = dbEntity as? NSManagedObject,
            let userDataModel = managedObject as? UserEntity,
            let userDomainModel = domainEntity as? User else { return }
        
        userDomainModel.address = Address()
        userDomainModel.address?.geo = Geo()
        userDomainModel.company = Company()
        
        userDomainModel.id = Int(userDataModel.id)
        userDomainModel.name = userDataModel.name ?? ""
        userDomainModel.username = userDataModel.username ?? ""
        userDomainModel.phone = userDataModel.phone
        userDomainModel.email = userDataModel.email
        userDomainModel.website = userDataModel.website
        userDomainModel.address?.city = userDataModel.address?.city
        userDomainModel.address?.street = userDataModel.address?.street
        userDomainModel.address?.suite = userDataModel.address?.suite
        userDomainModel.address?.zipcode = userDataModel.address?.zipcode
        userDomainModel.address?.geo?.lat = userDataModel.address?.geo?.lat ?? ""
        userDomainModel.address?.geo?.lng = userDataModel.address?.geo?.lng ?? ""
        userDomainModel.company?.name = userDataModel.company?.name ?? ""
        userDomainModel.company?.catchPhrase = userDataModel.company?.catchPhrase ?? ""
        userDomainModel.company?.bs = userDataModel.company?.bs ?? ""
        
        domainEntity.objectID = managedObject.objectID
    }
    
    func mapToDB<DomainEntity: Mappable, DBEntity: Storable>(from domainEntity: DomainEntity, target dbEntity: DBEntity) {

        let managedObject: NSManagedObject? = dbEntity as? NSManagedObject
        
        guard let userDataModel = managedObject as? UserEntity else { return }
        guard let userDomainModel: User = domainEntity as? User else { return }
                
        var addressEntity: AddressEntity?
        if userDataModel.address != nil {
            addressEntity = userDataModel.address
        } else {
            addressEntity = AddressEntity(context: (managedObject?.managedObjectContext)!)
            addressEntity?.geo = GeoEntity(context: (managedObject?.managedObjectContext)!)
        }
        
        var geoEntity: GeoEntity?
        if userDataModel.address?.geo != nil {
            geoEntity = userDataModel.address?.geo
        } else {
            geoEntity = GeoEntity(context: (managedObject?.managedObjectContext)!)
        }
        
        var companyEntity: CompanyEntity?
        if userDataModel.company != nil {
            companyEntity = userDataModel.company
        } else {
            companyEntity = CompanyEntity(context: (managedObject?.managedObjectContext)!)
        }
        
        userDataModel.id = Int32(userDomainModel.id)
        userDataModel.name = userDomainModel.name
        userDataModel.username = userDomainModel.username
        userDataModel.phone = userDomainModel.phone
        userDataModel.email = userDomainModel.email
        userDataModel.website = userDomainModel.website
        
        if let addressDomainModel = userDomainModel.address {
            addressEntity?.city = addressDomainModel.city
            addressEntity?.street = addressDomainModel.street
            addressEntity?.suite = addressDomainModel.suite
            addressEntity?.zipcode = addressDomainModel.zipcode
            
            if let geoDomainModel = addressDomainModel.geo {
                geoEntity?.lat = geoDomainModel.lat
                geoEntity?.lng = geoDomainModel.lng
                addressEntity?.geo = geoEntity
            }
            
            userDataModel.address = addressEntity
        }
        
        if let companyDomainModel = userDomainModel.company {
            companyEntity?.name = companyDomainModel.name
            companyEntity?.catchPhrase = companyDomainModel.catchPhrase
            companyEntity?.bs = companyDomainModel.bs
            
            userDataModel.company = companyEntity
        }
    }
}
