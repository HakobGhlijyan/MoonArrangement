//
//  File: MoonCratersShape.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - MoonCratersShape

/// Набор кратеров в относительных координатах (0...1) квадрата луны.
///
/// A set of craters expressed in unit coordinates (0...1) of the moon's square.
struct MoonCratersShape: Shape {

    // MARK: Data

    /// Кратеры: центр (x, y) и радиус относительно стороны. / Craters: center (x, y) and relative radius.
    private let craters: [(x: Double, y: Double, radius: Double)] = [
        (0.32, 0.30, 0.11),
        (0.62, 0.22, 0.07),
        (0.50, 0.58, 0.16),
        (0.24, 0.62, 0.08),
        (0.74, 0.66, 0.09),
        (0.38, 0.86, 0.05)
    ]

    // MARK: Shape

    func path(in rect: CGRect) -> Path {
        let side = min(rect.width, rect.height)
        var path = Path()
        for crater in craters {
            let radius = side * crater.radius
            let center = CGPoint(x: rect.minX + side * crater.x, y: rect.minY + side * crater.y)
            path.addEllipse(in: CGRect(
                x: center.x - radius,
                y: center.y - radius,
                width: radius * 2,
                height: radius * 2
            ))
        }
        return path
    }
}

// MARK: - Preview

#Preview("MoonCratersShape - Light") {
    MoonCratersShape()
        .fill(.gray)
        .aspectRatio(1, contentMode: .fit)
        .preferredColorScheme(.light)
}

#Preview("MoonCratersShape - Dark") {
    MoonCratersShape()
        .fill(.gray)
        .aspectRatio(1, contentMode: .fit)
        .preferredColorScheme(.dark)
}
