import CJSC

public class JavaScriptContext {
  var context: JSContextRef
  public init(withContext: JSContextRef) {
    self.context = withContext
  }
}
