//
//  SecondView.swift
//  FirstSwiftUIApp
//
//  Created by ali on 3.04.2022.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Image("morty").resizable()
            .frame(width: UIScreen.main.bounds.width * 0.6 , height: UIScreen.main.bounds.height * 0.3, alignment: .center)
            //.frame(width: 200, height: 200, alignment: .center)
            //.aspectRatio(contentMode: .fit)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SecondView()
            SecondView()
        }
    }
}
