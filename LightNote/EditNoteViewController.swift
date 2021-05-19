//
//  EditNoteViewController.swift
//  LightNote
//
//  Created by Johyeon Yoon on 2021/04/28.
//

import UIKit

class EditNoteViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
    
    var textToSet : String?
    var dateToSet : String?
    @IBOutlet weak var textView : UITextView!
    @IBOutlet weak var dateLabel : UILabel!
    
    var note : String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.textView.text = self.textToSet
        self.dateLabel.text = self.dateToSet
    }
    
    
    @IBAction func popToNoteList(_ sender: UINavigationItem){
        note = textView.text
        if note != textToSet {
            alert(message: "변경사항을 저장하시겠습니까?")
        }
        else {
            self.navigationController?.popViewController(animated: true)
            
        }
        
    }
    
    @IBAction func doShare(_ sender: UIBarButtonItem){
        let shareText: String = self.textView.text
        var shareObject = [Any]()
        shareObject.append(shareText)
        
        let activityViewController = UIActivityViewController(activityItems: shareObject, applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
        
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


extension EditNoteViewController {
    func alert(title: String = "알림",message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "저장", style: .default, handler: {(action: UIAlertAction) -> Void in
            
            
            DataManager.shared.updateNote(newContent: self.note, rContent: self.textToSet, rInsertDate: self.dateToSet)
            self.navigationController?.popViewController(animated: true)
            })
        
        let cancelAction = UIAlertAction(title: "취소", style: .default, handler: {(action: UIAlertAction) -> Void in
            self.navigationController?.popViewController(animated: true)
            })
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        

        present(alert, animated: true, completion: nil)
    
    }
}

