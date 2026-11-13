//
//  File: MoonBackdrop.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - MoonBackdrop

/// Крупная луна как фон в overlay-раскладке (secondary-вид).
///
/// A large moon used as the backdrop of the overlay arrangement (secondary view).
struct MoonBackdrop: View {

    // MARK: Properties

    /// Освещённая доля диска, 0...1. / Illuminated fraction, 0...1.
    var illumination: Double = TonightMoon.sample.illumination

    // MARK: Body

    var body: some View {
        MoonDiscView(illumination: illumination)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Preview

#Preview("MoonBackdrop - Light") {
    MoonBackdrop()
        .background { NightSkyBackground() }
        .preferredColorScheme(.light)
}

#Preview("MoonBackdrop - Dark") {
    MoonBackdrop()
        .background { NightSkyBackground() }
        .preferredColorScheme(.dark)
}
