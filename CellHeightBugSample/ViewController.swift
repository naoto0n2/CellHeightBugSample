//
//  ViewController.swift
//  DifferentCellSample
//
//  Created by Naoto Onagi on 2016/12/07.
//  Copyright © 2016 AWA Co. Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate static let kCellIdentifier = "Cell"
    fileprivate static let kSegueIdentifier = "pushDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sample"
        
        let reloadButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reload))
        self.navigationItem.setRightBarButton(reloadButtonItem, animated: true)
    }
    
    func reload() {
        self.tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.row % 2 == 0) ? 40 : 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.kCellIdentifier, for: indexPath)
        cell.backgroundColor = (indexPath.row % 2 == 0) ? UIColor.white : UIColor.groupTableViewBackground
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: ViewController.kSegueIdentifier, sender: nil)
    }
}
