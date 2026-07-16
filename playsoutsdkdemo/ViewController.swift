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
    var btn2: UIButton!
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
            btn.addTarget(self, action: #selector(btnPlaysout), for: .touchUpInside)
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            
            btn2 = UIButton()
            btn2.backgroundColor = .cyan
            btn2.setTitle("Open Game", for: .normal)
            btn2.setTitleColor(.black, for: .normal)
            btn2.layer.cornerRadius = 8
            btn2.layer.borderWidth = 1
            btn2.layer.borderColor = UIColor.darkGray.cgColor
            
            btn2.layer.shadowColor = UIColor.black.cgColor
            btn2.layer.shadowOffset = CGSize(width: 0, height: 2)
            btn2.layer.shadowOpacity = 0.3
            btn2.layer.shadowRadius = 3
            
            btn2.addTarget(self, action: #selector(btnTouchDown), for: .touchDown)
            btn2.addTarget(self, action: #selector(btnTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
            btn2.addTarget(self, action: #selector(btnOpenGame), for: .touchUpInside)
            
            btn2.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(btn)
            view.addSubview(btn2)
        }
        
        private func setupConstraints() {
            let stackView = UIStackView(arrangedSubviews: [btn, btn2])
            stackView.axis = .vertical
            stackView.spacing = 20  // 设置按钮间距
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            // 将堆栈视图添加到主视图
            view.addSubview(stackView)
            
            NSLayoutConstraint.activate([
                // 堆栈视图居中
                stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
                
                // 按钮尺寸
                btn.widthAnchor.constraint(equalToConstant: 120),
                btn.heightAnchor.constraint(equalToConstant: 44),
                btn2.widthAnchor.constraint(equalToConstant: 120),
                btn2.heightAnchor.constraint(equalToConstant: 44)
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
    
    @objc func btnPlaysout() {
        print("btnPlaysout")
        
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
    
    @objc func btnOpenGame() {
        print("btnOpenGame")
        
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
        currentBoundViewController?.engine.viewController = nil
        currentBoundViewController = nil
        let flutterViewController = PlaysoutController(engine: flutterEngine, channelName: "com.playsout.minigames", method: "init", arguments: ["appAdId":"ca-app-pub-3940256099942544/1712485313","gameAdId":"ca-app-pub-3940256099942544/1712485313","gameId":"poiv5z171lslnuof0g","gameTitle":"KittyCrushSaga"])
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

