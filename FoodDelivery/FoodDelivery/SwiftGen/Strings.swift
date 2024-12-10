// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Authpage {
    internal enum Button {
      /// Forgot password?
      internal static let forgot = L10n.tr("Localizable", "Authpage.button.forgot", fallback: "Forgot password?")
      /// Sign In
      internal static let signin = L10n.tr("Localizable", "Authpage.button.signin", fallback: "Sign In")
      /// Sign Up
      internal static let signup = L10n.tr("Localizable", "Authpage.button.signup", fallback: "Sign Up")
    }
    internal enum Label {
      /// Or connect with
      internal static let connections = L10n.tr("Localizable", "Authpage.label.connections", fallback: "Or connect with")
      /// Sign In
      internal static let signin = L10n.tr("Localizable", "Authpage.label.signin", fallback: "Sign In")
      /// Sign Up
      internal static let signup = L10n.tr("Localizable", "Authpage.label.signup", fallback: "Sign Up")
    }
    internal enum Textfield {
      internal enum Signin {
        internal enum Password {
          /// Password
          internal static let placeholder = L10n.tr("Localizable", "Authpage.textfield.signin.password.placeholder", fallback: "Password")
        }
        internal enum Username {
          /// Username
          internal static let placeholder = L10n.tr("Localizable", "Authpage.textfield.signin.username.placeholder", fallback: "Username")
        }
      }
      internal enum Signup {
        internal enum Password {
          /// Enter password
          internal static let placeholder = L10n.tr("Localizable", "Authpage.textfield.signup.password.placeholder", fallback: "Enter password")
        }
        internal enum Reenterpassword {
          /// Re-enter password
          internal static let placeholder = L10n.tr("Localizable", "Authpage.textfield.signup.reenterpassword.placeholder", fallback: "Re-enter password")
        }
        internal enum Username {
          /// Enter username
          internal static let placeholder = L10n.tr("Localizable", "Authpage.textfield.signup.username.placeholder", fallback: "Enter username")
        }
      }
    }
  }
  internal enum InvalidInput {
    /// Invalid email address
    internal static let email = L10n.tr("Localizable", "InvalidInput.email", fallback: "Invalid email address")
    internal enum Password {
      /// Password must contain at least one capital letter
      internal static let capitalletter = L10n.tr("Localizable", "InvalidInput.password.capitalletter", fallback: "Password must contain at least one capital letter")
      /// Password mustn't be longer than 50 characters
      internal static let long = L10n.tr("Localizable", "InvalidInput.password.long", fallback: "Password mustn't be longer than 50 characters")
      /// Passwords must match
      internal static let mismatch = L10n.tr("Localizable", "InvalidInput.password.mismatch", fallback: "Passwords must match")
      /// Password mustn't contain non-latin letters
      internal static let nonlatin = L10n.tr("Localizable", "InvalidInput.password.nonlatin", fallback: "Password mustn't contain non-latin letters")
      /// Password must contain at least one number
      internal static let nonumbers = L10n.tr("Localizable", "InvalidInput.password.nonumbers", fallback: "Password must contain at least one number")
      /// Password must be at least 8 characters long
      internal static let short = L10n.tr("Localizable", "InvalidInput.password.short", fallback: "Password must be at least 8 characters long")
    }
    internal enum Required {
      /// This field is required
      internal static let empty = L10n.tr("Localizable", "InvalidInput.required.empty", fallback: "This field is required")
    }
    internal enum Username {
      /// Username mustn't be longer than 50 characters
      internal static let long = L10n.tr("Localizable", "InvalidInput.username.long", fallback: "Username mustn't be longer than 50 characters")
      /// Username must be at least 2 characters long
      internal static let short = L10n.tr("Localizable", "InvalidInput.username.short", fallback: "Username must be at least 2 characters long")
    }
  }
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
