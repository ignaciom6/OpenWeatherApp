//
//  OWBox.swift
//  OpenWeather
//
//  Created by Ignacio on 16/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import Foundation

final class OWBox<T> {

    typealias Listener = (T) -> Void
    var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
