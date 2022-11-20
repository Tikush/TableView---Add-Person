//
//  ViewController.swift
//  TikoJanikashvili-Lecture13
//
//  Created by Tiko Janikashvili on 20.11.22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addButtin: UIButton!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var surnameTextField: UITextField!
    @IBOutlet private weak var ageTextField: UITextField!
    
    // MARK: - Properties
    private var persons: [Person] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        registerCell()
    }
    
    // MARK: - Register Cell
    
    private func registerCell() {
        tableView.register(UINib(nibName: "PersonCell", bundle: nil), forCellReuseIdentifier: "PersonCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupLayout() {
        addButtin.alpha = 0.7
        addButtin.layer.cornerRadius = 7
    }
    
    private func alert() {
        let alert = UIAlertController(title: "შეცდომა", message: "გთხოვთ შეავსოთ ყველა მონაცემი", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true)
    }
    
    // MARK: - IBActions
    
    @IBAction private func addPerson(_ sender: UIButton) {
        if nameTextField.text == "" || surnameTextField.text == "" || ageTextField.text == "" {
            alert()
        } else {
            let newPerson = Person(name: nameTextField.text!, surname: surnameTextField.text!, age: Int(ageTextField.text!) ?? 0)
            persons.append(newPerson)
            tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonCell
        cell?.configure(with: persons[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}

