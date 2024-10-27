//
//  Observable.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 27/10/24.
//

class Observable<T> {
    private var listeners: [(T) -> Void] = []
    var value: T {
        didSet {
            notifyListeners()
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping (T) -> Void) {
        listeners.append(listener)
        listener(value)
    }
    
    private func notifyListeners() {
        listeners.forEach { $0(value) }
    }
}
