// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Constants {
  /// https://api.coingecko.com/api/v3
  internal static let baseUrl = Constants.tr("Localizable", "BaseUrl", fallback: "https://api.coingecko.com/api/v3")
  /// Best Coin
  internal static let bestCoin = Constants.tr("Localizable", "Best Coin", fallback: "Best Coin")
  /// BestCellCoin
  internal static let bestCell = Constants.tr("Localizable", "BestCell", fallback: "BestCellCoin")
  /// Cap/Vol
  internal static let capAndVol = Constants.tr("Localizable", "capAndVol", fallback: "Cap/Vol")
  /// /coins/markets
  internal static let coinsMarket = Constants.tr("Localizable", "CoinsMarket", fallback: "/coins/markets")
  /// Header
  internal static let collectionHeader = Constants.tr("Localizable", "CollectionHeader", fallback: "Header")
  /// Current price
  internal static let currentPrice = Constants.tr("Localizable", "Current price", fallback: "Current price")
  /// Favorite
  internal static let favorite = Constants.tr("Localizable", "favorite", fallback: "Favorite")
  /// Localizable.strings
  ///   Simpleswap
  internal static let home = Constants.tr("Localizable", "home", fallback: "Home")
  /// en
  internal static let local = Constants.tr("Localizable", "Local", fallback: "en")
  /// Market
  internal static let market = Constants.tr("Localizable", "market", fallback: "Market")
  /// market_cap_desc
  internal static let marketCap = Constants.tr("Localizable", "MarketCap", fallback: "market_cap_desc")
  /// Name
  internal static let nameLabel = Constants.tr("Localizable", "nameLabel", fallback: "Name")
  /// 1
  internal static let page = Constants.tr("Localizable", "Page", fallback: "1")
  /// Price Change 24h
  internal static let priceChange = Constants.tr("Localizable", "Price Change", fallback: "Price Change 24h")
  /// Price/24h Change
  internal static let priceAnd24Change = Constants.tr("Localizable", "priceAnd24Change", fallback: "Price/24h Change")
  /// 100
  internal static let resultPage = Constants.tr("Localizable", "ResultPage", fallback: "100")
  /// Search...
  internal static let search = Constants.tr("Localizable", "search", fallback: "Search...")
  /// false
  internal static let sparkLine = Constants.tr("Localizable", "SparkLine", fallback: "false")
  /// TopCellCoin
  internal static let topCell = Constants.tr("Localizable", "TopCell", fallback: "TopCellCoin")
  /// Top 4 Coin
  internal static let topFourCoin = Constants.tr("Localizable", "TopFourCoin", fallback: "Top 4 Coin")
  /// TopTwentyCellCoin
  internal static let topTwentyCell = Constants.tr("Localizable", "TopTwentyCell", fallback: "TopTwentyCellCoin")
  /// Top 20 Coin
  internal static let topTwentyCoin = Constants.tr("Localizable", "TopTwentyCoin", fallback: "Top 20 Coin")
  /// Trade
  internal static let trade = Constants.tr("Localizable", "trade", fallback: "Trade")
  /// usd
  internal static let usd = Constants.tr("Localizable", "Usd", fallback: "usd")
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
