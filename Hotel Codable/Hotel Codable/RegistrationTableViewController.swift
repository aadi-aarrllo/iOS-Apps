//
//  RegistrationTableViewController.swift
//  Hotel Codable
//
//  Created by Batch-2 on 03/05/24.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    
    var registrations = [Registration]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registrations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)
        let registration = registrations[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        cell.textLabel?.text = "\(registration.firstName) \(registration.lastName)"
        cell.detailTextLabel?.text = dateFormatter.string(from: registration.checkInDate) + " - " + dateFormatter.string(from: registration.checkOutDate) + ": " + registration.roomType.name

        return cell
    }

    @IBAction func unwindFromAddRegistration(unwindSegue: UIStoryboardSegue) {
        guard let addRegistrationTableViewController = unwindSegue.source as? AddRegistrationTableViewController,
            let registration = addRegistrationTableViewController.registration else { return }
        
        print("added")
        registrations.append(registration)
        tableView.reloadData()
    }

}
