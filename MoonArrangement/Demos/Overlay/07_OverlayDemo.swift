//
//  File: 07_OverlayDemo.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - OverlayDemo

/// Стиль `overlay`: primary лежит ПОВЕРХ secondary. Здесь карточка — primary, луна — secondary.
/// Оба вида получают всю область; вид, не заполняющий её, прижимается к верхнему leading-углу,
/// поэтому карточка сдвигается вниз гибким `frame`. При частичном сгибе виды расходятся:
/// secondary — на leading-сторону сгиба, primary — на trailing.
///
/// The `overlay` style: the primary view is layered OVER the secondary one. Here the card is
/// primary and the moon is secondary. Both receive the whole area; a view that doesn't fill it
/// goes to the top leading corner, so a flexible `frame` moves the card down. When partially
/// folded the views separate: secondary to the leading side of the fold, primary to the trailing.
struct OverlayDemo: View {

    // MARK: Body

    var body: some View {
        MoonScreenContainer {
            ArrangementView {
                TonightCard()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            } secondary: {
                MoonBackdrop()
            }
            .arrangementViewStyle(.overlay)
        }
    }
}

// MARK: - Preview

#Preview("OverlayDemo - Light") {
    OverlayDemo()
        .preferredColorScheme(.light)
}

#Preview("OverlayDemo - Dark") {
    OverlayDemo()
        .preferredColorScheme(.dark)
}
