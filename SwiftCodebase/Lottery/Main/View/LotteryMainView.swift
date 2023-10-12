//
//  LotteryMainView.swift
//  SevenTvUser
//
//  Created by Abi M on 10/8/23.
//

import UIKit
import SnapKit

protocol LotteryMainViewProtocol: Any {
    func didTapClearButton(_ view: UIView)
    func didTapAddNoteButton(_ view: UIView)
}

// MARK: Props
class LotteryMainView: UIView {

    var delegate: LotteryMainViewProtocol?
    
    lazy var sideMenuTableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.bounces = false
        return tableView
    }()

    lazy var contentCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bounces = false
        return collectionView
    }()

    lazy var footerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hexString: "#C6BFBF").cgColor
        return view
    }()

    lazy var amountTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupSubviews()
    }

}

// MARK: Functionalities
extension LotteryMainView {
    private func setupView() {
        self.backgroundColor = .white
    }

    private func setupSubviews() {
        setupFooterView()

        self.addSubview(sideMenuTableView)
        sideMenuTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalTo(footerView.snp.top)
            make.width.equalToSuperview().multipliedBy(0.25)
        }

        self.addSubview(contentCollectionView)
        contentCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalTo(sideMenuTableView.snp.right)
            make.bottom.equalTo(footerView.snp.top)
        }
    }
    
    private func setupFooterView() {
        self.addSubview(footerView)
        footerView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(60)
        }

        let stackView = UIStackView(frame: CGRect(x: .zero, y: .zero, width: 300, height: 50))
        footerView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview().inset(10)
        }

        let clearButton = UIButton()
        clearButton.setTitle("单注", for: .normal)
        clearButton.setTitleColor(UIColor(hexString: "#999999"), for: .normal)
        clearButton.addTarget(self, action: #selector(didTapClearButton), for: .touchUpInside)
        clearButton.snp.makeConstraints { make in
            make.width.equalTo(80)
        }

        footerView.addSubview(amountTextField)
        amountTextField.placeholder = "请输入金额"
        amountTextField.clipsToBounds = true
        amountTextField.layer.cornerRadius = 20.0
        amountTextField.layer.borderWidth = 1.0
        amountTextField.layer.borderColor = UIColor(hexString: "#FC8F2A").cgColor
        amountTextField.snp.makeConstraints { make in
            make.width.equalTo(160)
        }

        let additionalNoteButton = UIButton()
        additionalNoteButton.setTitle("添加注单", for: .normal)
        additionalNoteButton.clipsToBounds = true
        additionalNoteButton.layer.cornerRadius = 20.0
        additionalNoteButton.backgroundColor = UIColor(hexString: "#FFE9B0")
        additionalNoteButton.addTarget(self, action: #selector(didTapAdditionalNoteButton), for: .touchUpInside)
        additionalNoteButton.snp.makeConstraints { make in
            make.width.equalTo(120)
        }

        stackView.addArrangedSubview(clearButton)
        stackView.addArrangedSubview(amountTextField)
        stackView.addArrangedSubview(additionalNoteButton)
        addCustomTFToolbar()
    }
    
    private func addCustomTFToolbar(){
        let numberToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        numberToolbar.barStyle = .default
    
        let clearButton = UIButton()
        clearButton.setTitle("单注", for: .normal)
        clearButton.setTitleColor(UIColor(hexString: "#999999"), for: .normal)
        clearButton.addTarget(self, action: #selector(didTapClearButton), for: .touchUpInside)
        clearButton.snp.makeConstraints { make in
            make.width.equalTo(80)
        }

        footerView.addSubview(amountTextField)
        amountTextField.placeholder = "请输入金额"
        amountTextField.clipsToBounds = true
        amountTextField.layer.cornerRadius = 20.0
        amountTextField.layer.borderWidth = 1.0
        amountTextField.layer.borderColor = UIColor(hexString: "#FC8F2A").cgColor
        amountTextField.snp.makeConstraints { make in
            make.width.equalTo(160)
        }

        let additionalNoteButton = UIButton()
        additionalNoteButton.setTitle("添加注单", for: .normal)
        additionalNoteButton.clipsToBounds = true
        additionalNoteButton.layer.cornerRadius = 20.0
        additionalNoteButton.backgroundColor = UIColor(hexString: "#FFE9B0")
        additionalNoteButton.addTarget(self, action: #selector(didTapAdditionalNoteButton), for: .touchUpInside)
        additionalNoteButton.snp.makeConstraints { make in
            make.width.equalTo(120)
            
        numberToolbar.items = [
        UIBarButtonItem(customView: clearButton),
        UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
        UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneWithNumberPad))]
        
        numberToolbar.sizeToFit()
        amountTextField.inputAccessoryView = numberToolbar
    }

    @objc private func didTapClearButton() {
        delegate?.didTapClearButton(self)
    }

    @objc private func didTapAdditionalNoteButton() {
        delegate?.didTapAddNoteButton(self)
    }
    
    @objc func cancelNumberPad() {
        //Cancel with number pad
    }
    @objc func doneWithNumberPad() {
        //Done with number pad
    }
}

