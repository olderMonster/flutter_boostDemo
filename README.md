# flutter_boostDemo
一个简单的OC与Flutter的交互，通过flutter_boost实现两端相互跳转

注意在`AppDelegate`处注册`FlutterBoostPlugin`的回调中还注册了`Flutter`的`MethodChannel`，而没有直接通过
```
FlutterBoostPlugin.sharedInstance().addEventListener({ (name, arguments) in
            
}, forName: "eventName")
```
方式去添加事件监听。
