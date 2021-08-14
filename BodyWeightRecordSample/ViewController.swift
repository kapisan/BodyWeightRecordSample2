//
//  ViewController.swift
//  BodyWeightRecordSample
//
//  Created by niwa  shuhei on 2021/08/13.
//

import UIKit

struct Item {
    let id: Int
    let title: String

    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var todoItem = [Item]()

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var textField: UITextField!

//    @IBOutlet private weak var label1: UILabel!
//    @IBOutlet private weak var label2: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.textField.delegate = self

        tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

//        label1.text = todoItem[0][0]
        let label1 = cell.contentView.viewWithTag(1)as! UILabel
        let label2 = cell.contentView.viewWithTag(2)as! UILabel

//        label1.text = String(todoItem[[0][0]].id)
//        label2.text = String(todoItem[[0][0]].title)

        label1.text = String(todoItem[[indexPath.row][0]].id)
        label2.text = String(todoItem[[indexPath.row][0]].title)
        return cell
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func addActionButton(_ sender: UIButton) {
        guard let textFieldValue = textField.text else {
            return
        }

        let textFieldItem: Item = Item(id: 1, title: textFieldValue)

//        todoItem.append(textFieldValue)
        todoItem.append(textFieldItem)
        textField.text = ""
        tableView.reloadData()
    }

}

