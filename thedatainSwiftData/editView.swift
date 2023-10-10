//
//  editView.swift
//  thedatainSwiftData
//
//  Created by duverney muriel on 8/10/23.
//

import SwiftUI

struct editView: View {
//    bindable crea un estado de uso que modifica el archivo padre.
    @Bindable var video: Video
    
    var body: some View {
        Form{
            TextField("edita la info aqui", text: $video.title)
            Toggle("Video favorito", isOn: $video.metadata.isFavorite)
        }
    }
}

