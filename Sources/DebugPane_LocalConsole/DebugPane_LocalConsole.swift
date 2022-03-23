//
// Copyright © 2021 An Tran. All rights reserved.
//

import Combine
import Foundation
@_exported import LocalConsole
import SwiftUI
import TweakPane

public struct LocalConsoleBlade: Blade {
    public var name: String? = "Local Console"
    
    public init() {}
    
    public func render() -> AnyView {
        AnyView(ContentView())
    }
}

private struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        InputBlade(name: "Toggle LocalConsole", binding: InputBinding($viewModel.isShowingLocalConsole)).render()
    }
}

extension ContentView {
    final class ViewModel: ObservableObject {
        @Published var isShowingLocalConsole: Bool = false
        
        private var cancellable: AnyCancellable?
        
        init() {
            cancellable = $isShowingLocalConsole.sink { value in
                LCManager.shared.isVisible = value
            }
        }
    }
}
