//
//  File: SeededGenerator.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

// MARK: - SeededGenerator

/// Детерминированный генератор случайных чисел (SplitMix64).
/// Нужен, чтобы звёзды не «прыгали» при каждой перерисовке.
///
/// Deterministic random number generator (SplitMix64).
/// Keeps the stars in place across redraws.
nonisolated struct SeededGenerator: RandomNumberGenerator, Sendable {

    // MARK: State

    private var state: UInt64

    // MARK: Init

    /// - Parameter seed: Начальное значение. / Initial seed.
    init(seed: UInt64) {
        state = seed
    }

    // MARK: RandomNumberGenerator

    mutating func next() -> UInt64 {
        state &+= 0x9E37_79B9_7F4A_7C15
        var z = state
        z = (z ^ (z >> 30)) &* 0xBF58_476D_1CE4_E5B9
        z = (z ^ (z >> 27)) &* 0x94D0_49BB_1331_11EB
        return z ^ (z >> 31)
    }
}
