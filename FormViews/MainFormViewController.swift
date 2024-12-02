//
//  ViewController.swift
//  FormViews
//
//  Created by Orhan Pojskic on 24.10.2024..
//

import UIKit

class MainFormViewController: UIViewController {
    
    var tableView: UITableView!
    let viewModel = FormViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: self.view.frame, style: .insetGrouped)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        title = "Main Form"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: false)
        }
    }
}
    
extension MainFormViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getFormsNumber()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        
        let id = indexPath.row
        cell.titleLabel.text = viewModel.getFormName(id: id)
        cell.iconImageView.image = UIImage(systemName: "\(id+1).square.fill")

        cell.iconImageView.tintColor = .systemGray2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Kliknut je ovaj index: \(indexPath.row)")
        let id = indexPath.row
        let formVC = FormViewController()
        formVC.title = viewModel.getFormName(id: id)
        navigationController?.pushViewController(formVC, animated: true)
    }
}
    
    


