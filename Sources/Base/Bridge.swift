import Executors
import Foundation
import Dispatch

public typealias RCTSourceLoadBlock = (NSError?, NSData?) -> ()

public class Bridge {

  public let bundleURL: NSURL?

  init(withURL: NSURL) {
    print("Bridge initialized", withURL.absoluteString)
    self.bundleURL = withURL

    // _jsTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(_jsThreadUpdate:) userInfo:nil repeats:YES];

    // [RCTBridge setCurrentBridge:self];

    self.start()
  }

  func start() {

    let bridgeQueue = dispatch_queue_create("com.facebook.react.RCTBridgeQueue", DISPATCH_QUEUE_CONCURRENT);

    let initModulesAndLoadSource: dispatch_group_t = dispatch_group_create();

    // Asynchronously load source code
    dispatch_group_enter(initModulesAndLoadSource);
    //__weak RCTBatchedBridge *weakSelf = self;
    let sourceCode: NSData;
    self.loadSource({ (error: NSError?, source: NSData?) -> () in
      if (error != nil) {
        dispatch_async(dispatch_get_main_queue()) {
          print("stopLoadingWithError", error)
          //[weakSelf stopLoadingWithError:error];
        };
      }

      sourceCode = source;
      dispatch_group_leave(initModulesAndLoadSource);
    })

    // Synchronously initialize all native modules that cannot be loaded lazily
    print("initModulesWithDispatchGroup::initModulesAndLoadSource")
    //[self initModulesWithDispatchGroup:initModulesAndLoadSource];

    // if (RCTProfileIsProfiling()) {
    //   // Depends on moduleDataByID being loaded
    //   RCTProfileHookModules(self);
    // }

    // var config: NSString
    // dispatch_group_enter(initModulesAndLoadSource);
    // dispatch_async(bridgeQueue) {
    //   let setupJSExecutorAndModuleConfig = dispatch_group_create();
    //
    //   // Asynchronously initialize the JS executor
    //   dispatch_group_async(setupJSExecutorAndModuleConfig, bridgeQueue) {
    //     //[weakSelf setUpExecutor];
    //     print("self.setUpExecutor")
    //   }
    //
    //   // Asynchronously gather the module config
    //   dispatch_group_async(setupJSExecutorAndModuleConfig, bridgeQueue, ^{
    //     if (weakSelf.valid) {
    //       RCTPerformanceLoggerStart(RCTPLNativeModulePrepareConfig);
    //       print("self.moduleConfig")
    //       //config = [weakSelf moduleConfig];
    //       RCTPerformanceLoggerEnd(RCTPLNativeModulePrepareConfig);
    //     }
    //   });
    //
    //   dispatch_group_notify(setupJSExecutorAndModuleConfig, bridgeQueue) {
    //     // We're not waiting for this to complete to leave dispatch group, since
    //     // injectJSONConfiguration and executeSourceCode will schedule operations
    //     // on the same queue anyway.
    //     RCTPerformanceLoggerStart(RCTPLNativeModuleInjectConfig);
    //     self.injectJSONConfiguration(config, onComplete:(NSError error) {
    //       RCTPerformanceLoggerEnd(RCTPLNativeModuleInjectConfig);
    //       if (error) {
    //         dispatch_async(dispatch_get_main_queue(), ^{
    //           [weakSelf stopLoadingWithError:error];
    //         });
    //       }
    //     })
    //     dispatch_group_leave(initModulesAndLoadSource);
    //   }
    // }
    //
    // dispatch_group_notify(initModulesAndLoadSource, dispatch_get_main_queue(), ^{
    //   RCTBatchedBridge *strongSelf = weakSelf;
    //   if (sourceCode && strongSelf.loading) {
    //     //[strongSelf executeSourceCode:sourceCode];
    //     self.executesourceCode(sourceCode)
    //   }
    // });
  }

  func loadSource(onSourceLoad: RCTSourceLoadBlock)
  {

    if (self.bundleURL != nil) {
      JavaScriptLoader.loadBundle(atURL: self.bundleURL, onComplete: onSourceLoad)
    } else {
      // Allow testing without a script
      dispatch_async(dispatch_get_main_queue()) {
        // [self didFinishLoading];
        // [[NSNotificationCenter defaultCenter]
        //  postNotificationName:RCTJavaScriptDidLoadNotification
        //  object:_parentBridge userInfo:@{@"bridge": self}];
      }
      onSourceLoad(nil, nil)
    }
  }
}
