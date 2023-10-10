//
//  ContentView.swift
//  thedatainSwiftData
//
//  Created by duverney muriel on 4/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //    Puedes usar "environment" para acceder a propiedades y valores específicos del entorno, como el color del fondo, el idioma actual, el modo oscuro, la fuente de texto, etc. Por ejemplo, para acceder al color del fondo en SwiftUI, podrías hacerlo de la siguiente manera:
    @Environment(\.modelContext) var modelContext
    @Query var videos: [Video]
    var body: some View {
        NavigationStack{
            List{
                ForEach(videos) {video in
                    NavigationLink(value:video){
                        HStack{
                            Text(video.title)
                            Spacer()
                            if video.metadata.isFavorite{
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                
                            }
                        }
                    }
                    .swipeActions(edge: .leading){
                        Button {
                            
                        } label: {
                            Image(systemName: "star.fill").tint(.blue)
                        }

                        
                    }
                }
            }.navigationTitle("Futuros  mi papa")
                .navigationDestination(for: Video.self, destination:{video in
                    editView(video: video)
                })
                .toolbar{
                    ToolbarItem{
                        Button(action: {
                            withAnimation {
                                let newVideo = Video(id: .init(), title: "siseñores", metadata: .init(isFavorite: true))
                                modelContext.insert(newVideo)
                            }
                        }, label: {
                            Label("add item", systemImage: "plus")
                        })
                    }
                    
                    ToolbarItem{
                        Button(action: {
                            withAnimation {
                                videos.forEach {
                                    modelContext.delete($0)
                                    
                                }
                                try? modelContext.save()
                            }
                        }, label: {
                            Label("delete Item", systemImage: "trash")
                        })
                    }
                    
                }
            
            
            
        }
    }
}
    #Preview {
        ContentView()
    }

