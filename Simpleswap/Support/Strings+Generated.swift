// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Constants {
  /// Cap/Vol
  internal static let capAndVol = Constants.tr("Localizable", "capAndVol", fallback: "Cap/Vol")
  /// Localizable.strings
  ///   Simpleswap
  /// 
  ///   Created by Podgainy Sergei on 26.04.2023.
  internal static let home = Constants.tr("Localizable", "home", fallback: "Home")
  /// Market
  internal static let market = Constants.tr("Localizable", "market", fallback: "Market")
  /// Name
  internal static let nameLabel = Constants.tr("Localizable", "nameLabel", fallback: "Name")
  /// Price/24h Change
  internal static let priceAnd24Change = Constants.tr("Localizable", "priceAnd24Change", fallback: "Price/24h Change")
  /// Search...
  internal static let search = Constants.tr("Localizable", "search", fallback: "Search...")
  /// Trade
  internal static let trade = Constants.tr("Localizable", "trade", fallback: "Trade")
  /// https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en
  internal static let urlString = Constants.tr("Localizable", "URLString", fallback: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Constants {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
