//
//  EditNoteViewController.swift
//  LightNote
//
//  Created by Johyeon Yoon on 2021/04/28.
//

import UIKit

class EditNoteViewController: UIViewController {
    
    var textToSet : String?
    var dateToSet : String?
    @IBOutlet weak var textView : UITextView!
    @IBOutlet weak var dateLabel : UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.textView.text = self.textToSet
        self.dateLabel.text = self.dateToSet
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
