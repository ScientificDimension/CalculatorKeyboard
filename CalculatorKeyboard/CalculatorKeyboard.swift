//
//  CalculatorKeyboard.swift
//  CalculatorKeyboard
//
//  Created by Guilherme Moura on 8/15/15.
//  Copyright (c) 2015 Reefactor, Inc. All rights reserved.
//

import UIKit

public enum CalculatorKey: Int {
    case zero = 1
    case one = 2
    case two = 3
    case three = 4
    case four = 5
    case five = 6
    case six = 7
    case seven = 8
    case eight = 9
    case nine = 10
    case decimal = 11
    case sign = 12
    case clear = 13
    case delete = 14
    case multiply = 15
    case divide = 16
    case subtract = 17
    case add = 18
    case equal = 19
}

public typealias CalculatorKeyAction = (CalculatorKey) -> Void

open class CalculatorKeyboard: UIView {
    
    // MARK: - colors
    
    var colorSchema = DefaultColors()
    
    // MARK: - handlers
    
    open var keyTapHandler: CalculatorKeyAction?
    open var onKeyPressed: CalculatorKeyAction?
    open var onKeyReleased: CalculatorKeyAction?

    /// naming: https://blog.cocoafrog.de/2018/04/12/How-to-name-IBActions.html
    @IBAction func press(_ sender: UIButton) {
        let key = CalculatorKey(rawValue: sender.tag)!
        sender.updateAppearance(.down, key)
        onKeyPressed?(key)
    }
    
    @IBAction func releaseInside(_ sender: UIButton) {
        let key = CalculatorKey(rawValue: sender.tag)!
        sender.updateAppearance(.up, key)
        onKeyReleased?(key)
        keyTapHandler?(key)
    }

    @IBAction func releaseOutside(_ sender: UIButton) {
        let key = CalculatorKey(rawValue: sender.tag)!
        sender.updateAppearance(.up, key)
        onKeyReleased?(key)
    }
    
    // MARK: - Calculator View

    var view: UIView!
    
    // MARK: - Memory Management
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadXib()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        configureColorSchema()
    }
    
    fileprivate func loadXib() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        configureColorSchema()
        addSubview(view)
    }
    
    fileprivate func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CalculatorKeyboard", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    // MARK: - colorScheme
    
    private func configureColorSchema() {
        tryConfigure(
            keys: [ .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal, .sign],
            frontColor: colorSchema.white,
            backColor: colorSchema.dark)
        tryConfigure(
            keys: [ .clear, .multiply, .divide, .delete, .subtract, .add, .equal],
            frontColor: colorSchema.black,
            backColor: colorSchema.gray)
    }
    
    // MARK: - configurations

    private func tryConfigure(
        keys: Set<CalculatorKey>,
        frontColor: UIColor,
        backColor: UIColor) {
        keys.map({ $0.rawValue }).forEach  {
            guard let button = view.viewWithTag($0) as? UIButton else {
                return
            }
            button.tintColor = frontColor
            button.setTitleColor(frontColor, for: .normal)
            button.setBackgroundImage(nil, for: .normal)
            button.backgroundColor = backColor
            button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        }
    }
}
