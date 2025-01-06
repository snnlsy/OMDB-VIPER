//
//  UIView+AutoLayout.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 2.01.2025.
//

import UIKit

extension UIView {

    // MARK: - Add View

    @discardableResult
    func add(subview view: UIView, translatesAutoresizingMaskIntoConstraints: Bool = false) -> UIView {
        view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        addSubview(view)
        return view
    }

    // MARK: - Leading

    @discardableResult
    func leading(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Self {
        leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func leading(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Self {
        leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func leading(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Self {
        leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    // MARK: - Trailing
    
    @discardableResult
    func trailing(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Self {
        trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func trailing(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Self {
        trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func trailing(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Self {
        trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    // MARK: - CenterX

    @discardableResult
    func centerX(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Self {
        centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func centerX(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Self {
        centerXAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func centerX(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Self {
        centerXAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    // MARK: - CenterY
    
    @discardableResult
    func centerY(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> Self {
        centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func centerY(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> Self {
        centerYAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func centerY(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> Self {
        centerYAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    // MARK: - Top

    @discardableResult
    func top(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> Self {
        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func top(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> Self {
        topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func top(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> Self {
        topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    // MARK: - Bottom

    @discardableResult
    func bottom(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> Self {
        bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func bottom(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> Self {
        bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func bottom(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> Self {
        bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    // MARK: - Width
    
    @discardableResult
    func width(equalToConstant constant: CGFloat) -> Self {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func width(greaterThanOrEqualToConstant constant: CGFloat) -> Self {
        widthAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func width(lessThanOrEqualToConstant constant: CGFloat) -> Self {
        widthAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func width(equalTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) -> Self {
        widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func width(greaterThanOrEqualTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) -> Self {
        widthAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func width(lessThanOrEqualTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) -> Self {
        widthAnchor.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant).isActive = true
        return self
    }

    // MARK: - Height

    @discardableResult
    func height(equalToConstant constant: CGFloat) -> Self {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func height(greaterThanOrEqualToConstant constant: CGFloat) -> Self {
        heightAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func height(lessThanOrEqualToConstant constant: CGFloat) -> Self {
        heightAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func height(equalTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) -> Self {
        heightAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func height(greaterThanOrEqualTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) -> Self {
        widthAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func height(lessThanOrEqualTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) -> Self {
        widthAnchor.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant).isActive = true
        return self
    }
    
    // MARK: - Size

    @discardableResult
    func size(equalToConstant constant: CGFloat) -> Self {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func size(equalToSize size: CGSize) -> Self {
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self
    }

    // MARK: - Wrap
    
    func wrap(subView: UIView, padding: CGFloat = .zero) {
        wrap(subView: subView, insets: .paddingAll(padding))
    }

    func wrap(subView: UIView, insets: UIEdgeInsets) {
        add(subview: subView)
            .leading(equalTo: leadingAnchor, constant: insets.left)
            .trailing(equalTo: trailingAnchor, constant: -insets.right)
            .top(equalTo: topAnchor, constant: insets.top)
            .bottom(equalTo: bottomAnchor, constant: -insets.bottom)
    }
    
    @discardableResult
    func pinToSuperviewEdges(with insets: UIEdgeInsets = .zero) -> Self {
        guard let superview else {
            fatalError("Couldn't find superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insets.right).isActive = true
        topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom).isActive = true
        return self
    }
    
    @discardableResult
    func centerInSuperview() -> Self {
        guard let superview else {
            fatalError("Couldn't find superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        return self
    }

    @discardableResult
    func configureConstraints(
        relativeTo view: UIView? = nil,
        top: CGFloat? = nil,
        leading: CGFloat? = nil,
        bottom: CGFloat? = nil,
        trailing: CGFloat? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        centerX: CGFloat? = nil,
        centerY: CGFloat? = nil
    ) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        func applyConstraint<AnchorType>(
            _ anchor: NSLayoutAnchor<AnchorType>,
            to targetAnchor: NSLayoutAnchor<AnchorType>?,
            constant: CGFloat
        ) {
            guard let targetAnchor else { return }
            anchor.constraint(equalTo: targetAnchor, constant: constant).isActive = true
        }

        if let view {
            if let top {
                applyConstraint(topAnchor, to: view.topAnchor, constant: top)
            }
            if let leading {
                applyConstraint(leadingAnchor, to: view.leadingAnchor, constant: leading)
            }
            if let bottom {
                applyConstraint(bottomAnchor, to: view.bottomAnchor, constant: -bottom)
            }
            if let trailing {
                applyConstraint(trailingAnchor, to: view.trailingAnchor, constant: -trailing)
            }
            if let centerX {
                applyConstraint(centerXAnchor, to: view.centerXAnchor, constant: centerX)
            }
            if let centerY {
                applyConstraint(centerYAnchor, to: view.centerYAnchor, constant: centerY)
            }
        }

        if let width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }

        return self
    }
}
