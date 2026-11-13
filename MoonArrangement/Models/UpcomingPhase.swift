//
//  File: UpcomingPhase.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import Foundation

// MARK: - UpcomingPhase

/// Предстоящая лунная фаза с датой наступления.
///
/// Upcoming lunar phase with the date it occurs.
nonisolated struct UpcomingPhase: Identifiable, Hashable, Sendable {

    // MARK: Properties

    /// Тип фазы. / Phase kind.
    let kind: MoonPhaseKind

    /// Дата наступления. / Date of occurrence.
    let date: Date

    /// Идентификатор совпадает с типом фазы (в списке каждая фаза одна).
    /// The identifier equals the phase kind (each phase appears once in the list).
    var id: MoonPhaseKind { kind }

    // MARK: Sample data

    /// Демонстрационные данные, как на скриншотах статьи.
    /// Sample data matching the article screenshots.
    nonisolated static let sample: [UpcomingPhase] = [
        UpcomingPhase(kind: .fullMoon, date: makeDate(year: 2026, month: 10, day: 26)),
        UpcomingPhase(kind: .lastQuarter, date: makeDate(year: 2026, month: 11, day: 1)),
        UpcomingPhase(kind: .newMoon, date: makeDate(year: 2026, month: 11, day: 9)),
        UpcomingPhase(kind: .firstQuarter, date: makeDate(year: 2026, month: 11, day: 17))
    ]

    // MARK: Helpers

    /// Создаёт дату по григорианскому календарю. / Builds a Gregorian date.
    private nonisolated static func makeDate(year: Int, month: Int, day: Int) -> Date {
        Calendar(identifier: .gregorian)
            .date(from: DateComponents(year: year, month: month, day: day)) ?? .distantPast
    }
}
