import Foundation

let RCTJSCThreadName = "RCTJSCThreadName"

public class JSCExecutor: NSObject, JavaScriptExecutor {
  public var moduleName = "JSCExecutor"
  public var valid = true

  // var context: JavaScriptContext
  // var javaScriptThread: NSThread
  // var bundleURL: NSURL

  public override init() {
    // self.javaScriptThread = NSThread() {
    //   self.runRunLoopThread()
    // }
    // //self.javaScriptThread.name = RCTJSCThreadName;
    // javaScriptThread.start()
    // [self executeBlockOnJavaScriptQueue: ^{
    //   RCTJSCExecutor *strongSelf = weakSelf;
    //   if (!strongSelf) {
    //     return;
    //   }
    //   // Assumes that no other JS tasks are scheduled before.
    //   if (context) {
    //     strongSelf->_context = [[RCTJavaScriptContext alloc] initWithJSContext:context];
    //   }
    // }];
  }

  public func setUp() {
    print("JSCExecutor:setUp()")
  }

  // public func executeBlockOnJavaScriptQueue(block: () -> () ) {
  //   if (NSThread.currentThread() != self.javaScriptThread) {
  //     self.performSelector(_: executeBlockOnJavaScriptQueue,
  //                  onThread:self._javaScriptThread, withObject:block)
  //   } else {
  //     block();
  //   }
  // }

  // public func executeAsyncBlockOnJavaScriptQueue:(block: dispatch_block_t)
  // {
  //   [self performSelector:@selector(executeBlockOnJavaScriptQueue:)
  //                onThread:_javaScriptThread
  //              withObject:block
  //           waitUntilDone:NO];
  // }

}
