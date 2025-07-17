# WKUserContentController

`WKUserContentController` provides declarative methods to manage user scripts and message handlers for a `WKWebView`.

## Methods

### Some default parameters

The following standard parameters can be written declaratively.

```swift
func addScriptMessageHandler(_ scriptMessageHandler: WKScriptMessageHandler, name: String) -> Self
func add(userScript: WKUserScript) -> Self
func clearUserScripts() -> Self
func addScriptMessageHandler(_ scriptMessageHandler: any WKScriptMessageHandler, contentWorld world: WKContentWorld, name: String) -> Self
func addScriptMessageHandlerWithReply(_ scriptMessageHandlerWithReply: any WKScriptMessageHandlerWithReply, contentWorld: WKContentWorld, name: String) -> Self
func removeScriptMessageHandler(forName name: String, contentWorld: WKContentWorld) -> Self
func removeScriptMessageHandler(forName name: String) -> Self
func clearScriptMessageHandlers(from contentWorld: WKContentWorld) -> Self
func clearAllScriptMessageHandlers() -> Self
func addContentRuleList(_ contentRuleList: WKContentRuleList) -> Self
func removeContentRuleList(_ contentRuleList: WKContentRuleList) -> Self
func clearAllContentRuleLists() -> Self
```

#### Sample

```swift
WKUserContentController()
    .add(userScript: WKUserScript(source: "console.log('Hello from user script!');", injectionTime: .atDocumentEnd, forMainFrameOnly: true))
    .addScriptMessageHandler(self, name: "myMessageHandler")
    .addContentRuleList(myContentRuleList)
```