import Foundation

enum KonserveBoyut {
    case Kucuk
    case Orta
    case Buyuk
}

func ucretHesapla(adet: Int, boyut: KonserveBoyut) {
    switch boyut {
    case .Kucuk:
        print("Fiyat \(adet*10)")
    case .Orta:
        print("Fiyat \(adet*20)")
    case .Buyuk:
        print("Fiyat \(adet*30)")
    }
}

ucretHesapla(adet: 2, boyut: .Buyuk)
