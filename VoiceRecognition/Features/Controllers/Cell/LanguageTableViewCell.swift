//
//  LanguageTableViewCell.swift
//  VoiceRecognition
//
//  Created by Salah  on 6/13/21.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {

    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var checkMarkImage : UIImageView!
    @IBOutlet weak var languageView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkMarkImage.isHidden = true
        UIUtilities.createCircularViewforView(self.languageView, withRadius: 10)
        self.languageView.backgroundColor = ColorsUtility.colorWithHexString("#C4161C")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
