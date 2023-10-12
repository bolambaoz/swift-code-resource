//
//  LotteryMainViewController.swift
//  SevenTvUser
//
//  Created by Abi M on 10/8/23.
//

import UIKit
import SnapKit

// MARK: Props/Overrides
class LotteryMainViewController: LotteryBaseViewController {
    let contentView: LotteryMainView = {
        let view = LotteryMainView()
        return view
    }()

    let sideMenuItems: [SideMenuEnum] = [.menu1, .menu2, .menu3, .menu4, .menu5, .menu6, .menu7, .menu8, .menu9, .menu10, .menu11, .menu12, .menu13, .menu14, .menu15, .menu16]
    var selectedSideMenu: SideMenuEnum? {
        didSet {
            contentView.contentCollectionView.reloadData()
        }
    }

}

// MARK: Lifecycle
extension LotteryMainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview()
            make.top.equalToSuperview().inset(Constant.NavBar.navHeight)
        }
        
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectFirstRowInSideMenu()
    }
}

// MARK: Private Functionalities
extension LotteryMainViewController {

    private func setupView() {
//        self.edgesForExtendedLayout = []
        baseDelegate = self
        contentView.delegate = self
        setupTableView()
        setupCollectionView()
        setupTextField()
    }

    private func selectFirstRowInSideMenu() {
        let indexPath = IndexPath(row: 0, section: 0)
        self.contentView.sideMenuTableView.selectRow(at: indexPath, animated: false, scrollPosition: .top)
        selectedSideMenu = .menu1
    }

    private func setupTableView() {
        self.contentView.sideMenuTableView.register(SideMenuTableViewCell.self, forCellReuseIdentifier: "cell")
        self.contentView.sideMenuTableView.delegate = self
        self.contentView.sideMenuTableView.dataSource = self
    }

    private func setupCollectionView() {
        self.contentView.contentCollectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.contentView.contentCollectionView.delegate = self
        self.contentView.contentCollectionView.dataSource = self
    }

    private func setupTextField() {
        self.contentView.amountTextField.delegate = self
    }
}

// MARK: UITableViewDataSource
extension LotteryMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideMenuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SideMenuTableViewCell
        let menu = sideMenuItems[indexPath.row]
        cell.configure(title: menu.rawValue)
        return cell
    }
}

// MARK: UITableViewDelegate
extension LotteryMainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Did tap tableview \(indexPath.row)")

        let newlySelected = sideMenuItems[indexPath.row]
        if selectedSideMenu != newlySelected {
            self.selectedSideMenu = newlySelected
        }
    }
}

// MARK: UICollectionViewDataSource
extension LotteryMainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch selectedSideMenu {

        case .menu1:
            return 50
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ContentCollectionViewCell

        if let selectedSideMenu = selectedSideMenu {
            cell.configure(title: "48.0", sideMenu: selectedSideMenu)
        }

        return cell
    }
}

// MARK: UICollectionViewDelegate
extension LotteryMainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let currentCell = collectionView.cellForItem(at: indexPath) as? ContentCollectionViewCell {
            if currentCell.isSelected {
                currentCell.backgroundColor = UIColor(hexString: "#FFE391")
            } else {
                currentCell.backgroundColor = .clear
            }
        }
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension LotteryMainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        var width = 0.0
        let height = 50.0

        switch selectedSideMenu {
        case .menu5, .menu6, .menu7, .menu8, .menu9, .menu14, .menu15, .menu16:
            width = collectionView.frame.width
        case .menu10, .menu12:
            width = collectionView.frame.width / 2
        default:
            width = collectionView.frame.width / 3
        }

        return CGSize(width: width, height: height)
    }
}

// MARK: UITextFieldDelegate
extension LotteryMainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.contentView.amountTextField.resignFirstResponder()
        return true
    }
}

// MARK: LotteryMainViewProtocol
extension LotteryMainViewController: LotteryMainViewProtocol {
    func didTapClearButton(_ view: UIView) {
        print("Did tap clear button")
    }

    func didTapAddNoteButton(_ view: UIView) {
        print("Did tap add note button")
    }
}

// MARK: NAVIGATIONDelegate
extension LotteryMainViewController: LotteryBaseViewControllerProtocol {
    func didTapGameRule() {
        print("CLICK GAME RULE")
        let gameVC = LotteryGameRuleVController()
        navigationController?.pushViewController(gameVC, animated: true)
    }

    func didTapDots() {
        print("Dots")
    }
}

