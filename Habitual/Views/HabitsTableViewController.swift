//
//  MainViewController.swift
//  Habitual
//
//  Created by Marissa Vang on 3/24/20.
//  Copyright © 2020 Marissa Vang. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {
    var habits: [Habit] = [
        Habit(title: "Go to bed before 10pm", image: Habit.Images.book),
        Habit(title: "Drink 8 Glasses of Water", image: Habit.Images.book),
        Habit(title: "Commit Today", image: Habit.Images.book),
        Habit(title: "Stand up every Hour", image: Habit.Images.book)
    ]
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistence.habits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell( withIdentifier: HabitTableViewCell.identifier, for: indexPath) as! HabitTableViewCell
      let habit = persistence.habits[indexPath.row]
      cell.configure(habit)
      return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        tableView.register(
                    HabitTableViewCell.nib,
                    forCellReuseIdentifier: HabitTableViewCell.identifier
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        persistence.setNeedsToReloadHabits()
        tableView.reloadData()
    }

}
    
extension HabitsTableViewController {

    func setupNavBar() {
        title = "Habitual"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
            navigationItem.rightBarButtonItem = addButton
    }

    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
//            habits.insert("Hello, World!", at: 0)
//            let topIndexPath = IndexPath(row: 0, section: 0)
//            tableView.insertRows(at: [topIndexPath], with: .automatic)
        
        //it's important that you update the dataSource, in our case the names array, BEFORE you use tableView.insertRows(at:with:). Otherwise, you'll get an inconsistency error in your debugger. The table view will fact check by invoking the number of rows.
        }
    }

private var persistence = PersistenceLayer()
