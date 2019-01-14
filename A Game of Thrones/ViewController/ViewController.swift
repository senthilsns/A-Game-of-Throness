//
//  ViewController.swift
//  A Game of Thrones
//
//  Created by SENTHILKUMAR on 11/01/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // View model object
    var viewModel = BookViewModel()

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "A Game of Thrones"
        pageSetup()
    }

    
    //MARK: Initial page settings
    func pageSetup()  {
        // activityIndicator.startAnimating()
        tableViewSetup()
        ///API calling from viewmodel class
        viewModel.readBookInfoFromAPI()
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

//MARK: ViewController Extension
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    // Table view settings
    func tableViewSetup()  {
        tableView.tableFooterView = UIView()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModel.arrayOfList.count
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 195
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing : BookCell.self)) as! BookCell
        
        let listObj = viewModel.arrayOfList[indexPath.row]
        
        cell.nameLabel.text = "Book Name:" + listObj.name!
        cell.autherLabel.text = "Auther:" + (listObj.authors?.first!)!
        cell.numberofPagesLabel.text = "No of Pages: \(listObj.numberOfPages!) "
        cell.isbnLabel.text = "ISBN:"+listObj.isbn!
        cell.publisherLabel.text = "Publisher Name:" + listObj.publisher!
        cell.countryLabel.text = "Country Name:" + listObj.country!
        
        // Cell background color change
        if ((indexPath.row % 2) != 0){
            cell.contentView.backgroundColor = UIColor.yellow
        }else{
            cell.contentView.backgroundColor = UIColor.clear
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BookCharacterViewController") as? BookCharacterViewController
        let listObj = viewModel.arrayOfList[indexPath.row]
        vc?.cha_Array = listObj.characters!
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}




