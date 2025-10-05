//
//  PlaysoutController.swift
//  playsoutsdkdemo
//
//  Created by Jason Zheng on 2025/9/27.
//

import UIKit
import Flutter

class PlaysoutController: FlutterViewController {
    
    override func viewDidLoad() {
            super.viewDidLoad()
            print("📱 PlaysoutController viewDidLoad()")
            // Do any additional setup after loading the view.
            self.navigationItem.title = "Playsou View"
        }
    override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            print("📱 PlaysoutController viewDidDisappear()")
            
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("📱 PlaysoutController viewWillAppear")
    }
    deinit {
            print("exit playsout")
        
        }
    /// 实例化方法
        /// - Parameters:
        ///   - engine: 实例化环境engine
        ///   - channelName: 要与main.dart中一致,路由channel名
        ///   - method: 传参的方法名
        ///   - arguments: 传参的参数内容
        init(engine: FlutterEngine, channelName: String = "",method: String = "",arguments:[String: Any]?) {
            super.init(engine: engine, nibName: nil, bundle: nil)
            print("✅ PlaysoutController init")
            
            let messageChannel = FlutterMethodChannel(name: channelName, binaryMessenger: self.binaryMessenger)
            messageChannel.invokeMethod(method, arguments: arguments)
            messageChannel.setMethodCallHandler{[weak self] (call, result) in
                guard let strongSelf = self else { return }
    
                print("Playsout method:\(call.method) arguments:\(String(describing: call.arguments))")
    
            }
             
        }
    required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
