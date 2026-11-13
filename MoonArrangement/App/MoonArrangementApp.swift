//
//  File: MoonArrangementApp.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - MoonArrangementApp

/// Точка входа демо-приложения. Требуется iOS 27.1+ (`ArrangementView`).
///
/// Entry point of the demo app. Requires iOS 27.1+ (`ArrangementView`).
@main
struct MoonArrangementApp: App {

    // MARK: Body

    var body: some Scene {
        WindowGroup {
            MoonCatalogView()
        }
    }
}
