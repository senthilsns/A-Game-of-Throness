//
//  BookCharacterViewController.swift
//  A Game of Thrones
//
//  Created by SENTHILKUMAR on 13/01/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

class BookCharacterViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var cha_Array : [String] = []
    
    // View model object
    var viewModel = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Character"
        
        print(cha_Array)
        
        pageSetup()
    }
    

    //MARK: Initial page settings
    func pageSetup()  {
        // activityIndicator.startAnimating()
        tableViewSetup()
        ///API calling from viewmodel class
        
        for i in 0...cha_Array.count-1 {
            
            viewModel.readBookCharacterInfoFromAPI(character_APIString: cha_Array[i])
        }
        
        closureSetUp()
    }
    
    //MARK: Closure Initialize
    func closureSetUp()  {
        viewModel.reloadList = { [weak self] ()  in
            ///UI chnages in main tread
            DispatchQueue.main.async {
                self?.tableView.isHidden = false
                self?.tableView.reloadData()
            }
        }
        viewModel.errorMessage = { [] (message)  in
            DispatchQueue.main.async {
                print(message)
            }
        }
    }

}


//MARK: BookCharacterViewController Extension
extension BookCharacterViewController : UITableViewDelegate,UITableViewDataSource{
    
    // Table view settings
    func tableViewSetup()  {
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return viewModel.characterDetailList.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing : CharacterCell.self)) as! CharacterCell
        
        let listObj = viewModel.characterDetailList[indexPath.row]
        cell.BookCharacterLabel.text = listObj.name!
        
        // Cell background color change
        if ((indexPath.row % 2) != 0){
            cell.contentView.backgroundColor = UIColor.yellow
        }else{
            cell.contentView.backgroundColor = UIColor.clear
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController
        let listObj = viewModel.characterDetailList[indexPath.row]
        vc?.nameStr = listObj.name
        vc?.bornStr = listObj.born
        vc?.genderStr = listObj.gender
        vc?.cultureStr = listObj.culture
        var tempArr : [String] = listObj.playedBy!
        vc?.playedStr = tempArr[0]
        var tempArr1 : [String] = listObj.titles!
        vc?.titleStr = tempArr1[0]
        vc?.fatherStr = listObj.father
        vc?.motherStr = listObj.mother
        vc?.diedStr = listObj.died
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
