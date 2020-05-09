//
//  DynamicValue.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import Foundation

// Following class takes input as Value
class DynamicValue<T> {

    // MARK: - Variables
    typealias CompletionHandler = ((T) -> Void)
    private var observers = [String: CompletionHandler]()
    init(_ value: T) {
        self.value = value
    }

    // MARK: - Public Functions
    func addAndNotify(observer: NSObject, completion: @escaping CompletionHandler) {
        self.addObserver(observer, completion: completion)
        self.notify()
    }

    // MARK: - Private Functions
    func addObserver(_ observer: NSObject, completion: @escaping CompletionHandler) {
        observers[observer.description] = completion
    }

    private func notify() {
        observers.forEach({ $0.value(value) })
    }

    var value: T {
        didSet {
            self.notify()
        }
    }
    deinit {
        observers.removeAll()
    }
}
