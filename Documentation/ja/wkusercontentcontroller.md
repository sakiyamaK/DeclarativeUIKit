# WKUserContentController

`WKUserContentController`は、`WKWebView`のユーザースクリプトとメッセージハンドラを管理するための宣言的なメソッドを提供します。

## メソッド

### 標準パラメータ

以下の標準パラメータは宣言的に記述できます。

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

#### サンプル

```swift
WKUserContentController()
    .add(userScript: WKUserScript(source: "console.log('ユーザースクリプトからこんにちは！');", injectionTime: .atDocumentEnd, forMainFrameOnly: true))
    .addScriptMessageHandler(self, name: "myMessageHandler")
    .addContentRuleList(myContentRuleList)
```