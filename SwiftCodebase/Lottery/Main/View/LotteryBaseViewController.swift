//
//  File.swift
//  SevenTvUser
//
//  Created by pobringuyamot on 10/11/23.
//

import UIKit
import SnapKit

protocol LotteryBaseViewControllerProtocol{
    func didTapGameRule()
    func didTapDots()
}

// MARK: Props/Overrides
class LotteryBaseViewController : UIViewController {
    
    var baseDelegate: LotteryBaseViewControllerProtocol?
    
    let headerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let dotBtn: UIButton = {
        let btn = UIButton()
        btn.imageView?.contentMode = .scaleAspectFit
        btn.setImage(UIImage(named: "whitedots"), for: .normal)
        return btn
    }()

    let gameRuleBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "gameCaipv2"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()
    
    let bBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "luecha_back"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()

    let rigthView: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.distribution  = .fillEqually
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.addHorizontalGradientWithColor(UIColor(hexString: "#7E74EE"), UIColor(hexString: "#D487EF"))
    }
}

// MARK: Lifecycle
extension LotteryBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupHeaderView()
        setupNavigation()
    }
}
// MARK: GENERAL METHODS
extension LotteryBaseViewController {
    private func setupHeaderView() {
        self.view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(Constant.NavBar.navHeight)
        }
    }
}

// MARK: NAVIGATION SETUP
extension LotteryBaseViewController {
    
    private func setupNavigation() {
        self.navigationItem.title = "香港六合彩"
        guard let navBar = self.navigationController?.navigationBar else { return }
        navBar.setTranslucent(tintColor: .white, titleColor: .white)
        
        bBtn.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        gameRuleBtn.addTarget(self, action: #selector(didTapGameRules), for: .touchUpInside)
        dotBtn.addTarget(self, action: #selector(didTapDots), for: .touchUpInside)
        
        rigthView.addArrangedSubview(gameRuleBtn)
        rigthView.addArrangedSubview(dotBtn)
        
        let backBtn = UIBarButtonItem(customView: bBtn)
        backBtn.customView?.snp.makeConstraints({ make in
            make.height.equalTo(18)
            make.width.equalTo(32)
        })
        
        let rightMenu = UIBarButtonItem(customView: rigthView)
        rightMenu.customView?.snp.makeConstraints({ make in
            make.height.equalTo(18)
            make.width.equalTo(84)
        })
        
        navigationItem.leftBarButtonItem = backBtn
        navigationItem.rightBarButtonItem = rightMenu
    }
    
    @objc private func didTapBackButton(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapGameRules(){
        baseDelegate?.didTapGameRule()
    }
    
    @objc private func didTapDots(){
        baseDelegate?.didTapDots()
    }
}
