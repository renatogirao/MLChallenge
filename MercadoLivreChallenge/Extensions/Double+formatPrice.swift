//
//  Double+formatPrice.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import Foundation

enum CurrencyID: String {
    case brl = "BRL"
    case ars = "ARS"
    case mxn = "MXN"

    func currencySymbol() -> String {
        switch self {
        case .brl: return "R$"
        case .ars: return "$"
        case .mxn: return "$"
        }
    }
}

extension Double {
    func formattedCurrency(for currency: CurrencyID) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency.rawValue
        formatter.locale = Locale(identifier: currency == .brl ? "pt_BR" : "en_US")
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
