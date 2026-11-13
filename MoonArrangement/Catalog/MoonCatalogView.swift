//
//  File: MoonCatalogView.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - MoonCatalogView

/// Каталог вариаций `ArrangementView`: выбираем демо в меню внизу и смотрим результат на весь экран.
/// Демо не пушатся в общий стек — у каждого свой `NavigationStack`, поэтому переключение через меню.
///
/// Catalog of `ArrangementView` variations: pick a demo in the bottom menu and see it full screen.
/// Demos aren't pushed onto a shared stack — each owns a `NavigationStack`, hence the menu switch.
struct MoonCatalogView: View {

    // MARK: State

    /// Выбранное демо. / Selected demo.
    @State private var selection: MoonDemo = .defaultArrangement

    // MARK: Body

    var body: some View {
        demo(for: selection)
            .id(selection)
            .safeAreaInset(edge: .bottom) {
                picker
            }
    }

    // MARK: Subviews

    /// Меню выбора демо. / Demo picker menu.
    private var picker: some View {
        Menu {
            Picker("Demo", selection: $selection) {
                ForEach(MoonDemo.allCases) { demo in
                    Text(demo.title).tag(demo)
                }
            }
        } label: {
            VStack {
                Text(selection.title)
                    .font(.subheadline)
                    .bold()
                Text(selection.summary)
                    .font(.caption2)
            }
            .foregroundStyle(MoonPalette.primaryText)
            .padding()
            .background(.ultraThinMaterial, in: .capsule)
        }
        .padding()
    }

    /// Возвращает экран для демо. / Returns the screen for a demo.
    @ViewBuilder
    private func demo(for demo: MoonDemo) -> some View {
        switch demo {
        case .defaultArrangement: DefaultArrangementDemo()
        case .horizontalSplit: HorizontalSplitDemo()
        case .splitRatio: SplitRatioDemo()
        case .splitAxisRatio: SplitAxisRatioDemo()
        case .fixedSize: FixedSizeSplitDemo()
        case .adaptiveSplitAxis: AdaptiveSplitAxisDemo()
        case .overlay: OverlayDemo()
        case .overlayVerticalAxis: OverlayVerticalAxisDemo()
        case .overlayEdge: OverlayEdgeDemo()
        case .overlayZIndex: OverlayZIndexDemo()
        case .sideBySideStyle: SideBySideStyleDemo()
        }
    }
}

// MARK: - Preview

#Preview("MoonCatalogView - Light") {
    MoonCatalogView()
        .preferredColorScheme(.light)
}

#Preview("MoonCatalogView - Dark") {
    MoonCatalogView()
        .preferredColorScheme(.dark)
}
