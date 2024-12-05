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
    
    func updateSpacerConstraints(topSpacer: UIView?, bottomSpacer: UIView?, stackView: UIStackView, buttonsContainer: UIView, isInitialSetupComplete: Bool) {
        guard let topSpacer = topSpacer, let bottomSpacer = bottomSpacer else { return }
        
        // Reset spacers
        topSpacer.constraints.forEach { $0.isActive = false }
        bottomSpacer.constraints.forEach { $0.isActive = false }
        
        // Dobijamo visinu stackView-a kroz Auto Layout
        let stackViewHeight = stackView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        
        // Visina vidljivog prostora u scrollView-u
        let scrollViewHeight = view.frame.height
        - buttonsContainer.frame.height // Oduzimamo visinu buttonContainer-a
        - view.safeAreaInsets.top
        - view.safeAreaInsets.bottom
        
        if stackViewHeight < scrollViewHeight {
            let extraSpace = scrollViewHeight - stackViewHeight
            let spacerHeight = extraSpace / 2
            
            NSLayoutConstraint.activate([
                topSpacer.heightAnchor.constraint(equalToConstant: spacerHeight),
                bottomSpacer.heightAnchor.constraint(equalToConstant: spacerHeight)
            ])
        } else {
            NSLayoutConstraint.activate([
                topSpacer.heightAnchor.constraint(equalToConstant: 0),
                bottomSpacer.heightAnchor.constraint(equalToConstant: 0)
            ])
        }
        
        if isInitialSetupComplete {
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        } else {
            self.view.layoutIfNeeded()
        }
    }
    
    func setupSpacers(stackView: UIStackView, topSpacer: inout UIView?, bottomSpacer: inout UIView?) {
        // Dodaj top spacer
        topSpacer = UIView()
        //topSpacer?.backgroundColor = .black
        topSpacer?.translatesAutoresizingMaskIntoConstraints = false
        stackView.insertArrangedSubview(topSpacer!, at: 0)
        
        // Dodaj bottom spacer
        bottomSpacer = UIView()
        //bottomSpacer?.backgroundColor = .red
        bottomSpacer?.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(bottomSpacer!)
    }
}
