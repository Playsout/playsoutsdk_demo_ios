//
//  SecondViewController.swift
//  playsoutsdkdemo
//
//  Created by Jason on 2025/9/27.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    var btn: UIButton!
    private var currentBoundViewController: FlutterViewController?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Native View"
            
            setupButton()
            setupConstraints()
        }
        
        private func setupButton() {
            btn = UIButton()
            btn.backgroundColor = .cyan
            btn.setTitle("Playsout", for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.layer.cornerRadius = 8
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.darkGray.cgColor
            
            btn.layer.shadowColor = UIColor.black.cgColor
            btn.layer.shadowOffset = CGSize(width: 0, height: 2)
            btn.layer.shadowOpacity = 0.3
            btn.layer.shadowRadius = 3
            
            btn.addTarget(self, action: #selector(btnTouchDown), for: .touchDown)
            btn.addTarget(self, action: #selector(btnTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
            btn.addTarget(self, action: #selector(btnChoose), for: .touchUpInside)
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(btn)
        }
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([

                btn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                btn.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
                
                btn.widthAnchor.constraint(equalToConstant: 120),
                
                btn.heightAnchor.constraint(equalToConstant: 44)
            ])
        }

    @objc func btnTouchDown() {

        UIView.animate(withDuration: 0.1) {
            self.btn.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    @objc func btnTouchUp() {

        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseOut,
                       animations: {
            self.btn.transform = .identity
        })
    }
    
    @objc func btnChoose() {
        print("btnChoose")
        
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
        feedbackGenerator.impactOccurred()
        
        UIView.animate(withDuration: 0.3, animations: {
            self.btn.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                self.btn.transform = .identity
            }
        }
        
            
            let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
            //flutterEngine.viewController = nil
        currentBoundViewController?.engine.viewController = nil
                currentBoundViewController = nil
        let flutterViewController = PlaysoutController(engine: flutterEngine, channelName: "com.playsout.minigames", method: "init", arguments: ["appAdId":"ca-app-pub-3940256099942544/1712485313","gameAdId":"ca-app-pub-3940256099942544/1712485313"])
        currentBoundViewController = flutterViewController
            flutterViewController.hidesBottomBarWhenPushed = true
            flutterViewController.modalPresentationStyle = .fullScreen
            
            let navController = self.navigationController

        navController?.setNavigationBarHidden(true, animated: false)
        navController?.pushViewController(flutterViewController, animated: false)
           
        
        //present(flutterViewController, animated: true, completion: {
        //        print("present playsout)
        //    })
             
        }
         
}

