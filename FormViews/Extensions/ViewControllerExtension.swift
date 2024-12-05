//
//  ViewControllerExtension.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/1/24.
//

import Foundation
import UIKit

extension UIViewController{
    func configureNavigationBar(){
        //self.image.layer.cornerRadius = self.image.frame.size.width / 2 // Napravite sliku kružnom
        // Kreiraj UIImageView za sličicu
        let logoImage = UIImage(systemName: "doc.badge.gearshape.fill")
        
        let imageView = UIImageView(image: logoImage)
        imageView.tintColor = .systemBackground
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24) // Postavi dimenzije
        
        
        // Kreiraj custom UIView koji će sadržati sličicu
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        containerView.addSubview(imageView)
        imageView.center = CGPoint(x: containerView.bounds.midX, y: containerView.bounds.midY)
        containerView.layer.cornerRadius = containerView.frame.size.width / 2
        containerView.backgroundColor = .systemGray2
        // Kreiraj UIBarButtonItem sa customView
        let leftBarButtonItem = UIBarButtonItem(customView: containerView)
        
        // Kreiraj negativni spacer kako bi sličica bila skroz lijevo
        let negativeSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpacer.width = -16 // Podesi širinu prema potrebama
        
        // Postavi oba UIBarButtonItem-a (negativeSpacer + leftBarButtonItem)
        self.navigationItem.leftBarButtonItems = [negativeSpacer, leftBarButtonItem]
        
        // Kreiraj desni bar button za "Exit"
        let exitButton = UIBarButtonItem(title: "Exit", style: .plain, target: self, action: #selector(exitButtonTapped))
        self.navigationItem.rightBarButtonItem = exitButton
    }
    
    @objc func exitButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func configureNextButton(for button: UIButton){
        var config = UIButton.Configuration.filled()
           config.title = "Next"
           config.image = UIImage(systemName: "chevron.forward.circle.fill")
           config.imagePlacement = .trailing
           config.imagePadding = 4
        button.configuration = config
    }
    
    func configureBackButton(for button: UIButton){
        var config = UIButton.Configuration.filled()
           config.title = "Back"
           config.image = UIImage(systemName: "chevron.backward.circle.fill")
        config.imagePlacement = .leading
           config.imagePadding = 4
        
        button.configuration = config
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func navigateToNextScreen(to submitViewController: UIViewController){
        navigationController?.pushViewController(submitViewController, animated: true)
    }
}
