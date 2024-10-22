//
//  SettingsViewController.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    var favoriteItems = ["teste1", "teste2"]

        override func viewDidLoad() {
            super.viewDidLoad()

            title = "Favoritos"
            view.backgroundColor = .white

            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "favoriteCell")
        }

        // MARK: - DataSource

        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return favoriteItems.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
            
            cell.textLabel?.text = favoriteItems[indexPath.row]

            return cell
        }

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)

            let selectedItem = favoriteItems[indexPath.row]
            print("Item selecionado: \(selectedItem)")
        }
    }
