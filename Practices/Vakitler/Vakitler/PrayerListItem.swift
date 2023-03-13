//
//  PrayerListItem.swift
//  Vakitler
//
//  Created by Ali Kolukirik on 13.03.2023.
//

import SwiftUI

struct PrayerListItem: View {

    var currentTime: PrayerTimes = .asr

    var body: some View {
        HStack {
            Text("Dhuhr")
                .font(.mainText)
                .foregroundColor(.textColor(for: currentTime))
            Spacer()
            Text("14:25")
                .font(.mainText)
                .foregroundColor(.textColor(for: currentTime))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 19)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.textColor(for: currentTime) ,lineWidth: 2))
        .padding(10)
    }
}

struct PrayerListItem_Previews: PreviewProvider {
    static var previews: some View {
        PrayerListItem()
    }
}
