//
//  LotteryGameRuleVController.swift
//  SevenTvUser
//
//  Created by pobringuyamot on 10/11/23.
//

import UIKit
import SnapKit

// MARK: Props/Overrides
class LotteryGameRuleVController : LotteryBaseViewController {
    
}

// MARK: Lifecycle
extension LotteryGameRuleVController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseDelegate = self
        self.view.backgroundColor = .blue
    }
}

// MARK: NAVIGATIONDelegate
extension LotteryGameRuleVController: LotteryBaseViewControllerProtocol {
    func didTapGameRule() {
        print("I AM GAME RULE VIEWCONTROLLER")
    }
    
    func didTapDots() {
        
    }
    
    
}
