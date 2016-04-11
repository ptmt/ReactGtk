import Foundation

public typealias RCTJavaScriptCompleteBlock = (NSError) -> ()
public typealias RCTJavaScriptCallback = (AnyObject, NSError) -> ()

public protocol BridgeModule {
  var moduleName: String { get }
}
/**
 * Abstracts away a JavaScript execution context - we may be running code in a
 * web view (for debugging purposes), or may be running code in a `JSContext`.
 */

public protocol JavaScriptExecutor: BridgeModule {
  /**
   * Used to set up the executor after the bridge has been fully initialized.
   * Do any expensive setup in this method instead of `-init`.
   */
  func setUp()

  /**
   * Whether the executor has been invalidated
   */
  var valid: Bool { get }

  /**
   * Runs an application script, and notifies of the script load being complete via `onComplete`.
   */
  func executeApplicationScript(script: NSData, sourceURL: NSURL, onComplete: RCTJavaScriptCompleteBlock)

}



//
// /**
//  * Executes BatchedBridge.flushedQueue on JS thread and calls the given callback
//  * with JSValue, containing the next queue, and JSContext.
//  */
// - (void)flushedQueue:(RCTJavaScriptCallback)onComplete;
//
// /**
//  * Executes BatchedBridge.callFunctionReturnFlushedQueue with the module name,
//  * method name and optional additional arguments on the JS thread and calls the
//  * given callback with JSValue, containing the next queue, and JSContext.
//  */
// - (void)callFunctionOnModule:(NSString *)module
//                       method:(NSString *)method
//                    arguments:(NSArray *)args
//                     callback:(RCTJavaScriptCallback)onComplete;
//
// /**
//  * Executes BatchedBridge.invokeCallbackAndReturnFlushedQueue with the cbID,
//  * and optional additional arguments on the JS thread and calls the
//  * given callback with JSValue, containing the next queue, and JSContext.
//  */
// - (void)invokeCallbackID:(NSNumber *)cbID
//                arguments:(NSArray *)args
//                 callback:(RCTJavaScriptCallback)onComplete;
//
// /**
//  * Runs an application script, and notifies of the script load being complete via `onComplete`.
//  */
// - (void)executeApplicationScript:(NSData *)script
//                        sourceURL:(NSURL *)sourceURL
//                       onComplete:(RCTJavaScriptCompleteBlock)onComplete;
//
// - (void)injectJSONText:(NSString *)script
//    asGlobalObjectNamed:(NSString *)objectName
//               callback:(RCTJavaScriptCompleteBlock)onComplete;
//
// /**
//  * Enqueue a block to run in the executors JS thread. Fallback to `dispatch_async`
//  * on the main queue if the executor doesn't own a thread.
//  */
// - (void)executeBlockOnJavaScriptQueue:(dispatch_block_t)block;
//
// @optional
//
// /**
//  * Special case for Timers + ContextExecutor - instead of the default
//  *   if jsthread then call else dispatch call on jsthread
//  * ensure the call is made async on the jsthread
//  */
// - (void)executeAsyncBlockOnJavaScriptQueue:(dispatch_block_t)block;
//
// /**
//  * For executors that support it, this method can be used to add a synchronous
//  * callback function for communicating with the javascript context.
//  */
// - (void)addSynchronousHookWithName:(NSString *)name usingBlock:(id)block;
//
// @end
