//
//  PrayerListItem.swift
//  Vakitler
//
//  Created by Ali Kolukirik on 13.03.2023.
//

import SwiftUI

struct PrayerListItem: View {

    var currentTime: PrayerTimes = .asr
    var time: PrayerTimes = .dhuhr


    var body: some View {

        let textColor: Color = .textColor(for: currentTime)

        HStack {
            Text(time.displayName)
                .font(.mainText)
                .foregroundColor(.textColor(for: currentTime))
            Spacer()
            Text(time.displayTime)
                .font(.mainText)
                .foregroundColor(.textColor(for: currentTime))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 19)
        .overlay(RoundedRectangle(
            cornerRadius: 16)
            .stroke(
            textColor,
            lineWidth: currentTime == time ? 2 : 0)
        )
        .padding(10)
        .background(Color.backgroundColor(for: currentTime, target: time))
    }
}

struct PrayerListItem_Previews: PreviewProvider {
    static var previews: some View {
        let currrentPreviewTime : PrayerTimes = .isha
        VStack (spacing: 0) {
            PrayerListItem(currentTime: currrentPreviewTime, time: .fajr).previewLayout(.fixed(width: 375, height: 78))
            PrayerListItem(currentTime: currrentPreviewTime, time: .sun).previewLayout(.fixed(width: 375, height: 78))
            PrayerListItem(currentTime: currrentPreviewTime, time: .dhuhr).previewLayout(.fixed(width: 375, height: 78))
            PrayerListItem(currentTime: currrentPreviewTime, time: .asr
            ).previewLayout(.fixed(width: 375, height: 78))
            PrayerListItem(currentTime: currrentPreviewTime, time: .magrib).previewLayout(.fixed(width: 375, height: 78))
            PrayerListItem(currentTime: currrentPreviewTime, time: .isha).previewLayout(.fixed(width: 375, height: 78))
        }
    }
}
