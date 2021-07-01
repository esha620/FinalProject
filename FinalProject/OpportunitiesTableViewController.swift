import UIKit

class OpportunitiesTableViewController: UITableViewController {
    var opportunities : [Opportunity] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        opportunities = createOpportunities()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func createOpportunities() -> [Opportunity]{
        let scholarship1 = Opportunity()
        scholarship1.name = "Ocean Awareness Contest"
        scholarship1.type = "Scholarship"
        let scholarship2 = Opportunity()
        scholarship2.name = "Tallo"
        scholarship2.type = "Scholarship"
        let camp1 = Opportunity()
        camp1.name = "Kode with Klossy"
        camp1.type = "Camp"
        
        return [scholarship1, scholarship2, camp1]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return opportunities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let opportunity = opportunities[indexPath.row]
        
        if opportunity.type == "Scholarship" && opportunity.important{
            cell.textLabel?.text = "‼️💲" + opportunity.name
        }else if opportunity.type == "Camp" && opportunity.important{
            cell.textLabel?.text = "‼️✏️" + opportunity.name
        }else if opportunity.type == "Internship" && opportunity.important{
            cell.textLabel?.text = "‼️💻" + opportunity.name
        }else if opportunity.important{
            cell.textLabel?.text = "‼️" + opportunity.name
        }else{
            cell.textLabel?.text = opportunity.name
        }

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let opportunity = opportunities[indexPath.row]
        
        performSegue(withIdentifier: "moveToTrash", sender: opportunity)
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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let addVC = segue.destination as? AddToOpportunitiesViewController{
            addVC.previousVC = self
        }
        if let completeVC = segue.destination as? DeleteOppViewController{
            if let opportunity = sender as? Opportunity{
                completeVC.selectedOpportunity = opportunity
                completeVC.previousVC = self
            }
        }
    }

}
