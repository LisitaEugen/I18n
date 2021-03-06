//
//  I18nViewModel.swift
//  I18nApp
//
//  Created by Evgheni Lisita on 12.09.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import Foundation
import Combine

class I18nViewModel: ObservableObject {
    var locale: Locale = Locale.current
    
    let number = 1234.2456
    let pressureBars: Measurement<UnitPressure> = Measurement<UnitPressure>(value: 12.5, unit: .poundsForcePerSquareInch)
    let dateNow: Date = Date()
    
    let numberFormatter = NumberFormatter()
    let measurementFormatter = MeasurementFormatter()
    let dateFormatter = DateFormatter()
    
    @Published var selectedTab: Int = 0 {
        didSet {
            switch selectedTab {
            case 0:
                setLocale("en_US")
            case 1:
                setLocale("ru_RU")
            case 2:
                setLocale("ja_JP")
            default:
                setLocale("en_US")
            }
        }
    }

    func setLocale(_ localeIdentifier: String) {
        locale = Locale(identifier: localeIdentifier)
    }

    var formattedNumber: String? {
        numberFormatter.locale = locale
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number))
    }
    
    var formattedPrice: String? {
        numberFormatter.locale = locale
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(from: NSNumber(value: number))
    }
    
    var formattedPressure: String? {
        measurementFormatter.locale = locale
        measurementFormatter.unitStyle = .short
        return measurementFormatter.string(from: pressureBars)
    }
    
    var formattedDate: String? {
        dateFormatter.locale = locale
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: dateNow)
    }
}
