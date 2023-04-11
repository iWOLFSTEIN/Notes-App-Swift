//
//  NotesListViewController.swift
//  Notes Keeper
//
//  Created by BrainX Technologies on 06/04/2023.
//
import UIKit

class NotesListViewController: UIViewController{

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var addNoteButton: UIButton!
    
    
    var updateIndex = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 70
        addNoteButton.layer.cornerRadius = 25

       
    }

    
    
    @IBAction func addNote(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "CreateNote", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CreateNoteViewController") as! CreateNoteViewController
        viewController.delegate = self
        present(viewController, animated: true, completion: nil)


        
    }
}
extension NotesListViewController: UITableViewDelegate, UITableViewDataSource, SecondaryViewControllerDelegate{
    
    func didUpdateSecondaryView(_ viewController: CreateNoteViewController, withData data: Any) {
        let noteModel: Notes = (data as? Notes)!
        if updateIndex < 0 {
            notesList.append(noteModel)
        }
        else {
            notesList[updateIndex] = noteModel
            updateIndex = -1
        }
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
        
//        cell?.textLabel?.text = notesList[indexPath.item].heading
//        cell?.textLabel?.textColor = UIColor.white
//        cell?.contentView.backgroundColor = UIColor(red: 68/255, green: 60/255, blue: 104/255, alpha: 1.0)
        cell?.cellHeading.text = notesList[indexPath.item].heading
        cell?.cellSubheading.text = notesList[indexPath.item].noteBody
        cell?.cellTrailingText.text = DateToString(notesList[indexPath.item].time)
//        cell?.layer.cornerRadius = 5

        
  
        return cell!
    }
    
    
    func DateToString(_ date: Date) -> String {
        let date = Date() // get the current date and time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // set the format for the date string
        let dateString = dateFormatter.string(from: date) // convert date to string
        return dateString
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "CreateNote", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "CreateNoteViewController") as! CreateNoteViewController
        destinationVC.delegate = self
        
        updateIndex = indexPath.item
//        print(updateIndex)
        destinationVC.noteModel = notesList[indexPath.item]
        destinationVC.isNewNote = false
        
        self.present(destinationVC, animated: true, completion: nil)
    }
    
}




