# WKUserContentController

`WKUserContentController`は、`WKWebView`のユーザースクリプトとメッセージハンドラを管理するための宣言的なメソッドを提供します。

## メソッド

### 標準パラメータ

以下の標準パラメータは宣言的に記述できます。

```swift
func add(scriptMessageHandler: WKScriptMessageHandler, name: String) -> Self
func add(userScript: WKUserScript) -> Self
func clearUserScripts() -> Self
func add(scriptMessageHandler: any WKScriptMessageHandler, contentWorld world: WKContentWorld, name: String) -> Self
func add(scriptMessageHandlerWithReply: any WKScriptMessageHandlerWithReply, contentWorld: WKContentWorld, name: String) -> Self
func remove(ScriptMessageHandlerForName name: String, contentWorld: WKContentWorld) -> Self
func remove(ScriptMessageHandlerForName name: String) -> Self
func remove(scriptMessageHandlersFrom contentWorld: WKContentWorld) -> Self
func clearAllScriptMessageHandlers() -> Self
func add(contentRuleList: WKContentRuleList) -> Self
func remove(contentRuleList: WKContentRuleList) -> Self
func clearAllContentRuleLists() -> Self
```

#### サンプル

```swift
WKUserContentController()
    .add(userScript: WKUserScript(source: "console.log('ユーザースクリプトからこんにちは！');", injectionTime: .atDocumentEnd, forMainFrameOnly: true))
    .addScriptMessageHandler(self, name: "myMessageHandler")
    .addContentRuleList(myContentRuleList)
```
