//
//  DogViewController.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/12/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import UIKit

class DogViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var newImageButton: UIButton!
    
    
    
    var dogItemController = DogItemController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogItemController.fetchItems { (dogInfo) in
            if let dogInfo = dogInfo {
                self.updateUI(with: dogInfo)
            }
        }
    }
    
    func updateUI(with dogItem: DogItem) {
        let task = URLSession.shared.dataTask(with: dogItem.message, completionHandler: { (data, response, error) in
            
            guard let data = data,
                let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.dogImageView.image = image
            }
        })
        
        task.resume()
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
