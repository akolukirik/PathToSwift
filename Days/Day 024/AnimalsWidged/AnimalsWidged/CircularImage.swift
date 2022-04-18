//
//  CircularImage.swift
//  AnimalsWidged
//
//  Created by ali on 15.04.2022.
//

import SwiftUI

struct CircularImage: View {
    var image : Image
    var body: some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.blue,lineWidth: 10))
            .shadow(radius: 1)
    }
}

struct CircularImage_Previews: PreviewProvider {
    static var previews: some View {
        CircularImage(image : Image("shark"))
    }
}
