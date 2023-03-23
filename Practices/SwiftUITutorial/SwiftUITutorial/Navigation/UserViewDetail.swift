//
//  UserViewDetail.swift
//  SwiftUITutorial
//
//  Created by Ali Kolukirik on 23.03.2023.
//

import SwiftUI

struct UserViewDetail: View {

    let user: NavigationUserModel

    var body: some View {
        Text(user.name ?? "").font(.largeTitle)
    }
}

struct UserViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserViewDetail(user: NavigationUserModel.samples.first!)
    }
}
