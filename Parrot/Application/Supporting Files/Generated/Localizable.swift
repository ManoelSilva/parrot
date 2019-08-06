// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum Common {
    /// Deletar
    internal static let delete = L10n.tr("Localizable", "common.delete")
    /// Editar
    internal static let edit = L10n.tr("Localizable", "common.edit")
    /// O que vc esta sentindo?
    internal static let feeling = L10n.tr("Localizable", "common.feeling")
    /// @
    internal static let identifier = L10n.tr("Localizable", "common.identifier")
    /// Sair
    internal static let logout = L10n.tr("Localizable", "common.logout")
    /// Ok
    internal static let ok = L10n.tr("Localizable", "common.ok")
    /// Postagem
    internal static let post = L10n.tr("Localizable", "common.post")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
