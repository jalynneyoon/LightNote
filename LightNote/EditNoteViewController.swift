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
            print("알림 띄우기")
            alert(message: "변경사항을 저장하시겠습니까?")
        }
        self.navigationController?.popViewController(animated: true)
        
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


extension UIViewController {
    func alert(title: String = "알림",message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "저장", style: .default, handler: {(action: UIAlertAction) -> Void in

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

