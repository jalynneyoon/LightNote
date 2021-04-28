//
//  NewNoteViewController.swift
//  LightNote
//
//  Created by Johyeon Yoon on 2021/04/27.
//

import UIKit

class NewNoteViewController: UIViewController {
    
    @IBAction func touchUpCancelNewNote (_sender : Any){
        dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var noteTextView: UITextView!
    
    @IBAction func touchUpSaveNewNote (_ sender: Any) {
        guard let note = noteTextView.text else {
            return
        }
        
        let newNote = Note(content: note)
        Note.dummyNoteList.append(newNote)
        
        NotificationCenter.default.post(name: NewNoteViewController.newNoteDidInsert, object: nil)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewNoteViewController {
    static let newNoteDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
}
