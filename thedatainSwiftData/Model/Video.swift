//
//  Video.swift
//  thedatainSwiftData
//
//  Created by duverney muriel on 4/10/23.
//

import Foundation
import SwiftData

@Model
class Video{
//    macro para hacer que se genere un id unico
    
    @Attribute(.unique) var id: UUID
    var title: String
    
//    hace que la variable no sea persistente en la base de datos.
   @Transient var numbersLike: Int {title.count}
    
    @Relationship() var metadata: MetaData

    
    init(id: UUID, title: String, metadata: MetaData) {
        self.id = id
        self.title = title
        self.metadata = metadata
    }
}

@Model
class MetaData {
    var isFavorite : Bool
    
    init(isFavorite: Bool) {
        self.isFavorite = isFavorite
    }
}
