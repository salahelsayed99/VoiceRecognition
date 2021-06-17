//
//  SplashViewController.swift
//  VoiceRecognition
//
//  Created by Salah  on 6/13/21.
//

import UIKit



enum LanguageItem : String{
    case English
    case Arabic
    
    func stringValueBasedOnLocalization() -> String {
        if rawValue == "English"{
            return "English"
        }else{
            return "عربي"
        }
        
    }
    

    
    func intValue() -> Int {
        switch self {
        case .English:
            return 0
        case .Arabic:
            return 1
        }
    }
    
    static func LanguageFromInt(_ int : Int) -> LanguageItem{
        switch int {
        case 0:
            return .English
        case 1:
            return .Arabic
        default:
            return .English
        }
    }
    
    
    static var count = 2
}


class LanguageViewController: UIViewController {

    @IBOutlet weak var languageTableView: UITableView!
    
    @IBOutlet weak var chooseLabel: UILabel!
    
    
    fileprivate var languageItems : [LanguageItem] = [.English,.Arabic]
    fileprivate var selectedLanguage : LanguageItem = .English
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    


}
extension LanguageViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell") as! LanguageTableViewCell
        
        cell.title.text = languageItems[indexPath.row].stringValueBasedOnLocalization()
        
        
//        if(self.selectedLanguage.intValue() == indexPath.row){
//            cell.checkMarkImage.isHidden = false
//        }else{
//            cell.checkMarkImage.isHidden = true
//        }
        
        
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedLanguage = LanguageItem.LanguageFromInt(indexPath.row)
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "viewController") as! VoiceRecognitionViewController
        
                switch self.selectedLanguage{
                case .English:
                    viewController.lang = "en_US"
                case .Arabic:
                    viewController.lang = "ar-SA"
                }

        
        self.navigationController?.pushViewController(viewController, animated: true)
        self.languageTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

