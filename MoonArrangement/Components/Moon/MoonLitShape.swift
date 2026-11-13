//
//  File: MoonLitShape.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - MoonLitShape

/// Форма освещённой части лунного диска.
///
/// Левый лимб — полуокружность, терминатор — полуэллипс. При `illumination > 0.5`
/// терминатор выпуклый (убывающая/растущая «гиббозная» луна), при `< 0.5` — серп.
/// Освещена левая сторона; для правой используйте `.scaleEffect(x: -1)`.
///
/// Shape of the lit part of the lunar disc.
///
/// The left limb is a semicircle and the terminator is a half-ellipse. Above `0.5`
/// the terminator bulges outward (gibbous), below `0.5` it forms a crescent.
/// The left side is lit; mirror it with `.scaleEffect(x: -1)` for the right side.
struct MoonLitShape: Shape {

    // MARK: Properties

    /// Освещённая доля диска, 0...1. / Illuminated fraction, 0...1.
    var illumination: Double

    // MARK: Animatable

    var animatableData: Double {
        get { illumination }
        set { illumination = newValue }
    }

    // MARK: Shape

    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let clamped = min(max(illumination, 0), 1)
        let terminatorRadius = radius * (2 * clamped - 1)
        let steps = 90

        var path = Path()

        // Левый лимб сверху вниз. / Left limb, top to bottom.
        for step in 0...steps {
            let angle = Double.pi * Double(step) / Double(steps)
            let point = CGPoint(
                x: center.x - radius * sin(angle),
                y: center.y - radius * cos(angle)
            )
            if step == 0 { path.move(to: point) } else { path.addLine(to: point) }
        }

        // Терминатор снизу вверх. / Terminator, bottom to top.
        for step in stride(from: steps, through: 0, by: -1) {
            let angle = Double.pi * Double(step) / Double(steps)
            path.addLine(to: CGPoint(
                x: center.x + terminatorRadius * sin(angle),
                y: center.y - radius * cos(angle)
            ))
        }

        path.closeSubpath()
        return path
    }
}

// MARK: - Preview

#Preview("MoonLitShape - Light") {
    MoonLitShape(illumination: 0.78)
        .fill(MoonPalette.moonLight)
        .background(MoonPalette.skyTop)
        .preferredColorScheme(.light)
}

#Preview("MoonLitShape - Dark") {
    MoonLitShape(illumination: 0.78)
        .fill(MoonPalette.moonLight)
        .background(MoonPalette.skyTop)
        .preferredColorScheme(.dark)
}
