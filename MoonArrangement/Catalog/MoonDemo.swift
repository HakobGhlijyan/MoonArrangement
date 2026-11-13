//
//  File: MoonDemo.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import Foundation

// MARK: - MoonDemo

/// Перечень демо-экранов каталога с краткими пояснениями.
///
/// The list of catalog demo screens with short explanations.
nonisolated enum MoonDemo: String, CaseIterable, Identifiable, Hashable, Sendable {

    // MARK: Cases

    case defaultArrangement
    case horizontalSplit
    case splitRatio
    case splitAxisRatio
    case fixedSize
    case adaptiveSplitAxis
    case overlay
    case overlayVerticalAxis
    case overlayEdge
    case overlayZIndex
    case sideBySideStyle

    // MARK: Identifiable

    var id: String { rawValue }

    // MARK: Presentation data

    /// Название демо. / Demo title.
    var title: String {
        switch self {
        case .defaultArrangement: "1. Default (automatic → split)"
        case .horizontalSplit: "2. Split · horizontal axis only"
        case .splitRatio: "3. Split · ratio 0.4"
        case .splitAxisRatio: "4. Split · ratio per axis"
        case .fixedSize: "5. Split · fixed layout size"
        case .adaptiveSplitAxis: "6. Split · adapt to axis"
        case .overlay: "7. Overlay"
        case .overlayVerticalAxis: "8. Overlay · vertical axis only"
        case .overlayEdge: "9. Overlay · edge"
        case .overlayZIndex: "10. Overlay · zIndex adaptation"
        case .sideBySideStyle: "11. Custom style · sideBySide"
        }
    }

    /// Что показывает демо (RU / EN). / What the demo shows (RU / EN).
    var summary: String {
        switch self {
        case .defaultArrangement: "Раскладка по умолчанию / Default layout"
        case .horizontalSplit: "Только рядом, на внешнем — один вид / Side by side only"
        case .splitRatio: "Доля 40 % для secondary / 40% for secondary"
        case .splitAxisRatio: "Разные доли для ширины и высоты / Per-axis ratios"
        case .fixedSize: "Размер по контенту / Size to content"
        case .adaptiveSplitAxis: "Лента или список по оси / Strip or list by axis"
        case .overlay: "Карточка поверх луны / Card over the moon"
        case .overlayVerticalAxis: "Виды не расходятся по сгибу / No separation on a vertical fold"
        case .overlayEdge: "Стороны при разделении / Sides on separation"
        case .overlayZIndex: "Карточка → детали при сгибе / Card → details when folded"
        case .sideBySideStyle: "Собственный стиль / Custom style"
        }
    }
}
