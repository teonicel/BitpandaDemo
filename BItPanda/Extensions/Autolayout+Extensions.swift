//
//  Autolayout+Extensions.swift
//  ExchangeDemo
//
//  Created by teo on 02/04/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import UIKit

public enum Anchor {
    case top
    case left
    case bottom
    case right
}

extension UIView {
    
    @discardableResult public func snapMargins(to view: UIView? = nil, edges: UIEdgeInsets = .zero, except: [Anchor] = []) -> [NSLayoutConstraint] {
        guard let view = view ?? superview else { return [NSLayoutConstraint]() }
        
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        
        if !except.contains(.top) {
            constraints.append(topAnchor.constraint(equalTo: view.topAnchor, constant: edges.top))
        }
        if !except.contains(.left) {
            constraints.append(leftAnchor.constraint(equalTo: view.leftAnchor, constant: edges.left))
        }
        if !except.contains(.bottom) {
            constraints.append(bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -edges.bottom))
        }
        if !except.contains(.right) {
            constraints.append(rightAnchor.constraint(equalTo: view.rightAnchor, constant: -edges.right))
        }
        
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
    @discardableResult public func snapMargins(to guide: UILayoutGuide, edges: UIEdgeInsets = .zero, except: [Anchor] = []) -> [NSLayoutConstraint] {
        
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        
        if !except.contains(.top) {
            constraints.append(topAnchor.constraint(equalTo: guide.topAnchor, constant: edges.top))
        }
        if !except.contains(.left) {
            constraints.append(leftAnchor.constraint(equalTo: guide.leftAnchor, constant: edges.left))
        }
        if !except.contains(.bottom) {
            constraints.append(bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -edges.bottom))
        }
        if !except.contains(.right) {
            constraints.append(rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -edges.right))
        }
        
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
    
    public func embedCentered() -> UIView {
        let container = UIView(frame: .zero)
        container.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: container.topAnchor),
            bottomAnchor.constraint(equalTo: container.bottomAnchor),
            leftAnchor.constraint(greaterThanOrEqualTo: container.leftAnchor),
            centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
        return container
    }
}
public extension UILayoutGuide {
    @discardableResult func snapMargins(to view: UIView, edges: UIEdgeInsets = .zero, except: [Anchor] = []) -> [NSLayoutConstraint] {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        
        if !except.contains(.top) {
            constraints.append(topAnchor.constraint(equalTo: view.topAnchor, constant: edges.top))
        }
        if !except.contains(.left) {
            constraints.append(leftAnchor.constraint(equalTo: view.leftAnchor, constant: edges.left))
        }
        if !except.contains(.bottom) {
            constraints.append(bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -edges.bottom))
        }
        if !except.contains(.right) {
            constraints.append(rightAnchor.constraint(equalTo: view.rightAnchor, constant: -edges.right))
        }
        
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
    
    @discardableResult func snapMargins(to guide: UILayoutGuide, edges: UIEdgeInsets = .zero, except: [Anchor] = []) -> [NSLayoutConstraint] {
        
        var constraints = [NSLayoutConstraint]()
        
        if !except.contains(.top) {
            constraints.append(topAnchor.constraint(equalTo: guide.topAnchor, constant: edges.top))
        }
        if !except.contains(.left) {
            constraints.append(leftAnchor.constraint(equalTo: guide.leftAnchor, constant: edges.left))
        }
        if !except.contains(.bottom) {
            constraints.append(bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -edges.bottom))
        }
        if !except.contains(.right) {
            constraints.append(rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -edges.right))
        }
        
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
}
