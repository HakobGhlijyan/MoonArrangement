//
//  File: 01_DefaultArrangementDemo.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - DefaultArrangementDemo

/// Поведение по умолчанию: стиль `automatic` → `split`.
/// Внешний экран (портрет): primary над secondary. Внутренний: рядом, по половине ширины.
/// При частичном сгибе каждый вид занимает свою сторону сгиба.
///
/// Default behavior: the `automatic` style resolves to `split`.
/// Outer display (portrait): primary above secondary. Inner display: side by side, half the width each.
/// Partially folded: each view takes its own side of the fold.
struct DefaultArrangementDemo: View {

    // MARK: Body

    var body: some View {
        MoonScreenContainer {
            ArrangementView {
                TonightView()
            } secondary: {
                UpcomingPhasesList()
            }
        }
    }
}

// MARK: - Preview

#Preview("DefaultArrangementDemo - Light") {
    DefaultArrangementDemo()
        .preferredColorScheme(.light)
}

#Preview("DefaultArrangementDemo - Dark") {
    DefaultArrangementDemo()
        .preferredColorScheme(.dark)
}
