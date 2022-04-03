//
//  fifthView.swift
//  FirstSwiftUIApp
//
//  Created by ali on 3.04.2022.
//

import SwiftUI

struct FifthView: View {

    @State var myName = "Rick"
    var body: some View {
        VStack {
            Text(myName)
                .padding()
                .font(.largeTitle)
            TextField("PlaceHolder", text: $myName)
        }
    }
}

struct fifthView_Previews: PreviewProvider {
    static var previews: some View {
        FifthView()
    }
}
