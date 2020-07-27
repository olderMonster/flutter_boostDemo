# flutter_boostDemo
一个简单的OC与Flutter的交互，通过flutter_boost实现两端相互跳转

注意在`AppDelegate`处注册`FlutterBoostPlugin`的回调中还注册了`Flutter`的`MethodChannel`
```
        FlutterBoostPlugin.sharedInstance().startFlutter(with: FlutterBoostPlatform()) { (engine) in
            let channel = FlutterMethodChannel.init(name: "com.dealear.ttp", binaryMessenger: engine.binaryMessenger)
            channel.setMethodCallHandler { (call, result) in
                print("setMethodCallHandler")
                if call.method == "updateStatusBarStyle" {
                    guard let dict = call.arguments as! [String:Any]? else {
                        return
                    }
                    guard let style = dict["style"] as! Int? else {
                        return
                    }
                    FlutterContainerView.updateStatusBarStyle(styleValue: style)
                }
            }
        }
```

而没有直接通过
```
FlutterBoostPlugin.sharedInstance().addEventListener({ (name, arguments) in
            
}, forName: "eventName")
```
方式去添加事件监听。
