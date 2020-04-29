import UIKit

class MealListTableViewController: UITableViewController {

    var restaurant: Restaurant?
    var meals = [Meal]()
    
    let activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let restaurantName = restaurant?.name {
            self.navigationItem.title = restaurantName
        }
        
        loadMeals()

    }
    
    func loadMeals() {
        
        Helpers.showActivityIndicator(activityIndicator, view)
        
        if let restaurantId = restaurant?.id {
            
            APIManager.shared.getMeals(restaurantId: restaurantId, completionHandler: { (json) in
                print(json)
                if json != nil {
                    self.meals = []
                    
                    if let tempMeals = json["meals"].array {
                        
                        for item in tempMeals {
                            let meal = Meal(json: item)
                            self.meals.append(meal)
                        }
                        
                        self.tableView.reloadData()
                        Helpers.hideActivityIndicator(self.activityIndicator)
                    }
                }
            })
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "MealDetails" {
            let controller = segue.destination as! MealDetailsViewController
            controller.meal = meals[(tableView.indexPathForSelectedRow?.row)!]
            controller.restaurant = restaurant
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealViewCell
        
        let meal = meals[indexPath.row]
        cell.lbMealName.text = meal.name
        cell.lbMealShortDescription.text = meal.short_description
        
        if let price = meal.price {
            cell.lbMealPrice.text = "$\(price)"
        }
        
        if let image = meal.image {
            Helpers.loadImage(cell.imgMealImage, "\(image)")
        }
        
        return cell
    }

}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


