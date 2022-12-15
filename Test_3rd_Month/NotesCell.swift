
import Foundation
import UIKit

class NotesCell : UITableViewCell {
    
    @IBOutlet weak var cellImage : UIImageView!
    @IBOutlet weak var cellLabel : UILabel!
    
    var isDone :Bool = false
    var indexPath: IndexPath!
    let vc = ViewController()
    
    override func layoutSubviews() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(fillTap))
        cellImage.addGestureRecognizer(tap)
        cellImage.isUserInteractionEnabled = true
        
    }
    @objc func fillTap() {
        if isDone == false {
            cellImage.image = UIImage(systemName: "checkmark.circle.fill")
            vc.notes.remove(at: indexPath.row)
            vc.notes.insert(vc.notes[indexPath.row], at: 0)
//            vc.notesTableView.reloadData() не работает 
            print(vc.notes)
            isDone = true
        }else{
            cellImage.image = UIImage(systemName: "circle")

            isDone = false
        }
    }
}


