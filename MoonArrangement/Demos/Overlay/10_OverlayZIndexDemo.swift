//
//  File: 10_OverlayZIndexDemo.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - OverlayZIndexDemo

/// Адаптация к позиции в overlay через `@Environment(\.overlayArrangementZIndex)`:
/// поверх луны (индекс 1) панель — компактная карточка; после разделения (оба 0) —
/// расширенные детали со списком фаз.
///
/// Панель оборачиваем в `ZStack`: в Xcode 27.1 напрямую в замыкании индекс всегда читался как 0.
///
/// Adapting to the overlay position via `@Environment(\.overlayArrangementZIndex)`:
/// layered over the moon (index 1) the panel is a compact card; once separated (both 0)
/// it expands into details with the phases list.
///
/// The panel is wrapped in a `ZStack`: in Xcode 27.1 the index always read 0 directly in the closure.
struct OverlayZIndexDemo: View {

    // MARK: Body

    var body: some View {
        MoonScreenContainer {
            ArrangementView {
                ZStack {
                    TonightPanel()
                }
            } secondary: {
                MoonBackdrop()
            }
            .arrangementViewStyle(.overlay)
        }
    }
}

// MARK: - Preview

#Preview("OverlayZIndexDemo - Light") {
    OverlayZIndexDemo()
        .preferredColorScheme(.light)
}

#Preview("OverlayZIndexDemo - Dark") {
    OverlayZIndexDemo()
        .preferredColorScheme(.dark)
}
