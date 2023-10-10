//
//  thedatainSwiftDataApp.swift
//  thedatainSwiftData
//
//  Created by duverney muriel on 4/10/23.
//

import SwiftUI
import SwiftData
@main
struct thedatainSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Video.self,MetaData.self])
    }
}
