import UIKit

class SearchViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var inputTextField: UITextField!
    
    let appleProducts = ["Mac", "iPhone", "Apple Watch", "iPad"]
    var filteredAppleProducts = [String]()
    var resultSearchController = UISearchController()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.inputTextField.inputView = self.tableView
        
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        self.resultSearchController.searchBar.delegate = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.frame = self.view.bounds
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        self.tableView.reloadData()
        view.addSubview(tableView)
        tableView.hidden = true
        
        //self.inputTextField.inputView = tableView
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        tableView.hidden = false
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.resultSearchController.active) {
            return self.filteredAppleProducts.count
        } else {
            return self.appleProducts.count
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.hidden = true
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }
        
        if(self.resultSearchController.active) {
            cell?.textLabel?.text = self.filteredAppleProducts[indexPath.row]
        } else {
            cell?.textLabel?.text = self.appleProducts[indexPath.row]
        }
        
        return cell!
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredAppleProducts.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchText)
        
        let array = (self.appleProducts as NSArray).filteredArrayUsingPredicate(searchPredicate)
        
        self.filteredAppleProducts = array as! [String]
        
        self.tableView.reloadData()
    }
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredAppleProducts.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        
        let array = (self.appleProducts as NSArray).filteredArrayUsingPredicate(searchPredicate)
        
        self.filteredAppleProducts = array as! [String]
        
        self.tableView.reloadData()
        
    }
    
}