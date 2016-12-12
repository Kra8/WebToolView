//
//  WebToolView.swift
//  WebToolView
//
//  Created by K.Asai on 2016/12/12.
//  Copyright © 2016年 K.Asai. All rights reserved.
//

import UIKit

public protocol WebToolViewDelegate {
    ///
    /// ツールバーのボタンが選択されると呼ばれる
    ///
    /// - parameter type : 選択されたボタンのタイプ
    ///
    func selectedToolButton(type: WebToolButtonType)
}

///
/// WebToolViewで用いるボタンの種類
///
public enum WebToolButtonType : Int {
    case previous
    case next
    case home
    case close
}

public class WebToolView : UIView{
    
    // 前に戻るボタン
    private let previousButton  = UIButton()
    
    // 次に進むボタン
    private let nextButton      = UIButton()
    
    // ホームボタン
    private let homeButton      = UIButton()
    
    // 閉じるボタン
    private let closeButton     = UIButton()
    
    // ツールビューの高さ
    private var customHeight : CGFloat = 44.0
    
    public var delegate : WebToolViewDelegate?
    
    // MARK: - Initializer
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(self.previousButton)
        self.addSubview(self.nextButton)
        self.addSubview(self.homeButton)
        self.addSubview(self.closeButton)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.white
        self.addSubview(self.previousButton)
        self.addSubview(self.nextButton)
        self.addSubview(self.homeButton)
        self.addSubview(self.closeButton)
    }
    
    convenience public init() {
        self.init(frame: CGRect())
    }
    
    convenience public init(animationText: String) {
        self.init()
    }
    
    // MARK: - Methods
    public override func layoutSubviews() {
        // 自身のフレームを設定
        self.frame.size.height  = self.customHeight
        
        // 各ボタンの配置
        let btnSize  = CGSize(width: 32.0, height: 32.0)
        let btnY    : CGFloat = (self.customHeight - btnSize.height) / 2.0
        let prevX   : CGFloat = 16.0
        let nextX   : CGFloat = prevX + btnSize.width + 32.0
        let closeX  : CGFloat = self.frame.size.width - btnSize.width - 32.0
        let homeX   : CGFloat = closeX - btnSize.width - 32.0
        
        self.previousButton.frame.origin.x  = prevX
        self.previousButton.frame.origin.y  = btnY
        self.previousButton.frame.size      = btnSize
        self.previousButton.tag             = WebToolButtonType.previous.rawValue
        self.previousButton.addTarget(self, action: #selector(self.tappedButton(sender:)), for: .touchDown)
        
        self.nextButton.frame.origin.x      = nextX
        self.nextButton.frame.origin.y            = btnY
        self.nextButton.frame.size          = btnSize
        self.nextButton.tag                 = WebToolButtonType.next.rawValue
        self.nextButton.addTarget(self, action: #selector(self.tappedButton(sender:)), for: .touchDown)
        
        self.homeButton.frame.origin.x      = homeX
        self.homeButton.frame.origin.y      = btnY
        self.homeButton.frame.size          = btnSize
        self.homeButton.tag                 = WebToolButtonType.home.rawValue
        self.homeButton.addTarget(self, action: #selector(self.tappedButton(sender:)), for: .touchDown)
        
        self.closeButton.frame.origin.x     = closeX
        self.closeButton.frame.origin.y     = btnY
        self.closeButton.frame.size         = btnSize
        self.closeButton.tag                = WebToolButtonType.close.rawValue
        self.closeButton.addTarget(self, action: #selector(self.tappedButton(sender:)), for: .touchDown)
    }
    
    ///
    /// ツールバーのボタンがタップされると呼ばれる
    ///
    /// タップ後の処理はデリゲートにより委託する
    ///
    /// - parameter sender : タップされたボタン
    ///
    public func tappedButton(sender: UIButton) -> Void {
        self.delegate?.selectedToolButton(type: WebToolButtonType(rawValue: sender.tag)!)
    }
    
    ///
    /// 高さを設定する。frameプロパティからサイズを指定しても適応されない。
    ///
    /// - parameter height :
    ///
    public func setCustomHeight(_ height: CGFloat) -> Void {
        if height < 44.0 { return }
        self.customHeight = height
    }
    
    ///
    /// 進むボタンの画像を設定する
    ///
    /// - parameter image   : 表示する画像
    /// - parameter for     : 画像を表示するときのボタンの状態
    ///
    public func setPreviousButtonImage(_ image: UIImage?, for state: UIControlState) -> Void {
        self.previousButton.setImage(image, for: state)
    }
    
    ///
    /// 戻るボタンの画像を設定する
    ///
    /// - parameter image   : 表示する画像
    /// - parameter for     : 画像を表示するときのボタンの状態
    ///
    public func setNextButtonImage(_ image: UIImage?, for state: UIControlState) -> Void {
        self.nextButton.setImage(image, for: state)
    }
    
    ///
    /// ホームボタンの画像を設定する
    ///
    /// - parameter image   : 表示する画像
    /// - parameter for     : 画像を表示するときのボタンの状態
    ///
    public func setHomeButtonImage(_ image: UIImage?, for state: UIControlState) -> Void {
        self.homeButton.setImage(image, for: state)
    }
    
    ///
    /// 閉じるボタンの画像を設定する
    ///
    /// - parameter image   : 表示する画像
    /// - parameter for     : 画像を表示するときのボタンの状態
    ///
    public func setCloseButtonImage(_ image: UIImage?, for state: UIControlState) -> Void {
        self.closeButton.setImage(image, for: state)
    }
}
