//
//  CounterVM.swift
//  W05_Practice1
//
//  Created by student on 09/10/25.
//

import Foundation
import SwiftUI

@Observable // public class
final class CounterVM: ObservableObject {
    // kalau pakai @Publised, ketika var nya berubah, nanti di viewnya juga berubah. tapi di ios 17 nda perlu. pakai @Observable
    var count: Int = 0
    var isEven: Bool { count % 2 == 0}
    
    func increment() { count += 1 }
    func decrement() { count -= 1 }
    func reset() { count = 0 }
    
}
