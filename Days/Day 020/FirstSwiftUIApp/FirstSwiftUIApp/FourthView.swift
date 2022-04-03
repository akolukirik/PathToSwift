//
//  FourthView.swift
//  FirstSwiftUIApp
//
//  Created by ali on 3.04.2022.
//

import SwiftUI

struct FourthView: View {

   @State var myName = "Ali"

    var body: some View {
        VStack {
            Text(myName)
                .font(.largeTitle)
                .padding()
            Button {
                self.myName = "Test"
            } label: {
                Text("Dünyanın En Güzel Butonu")
            }  
        }
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
