//
//  NavigationUserModel.swift
//  SwiftUITutorial
//
//  Created by Ali Kolukirik on 21.03.2023.
//

import Foundation

struct NavigationUserModel: Identifiable {
    let id: UUID = UUID()
    let name: String?
}

extension NavigationUserModel {
    ///Sample navigation user model.
    static let samples: [NavigationUserModel] = [
    NavigationUserModel(name: "Ali"),
    NavigationUserModel(name: "Ali1"),
    NavigationUserModel(name: "Ali2"),
    NavigationUserModel(name: "Ali3")]
}
