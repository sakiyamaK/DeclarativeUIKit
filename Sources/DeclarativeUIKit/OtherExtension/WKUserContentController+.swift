import WebKit

public extension WKUserContentController {

    @discardableResult
    func add(scriptMessageHandler: WKScriptMessageHandler, name: String) -> Self {
        self.add(scriptMessageHandler, name: name)
        return self
    }

    @discardableResult
    func add(userScript: WKUserScript) -> Self {
        self.addUserScript(userScript)
        return self
    }

    @discardableResult
    func clearUserScripts() -> Self {
        self.removeAllUserScripts()
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func add(scriptMessageHandler: any WKScriptMessageHandler, contentWorld world: WKContentWorld, name: String) -> Self {
        self.add(scriptMessageHandler, contentWorld: world, name: name)
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func add(scriptMessageHandlerWithReply: any WKScriptMessageHandlerWithReply, contentWorld: WKContentWorld, name: String) -> Self {
        self.addScriptMessageHandler(scriptMessageHandlerWithReply, contentWorld: contentWorld, name: name)
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func remove(scriptMessageHandlerForName name: String, contentWorld: WKContentWorld) -> Self {
        self.removeScriptMessageHandler(forName: name, contentWorld: contentWorld)
        return self
    }

    @discardableResult
    func remove(scriptMessageHandlerForName name: String) -> Self {
        self.removeScriptMessageHandler(forName: name)
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func remove(scriptMessageHandlersFrom contentWorld: WKContentWorld) -> Self {
        self.removeAllScriptMessageHandlers(from: contentWorld)
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func clearAllScriptMessageHandlers() -> Self {
        self.removeAllScriptMessageHandlers()
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func add(contentRuleList: WKContentRuleList) -> Self {
        self.add(contentRuleList)
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func remove(contentRuleList: WKContentRuleList) -> Self {
        self.remove(contentRuleList)
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func clearAllContentRuleLists() -> Self {
        self.removeAllContentRuleLists()
        return self
    }
}
