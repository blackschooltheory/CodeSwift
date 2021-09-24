//
//  SimpleCell.swift
//  CodeSwift
//
//  Created by mac on 2021/9/23.
//

import UIKit
import SnapKit
class SimpleCell: UITableViewCell {

    var clickClosure:(()->Void)? = nil
    let backBtn = UIButton.init()
    
    let leftIcon = UIImageView.init()
    let nameLabel = UILabel.init()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        
        self.contentView.addSubview(leftIcon)
        leftIcon.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(50)
        }
        leftIcon.backgroundColor = .blue
        self.contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(leftIcon.snp.right).offset(20)
            make.centerY.equalToSuperview()
        }
        nameLabel.text = "今天打老虎"
        nameLabel.textColor = .black
      
        backBtn.addTarget(self, action: #selector(btnClick), for: .touchDown)
        backBtn.addTarget(self, action: #selector(btnUpClick), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func btnUpClick(){
        if (self.clickClosure != nil) {
            self.clickClosure!()
        }
       
    }
    @objc func btnClick(){
        leftIcon.backgroundColor = .purple
        backBtn.backgroundColor = .brown
        nameLabel.text = "今天天气好"
    }
    //MARK:设置闭包回调
    func setClosure(closure:@escaping ()->Void) {
        self.clickClosure = closure
    }

}
