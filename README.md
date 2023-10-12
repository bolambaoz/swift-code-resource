# swift-code-resource

# KEYBOARD TOOLBAR
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
