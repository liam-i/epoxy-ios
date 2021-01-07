// Created by eric_horacek on 12/1/20.
// Copyright © 2020 Airbnb Inc. All rights reserved.

import EpoxyCore

// MARK: - AlternateStyleIDStringProviding

/// TODO: Replace this with `AlternateStyleIDProviding` once we no longer require that
/// `AlternateStyleID` is a `String`.
public protocol AlternateStyleIDStringProviding {
  /// An optional ID for an alternative style type to use for reuse of a view.
  ///
  /// Use this to differentiate between different styling configurations.
  var alternateStyleID: String? { get }
}

// MARK: - EpoxyModeled

extension EpoxyModeled where Self: AlternateStyleIDStringProviding {

  // MARK: Public

  public var alternateStyleID: String? {
    get { self[alternateStyleIDProperty] }
    set { self[alternateStyleIDProperty] = newValue }
  }

  /// Returns a copy of this model with the `alternateStyleID` replaced with the provided `value`.
  public func alternateStyleID(_ value: String?) -> Self {
    copy(updating: alternateStyleIDProperty, to: value)
  }

  // MARK: Private

  private var alternateStyleIDProperty: EpoxyModelProperty<String?> {
    .init(
      keyPath: \AlternateStyleIDStringProviding.alternateStyleID,
      defaultValue: nil,
      updateStrategy: .replace)
  }
}
