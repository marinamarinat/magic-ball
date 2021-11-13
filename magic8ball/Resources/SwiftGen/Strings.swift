// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// gearshape.fill
  internal static let gearshapeImage = L10n.tr("Strings", "gearshapeImage")
  /// https://8ball.delegator.com/magic/JSON/3Cquestion_string3E
  internal static let url = L10n.tr("Strings", "url")

  internal enum AddAction {
    /// Add
    internal static let title = L10n.tr("Strings", "addAction.title")
  }

  internal enum Alert {
    /// Add custom answer
    internal static let message = L10n.tr("Strings", "alert.message")
    /// 
    internal static let title = L10n.tr("Strings", "alert.title")
  }

  internal enum CancelAction {
    /// Cancel
    internal static let title = L10n.tr("Strings", "cancelAction.title")
  }

  internal enum Error {
    /// init(coder:) has not been implemented
    internal static let initCoder = L10n.tr("Strings", "error.initCoder")
  }

  internal enum SettingsViewController {
    /// Settings
    internal static let title = L10n.tr("Strings", "settingsViewController.title")
  }

  internal enum ShakeMessage {
    /// Ask the question and shake your phone!
    internal static let title = L10n.tr("Strings", "shakeMessage.title")
  }

  internal enum TextField {
    /// Answer
    internal static let placeholder = L10n.tr("Strings", "textField.placeholder")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
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
