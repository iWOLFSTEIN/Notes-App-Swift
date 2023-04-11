//
//  CreateNoteViewController.swift
//  Notes Keeper
//
//  Created by BrainX Technologies on 06/04/2023.
//
import UIKit


protocol SecondaryViewControllerDelegate: AnyObject {
    func didUpdateSecondaryView(_ viewController: CreateNoteViewController, withData data: Any)
}


class CreateNoteViewController: UIViewController {
    
    weak var delegate: SecondaryViewControllerDelegate?

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var headingField: UITextField!
    @IBOutlet weak var textArea: UITextView!
    
    
    var isNewNote: Bool = true
    var noteModel: Notes = Notes(head: "", note: "", timestamp: Date())

  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        saveButton.layer.cornerRadius = 5
    
    
        headingField.delegate = self
//        headingField.returnKeyType = .done
        headingField.placeholder = "Note heading"
        
        
        textArea.delegate = self
        textArea.layer.cornerRadius = 5
        
        
        headingField.text = noteModel.heading
        textArea.text = noteModel.noteBody
        

    }


    @IBAction func saveNote(_ sender: UIButton) {
//                print(noteModel.heading)
//                print(noteModel.noteBody)
        
        if noteModel.heading.isEmpty {noteModel.heading = "New Note"} else {noteModel.heading = headingField.text!}
        if noteModel.noteBody.isEmpty {noteModel.noteBody = ""}
        
//        print(noteModel.heading)
//        print(noteModel.noteBody)
        
        if isNewNote {
            noteModel.time = Date()
        }
      
        
//        noteModel.noteBody = textArea.text
        
        delegate?.didUpdateSecondaryView(self, withData: noteModel)
        backButtonTapped(saveButton)
        
    }
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}



extension CreateNoteViewController: UITextFieldDelegate, UITextViewDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        noteModel.heading = textField.text!
    }
    
    func textViewDidChange(_ textView: UITextView) {
        noteModel.noteBody = textView.text
    }
}
