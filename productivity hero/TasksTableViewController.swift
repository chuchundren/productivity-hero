//
//  TasksTableViewController.swift
//  productivity hero
//
//  Created by Дарья on 10.11.2020.
//

import UIKit

struct CellData {
    var isExpanded = Bool()
    var title = String()
    var sectionData = [Task]()
}

class TasksTableViewController: UITableViewController {
    
    var heroVC = ViewController()
    var tableViewData = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [CellData(isExpanded: false, title: TestData2.study.title, sectionData: TestData2.study.tasks),
                         CellData(isExpanded: false, title: TestData2.exersize.title, sectionData: TestData2.exersize.tasks),
                         CellData(isExpanded: false, title: TestData2.mental.title, sectionData: TestData2.mental.tasks),
                         CellData(isExpanded: false, title: TestData2.health.title, sectionData: TestData2.health.tasks),
        ]
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].isExpanded == true {
            return tableViewData[section].sectionData.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? ExpandableTableViewHeader ?? ExpandableTableViewHeader(reuseIdentifier: "header")
        header.titleLabel.text = tableViewData[section].title
        header.arrowLabel.text = ">"
        header.rotateArrow(expanded: tableViewData[section].isExpanded)
        header.section = section
        header.delegate = self
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48.0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
        cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row].title
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        heroVC.hero.health += tableViewData[indexPath.section].sectionData[indexPath.row].healthEffect
        heroVC.hero.defence += tableViewData[indexPath.section].sectionData[indexPath.row].defenceEffect
        heroVC.hero.strength += tableViewData[indexPath.section].sectionData[indexPath.row].strengthEffect
        heroVC.hero.mana += tableViewData[indexPath.section].sectionData[indexPath.row].manaEffect
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        heroVC.configureLabels()
    }
    
}


extension TasksTableViewController: ExpandableTableViewHeaderDelegate {
    func toggleSection(header: ExpandableTableViewHeader, section: Int) {
        let expanded = !tableViewData[section].isExpanded
        
        tableViewData[section].isExpanded = expanded
        header.rotateArrow(expanded: expanded)
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
}
