//
//  TAReactorKitHelper.swift
//  TAReactorKitHelper
//
//  Created by Mario Hahn on 12.03.18.
//  Copyright © 2018 Mario Hahn. All rights reserved.
//

import Foundation

public enum AsyncAction<T>: Equatable {
    
    public static func == (lhs: AsyncAction<T>, rhs: AsyncAction<T>) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none):
            return true
        case (.loading, .loading):
            return true
        case (.error, .error):
            return true
        case (.success, .success):
            return true
        default:
            return false
        }
    }
    
    case none
    case loading
    case error(Error)
    case success(T)
    
    public var isLoading: Bool {
        return self == .loading
    }
    
    public var item: T? {
        switch self {
        case let .success(item):
            return item
        default:
            return nil
        }
    }
}

public enum AsyncLoad<T>: Equatable {
    
    public static func == (lhs: AsyncLoad<T>, rhs: AsyncLoad<T>) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none):
            return true
        case (.loading, .loading):
            return true
        case (.error, .error):
            return true
        case (.loaded, .loaded):
            return true
        default:
            return false
        }
    }
    
    case none
    case loading
    case error(Error)
    case loaded(T)
    
    public var isLoading: Bool {
        return self == .loading
    }
    
    public var item: T? {
        switch self {
        case let .loaded(item):
            return item
        default:
            return nil
        }
    }
}

#if canImport(ReactorKit) && canImport(RxSwift)
import RxSwift
import ReactorKit

extension Reactor {
    public func values<T>(_ stateKeyPath: KeyPath<State, T>) -> Observable<T> {
        return state.map { $0[keyPath: stateKeyPath] }
    }
    
    public func distinctValues<T: Equatable>(_ stateKeyPath: KeyPath<State, T>) -> Observable<T> {
        return values(stateKeyPath).distinctUntilChanged()
    }
    
    public func distinctValues<T>(_ stateKeyPath: KeyPath<State, T>, comparer: @escaping (T, T) throws -> Bool) -> Observable<T> {
        return values(stateKeyPath).distinctUntilChanged(comparer)
    }
}

#endif
