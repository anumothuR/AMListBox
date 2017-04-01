//
//  SearchListViewController.swift
//  Pods
//
//  Created by HMSPL on 01/04/17.
//
//


//This class contain all the search code based on the search. It will support only text as of now. next verion will change it to support generic


import UIKit

public protocol AMListBoxProtocol {
    func itemSelected(index:Int, item name:String)
}

open class SearchListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    public var pageTitle : String? //Set the title for the controller
    public var bgColor : UIColor?  // set the title backgound color
    public var textColor : UIColor?
    public var titleFont : UIFont?
    
    public var delegate : AMListBoxProtocol?
    
    public var selectedItem : String?
    public var listArray = [String]()
    var filterArray = [String]()
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet  var lblTitle: UILabel!
    @IBOutlet  var viewTitle: UIView!
    
    
    @IBOutlet weak var tableView: UITableView!

    
    override open func viewDidLoad() {
        super.viewDidLoad()

        let podBundle = Bundle(for: SearchListViewController.self)
        let viewNib = podBundle.loadNibNamed("SearchListViewController", owner: self, options: nil)
         self.view = viewNib?[0] as? UIView
        
        
        if let titl = pageTitle {
            lblTitle.text = titl
        }
        
        if let bg = bgColor {
            viewTitle.backgroundColor = bg
        }
        
        if let txtColor = textColor {
            lblTitle.textColor = txtColor
        }
        
        if let font = titleFont {
            lblTitle.font = font
        }

        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        
//            listArray = ["Anu","Manu","Anju","Bala","Raj"]
        
        let nib = UINib(nibName: "ListCell", bundle: podBundle)
          self.tableView.register(nib, forCellReuseIdentifier: "ListCell")
        tableView.tableHeaderView = searchController.searchBar
     
        
        
        // Do any additional setup after loading the view.
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    open override func viewWillAppear(_ animated: Bool) {
        if let item = selectedItem {
            listArray.remove(at: listArray.index(of: item)!)
            listArray.insert(item, at: 0)
            
        }
        tableView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //MARK: delegates

    open  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filterArray.count
        }
        return listArray.count
    }


    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)


    
    open  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        var dataObj : String = ""
        if searchController.isActive && searchController.searchBar.text != "" {
            dataObj = filterArray[indexPath.row]
        } else {
            dataObj = listArray[indexPath.row]
        }
        cell.textLabel!.text = dataObj
        
        cell.accessoryType = .none
        if let item = selectedItem {
            if dataObj == item {
                cell.accessoryType = .checkmark
            }
        }
//        cell.detailTextLabel!.text = dataObj.category
        return cell

    }

    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filterArray = listArray.filter({( candy : String) -> Bool in
//            let categoryMatch = (scope == "All") || (candy.category == scope)
            return  candy.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if searchController.isActive && searchController.searchBar.text != "" {
            
            let index = listArray.index(of: filterArray[indexPath.row]) ?? -1
            selectedItem = filterArray[indexPath.row]
            delegate?.itemSelected(index: index, item: filterArray[indexPath.row])
            return
           
        }
        
        selectedItem = listArray[indexPath.row]
        delegate?.itemSelected(index: indexPath.row, item: listArray[indexPath.row])
    }
    
    
    @IBAction func cancelAction(_ sender: AnyObject) {
        delegate?.itemSelected(index: -1, item: "")
    }
    

    @IBAction func doneAction(_ sender: AnyObject) {
        delegate?.itemSelected(index: -1, item: "")
    }
}



extension SearchListViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension SearchListViewController: UISearchResultsUpdating {

     public func updateSearchResults(for searchController: UISearchController)
     {
        let searchBar = searchController.searchBar
//        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchText: searchController.searchBar.text!, scope: "All")
    }


}

