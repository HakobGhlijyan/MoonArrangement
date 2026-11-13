//
//  File: TonightPanel.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - TonightPanel

/// Панель, которая подстраивается под положение в overlay-раскладке:
/// пока лежит поверх луны (`zIndex > 0`) — компактная карточка,
/// после разделения (`zIndex == 0`) — расширенные детали.
///
/// Важно: в Xcode 27.1 `overlayArrangementZIndex` читался как `0`, если панель стояла
/// прямо в замыкании `ArrangementView`; обёртка в `ZStack` решает проблему.
///
/// A panel that adapts to its position in an overlay arrangement:
/// compact card while layered over the moon (`zIndex > 0`),
/// expanded details once separated (`zIndex == 0`).
///
/// Note: in Xcode 27.1 `overlayArrangementZIndex` read `0` when the panel sat directly
/// in the `ArrangementView` closure; wrapping it in a `ZStack` fixes that.
struct TonightPanel: View {

    // MARK: Environment

    /// Порядок наложения: 1 у основного вида поверх, 0 у остальных/разделённых.
    /// Stacking index: 1 for the layered primary view, 0 otherwise or once separated.
    @Environment(\.overlayArrangementZIndex) private var zIndex

    // MARK: Body

    var body: some View {
        if zIndex > 0 {
            TonightCard()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        } else {
            TonightDetails()
        }
    }
}

// MARK: - Preview

#Preview("TonightPanel - Light") {
    TonightPanel()
        .background { NightSkyBackground() }
        .preferredColorScheme(.light)
}

#Preview("TonightPanel - Dark") {
    TonightPanel()
        .background { NightSkyBackground() }
        .preferredColorScheme(.dark)
}
