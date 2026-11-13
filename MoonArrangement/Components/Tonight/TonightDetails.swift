//
//  File: TonightDetails.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - TonightDetails

/// Расширенное представление: карточка «Tonight» плюс список ближайших фаз.
/// Показывается, когда у панели появилось место (например, при частичном сгибе).
///
/// Expanded presentation: the "Tonight" card plus the upcoming phases list.
/// Shown when the panel gets room (for example, when partially folded).
struct TonightDetails: View {

    // MARK: Body

    var body: some View {
        VStack {
            TonightCard()
            UpcomingPhasesList()
        }
    }
}

// MARK: - Preview

#Preview("TonightDetails - Light") {
    TonightDetails()
        .background { NightSkyBackground() }
        .preferredColorScheme(.light)
}

#Preview("TonightDetails - Dark") {
    TonightDetails()
        .background { NightSkyBackground() }
        .preferredColorScheme(.dark)
}
