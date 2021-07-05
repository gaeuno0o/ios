//
//  LoginController.swift
//  project0310
//
//  Created by 김가은 on 2021/06/21.
//

import Foundation
import UIKit

class OnboardingController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func startButton(_ sender: Any) {
        presentMainVC()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func presentMainVC() {
           let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
           let vc = storyboard.instantiateViewController(withIdentifier: "SelfAuth")
           vc.modalPresentationStyle = .fullScreen
           present(vc, animated: false, completion: nil)
       }
}
