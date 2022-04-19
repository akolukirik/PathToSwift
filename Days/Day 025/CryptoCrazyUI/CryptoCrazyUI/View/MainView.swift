//
//  ContentView.swift
//  CryptoCrazyUI
//
//  Created by ali on 19.04.2022.
//

import SwiftUI

struct MainView: View {

    @ObservedObject var cryptoListViewModel : CryptoListViewModel

    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }

    var body: some View {
        NavigationView{
            List(cryptoListViewModel.cryptoList,id:\.id) { crypto in
                VStack{
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text(crypto.price)
                        .foregroundColor(.purple)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .toolbar(content: {
                Button {
                    Task.init {
                        await cryptoListViewModel.downloadCryptosContinuation(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
                    }
                } label: {
                    Text("Refresh")
                }
            })
            .navigationTitle(Text("Crypto Crazy"))
        }.task{
            /*await cryptoListViewModel.downloadCryptosAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)*/
            await cryptoListViewModel.downloadCryptosContinuation(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
        /*.onAppear {
         cryptoListViewModel.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
         }*/
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
