//
//  ViewController.swift
//  Project7
//
//  Created by alim on 29.12.2023.
//

import UIKit

class ViewController: UITableViewController {
  var petitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString:String
        if navigationController?.tabBarItem.tag == 0{
            urlString =    "https://www.hackingwithswift.com/samples/petitions-1.json"
        }else{
            urlString = "https://api.whitehouse.gov/v1/petitions.json?.signatureCountFloor=10000&limit=100"
        }
        
        
        if let url = URL(string:  urlString){
            if let data = try? Data(contentsOf: url){
                parse(json: data)
                return
            }
        }
        showError()
    }
    func showError(){
        let ac = UIAlertController(title: "Loadin Error", message:"There was a problerm loading the feed; please check your connection and try again. " , preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac,animated: true)
    }
    
    func parse(json:Data){
        	let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitons.self, from: json)
            {
            petitions = jsonPetitions.results
            tableView.reloadData()
            }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Title goes here"
        cell.detailTextLabel?.text = "Subtitle goes here"
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}

