//
//  ViewController.swift
//  Test_3rd_Month
//
//  Created by Atai Begaliev on 12/12/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var notesTableView: UITableView!
    var notes: [String] = ["Car", "Home", "School","Haircut","Birthday"]
    var notesNew: [NoteModel] = [NoteModel(noteImage: "", noteLabel: "1"),NoteModel(noteImage: "", noteLabel: "2")]
    
    
    
    var addButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FilteredNotes = notes
        setupSubviews()
    }
    
    func setupSubviews () {
        
        addButton.setTitleColor(.white, for: .normal)
        addButton.setTitle("+", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        addButton.layer.cornerRadius = 80/2
        addButton.backgroundColor = .black
        addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
        
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    @objc func addButtonTap () {
        let alert = UIAlertController(title: "New Notes", message: "What you plan to do?", preferredStyle: .alert)
        
        var textField = UITextField()
        
        alert.addTextField { alertTextField in
            textField = alertTextField
        }
        
        let yesAction = UIAlertAction(title: "YES", style: .cancel) { action in
            ()
            self.notes.insert(textField.text ?? "NOTHING", at: 0)
            FilteredNotes = self.notes
            self.notesTableView.reloadData()
        }
        let noAction = UIAlertAction(title: "NO", style: .destructive) { action in
            ()
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "notes_cell", for: indexPath) as! NotesCell
        cell.cellLabel.text = notes[indexPath.row]
        cell.indexPath = indexPath
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  50
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "notes_cell", for: indexPath) as! NotesCell
//        var isDone :Bool = false
//        if isDone == false {
//            
//            cell.cellImage.image = UIImage(systemName: "checkmark.circle.fill")
//            notes.remove(at: indexPath.row)
//            notes.insert(notes[indexPath.row], at: 0)
//            self.notesTableView.reloadData()
//            print(notes)
//            isDone = true
//        }else{
//            
//            cell.cellImage.image = UIImage(systemName: "circle")
//
//            isDone = false
//        }
//    }
}



