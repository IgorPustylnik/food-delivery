// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Onboarding {
    internal enum Button {
      /// Great!
      internal static let last = L10n.tr("Localizable", "Onboarding.button.last", fallback: "Great!")
      /// Next
      internal static let next = L10n.tr("Localizable", "Onboarding.button.next", fallback: "Next")
    }
    internal enum Page1 {
      /// Lorem ipsum dolor sit amet, consectetur adipiscing elit.
      internal static let description = L10n.tr("Localizable", "Onboarding.page1.description", fallback: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
      /// Delicious Food
      internal static let title = L10n.tr("Localizable", "Onboarding.page1.title", fallback: "Delicious Food")
    }
    internal enum Page2 {
      /// Lorem ipsum dolor sit amet, consectetur adipiscing elit.
      internal static let description = L10n.tr("Localizable", "Onboarding.page2.description", fallback: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
      /// Fast Shipping
      internal static let title = L10n.tr("Localizable", "Onboarding.page2.title", fallback: "Fast Shipping")
    }
    internal enum Page3 {
      /// Lorem ipsum dolor sit amet, consectetur adipiscing elit.
      internal static let description = L10n.tr("Localizable", "Onboarding.page3.description", fallback: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
      /// Highest Quality
      internal static let title = L10n.tr("Localizable", "Onboarding.page3.title", fallback: "Highest Quality")
    }
    internal enum Page4 {
      /// Lorem ipsum dolor sit amet, consectetur adipiscing elit.
      internal static let description = L10n.tr("Localizable", "Onboarding.page4.description", fallback: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
      /// Pay Online
      internal static let title = L10n.tr("Localizable", "Onboarding.page4.title", fallback: "Pay Online")
    }
  }
  internal enum TabBar {
    internal enum Favorites {
      /// Favorites
      internal static let title = L10n.tr("Localizable", "TabBar.favorites.title", fallback: "Favorites")
    }
    internal enum Home {
      /// Localizable.strings
      ///   FoodDelivery
      /// 
      ///   Created by Игорь Пустыльник on 02.12.2024.
      internal static let title = L10n.tr("Localizable", "TabBar.home.title", fallback: "Home")
    }
    internal enum Order {
      /// Order
      internal static let title = L10n.tr("Localizable", "TabBar.order.title", fallback: "Order")
    }
    internal enum Profile {
      /// Profile
      internal static let title = L10n.tr("Localizable", "TabBar.profile.title", fallback: "Profile")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
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
