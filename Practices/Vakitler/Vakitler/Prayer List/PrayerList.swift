//
//  PrayerList.swift
//  Vakitler
//
//  Created by Ali Kolukirik on 13.03.2023.
//

import SwiftUI

struct PrayerList: View {
    var currrentPreviewTime: PrayerTimes = .fajr
    var body: some View {

        let textColor: Color = .textColor(for: currrentPreviewTime)

        VStack {
            VStack {
                Text("İstanbul, İstanbul, Türkiye")
                    .font(.captionText)
                    .foregroundColor(textColor)
                Spacer()
                VStack(spacing: 16) {
                    currrentPreviewTime.icon
                    Text(currrentPreviewTime.displayName)
                        .font(.bigTitle)
                        .foregroundColor(textColor)

                    Text("1 saat 20 dakika")
                        .font(.smallTitle)
                        .foregroundColor(textColor)
                        .padding(.horizontal,16)
                        .padding(.vertical, 16)
                        .background(RoundedRectangle(cornerRadius: 16)
                            .fill(textColor)
                            .opacity(0.1))
                }
                Spacer()
            }

            VStack (spacing: 0) {
                PrayerListItem(currentTime: currrentPreviewTime, time: .fajr)
                PrayerListItem(currentTime: currrentPreviewTime, time: .sun)
                PrayerListItem(currentTime: currrentPreviewTime, time: .dhuhr)
                PrayerListItem(currentTime: currrentPreviewTime, time: .asr)
                PrayerListItem(currentTime: currrentPreviewTime, time: .magrib)
                PrayerListItem(currentTime: currrentPreviewTime, time: .isha)
            }
        }
    }
}

struct PrayerList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PrayerList()
            PrayerList().previewDevice(PreviewDevice(stringLiteral: "iPhone 14 Pro Max"))
        }
    }
}
