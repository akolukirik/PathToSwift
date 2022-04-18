//
//  AnimalView.swift
//  AnimalsWidged
//
//  Created by ali on 15.04.2022.
//

import SwiftUI

struct AnimalView: View {
    let animal : Animals

    var body: some View {
        HStack {
            CircularImage(image: Image(animal.image)).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                .padding()

            VStack{
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                Text(animal.name).fontWeight(.light)
            }.padding()
            Spacer()
        }.frame(width: UIScreen.main.bounds.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

    }
}

struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalView(animal: shark)
    }
}
