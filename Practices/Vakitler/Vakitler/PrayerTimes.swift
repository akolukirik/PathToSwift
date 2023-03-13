//
//  PrayerTimes.swift
//  Vakitler
//
//  Created by Ali Kolukirik on 13.03.2023.
//

import SwiftUI

enum PrayerTimes: String {
    case fajr
    case sun
    case dhuhr
    case asr
    case magrib
    case isha

    var displayName: String {
        switch self {
        case .fajr:
            return NSLocalizedString("PRAYER_DISPLAY_FAJR", comment: "Fajr time display name")
        case .sun:
            return NSLocalizedString("PRAYER_DISPLAY_SUN", comment: "Sunrise time display name")
        case .dhuhr:
            return NSLocalizedString("PRAYER_DISPLAY_DHUHR", comment: "Dhuhr time display name")
        case .asr:
            return NSLocalizedString("PRAYER_DISPLAY_ASR", comment: "Asr time display name")
        case .magrib:
            return NSLocalizedString("PRAYER_DISPLAY_MAGRIB", comment: "Magrib time display name")
        case .isha:
            return NSLocalizedString("PRAYER_DISPLAY_ISHA", comment: "Isha time display name")
        }
    }

    var icon: Image {
        return Image(rawValue)
    }
}
