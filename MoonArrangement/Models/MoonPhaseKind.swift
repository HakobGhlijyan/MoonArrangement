//
//  File: MoonPhaseKind.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import Foundation

// MARK: - MoonPhaseKind

/// Тип лунной фазы, используемый в списке «Coming up».
///
/// Простая модель данных без UI-зависимостей, поэтому объявлена `nonisolated`
/// (иначе при `SWIFT_DEFAULT_ACTOR_ISOLATION = MainActor` её нельзя создавать вне главного актора).
///
/// A lunar phase kind used by the "Coming up" list.
///
/// A plain data model with no UI dependencies, so it is declared `nonisolated`
/// (otherwise it can't be created off the main actor under default MainActor isolation).
nonisolated enum MoonPhaseKind: String, CaseIterable, Identifiable, Hashable, Sendable {

    // MARK: Cases

    /// Полнолуние. / Full moon.
    case fullMoon
    /// Последняя четверть. / Last quarter.
    case lastQuarter
    /// Новолуние. / New moon.
    case newMoon
    /// Первая четверть. / First quarter.
    case firstQuarter

    // MARK: Identifiable

    /// Стабильный идентификатор. / Stable identifier.
    var id: String { rawValue }

    // MARK: Presentation data

    /// Название фазы для пользователя. / User-facing phase title.
    var title: String {
        switch self {
        case .fullMoon: "Full moon"
        case .lastQuarter: "Last quarter"
        case .newMoon: "New moon"
        case .firstQuarter: "First quarter"
        }
    }

    /// Доля освещённого диска от 0 до 1. / Illuminated fraction of the disc, 0 to 1.
    var illumination: Double {
        switch self {
        case .fullMoon: 1
        case .lastQuarter, .firstQuarter: 0.5
        case .newMoon: 0
        }
    }

    /// `true`, если освещена правая половина диска. / `true` when the trailing half is lit.
    var isLitOnTrailingSide: Bool {
        self == .firstQuarter
    }
}
