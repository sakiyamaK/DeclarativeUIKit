//
//  WKWebpagePreferences+.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/10/15.
//

import WebKit

public extension WKWebpagePreferences {

    @discardableResult
    func preferredContentMode(_ mode: WKWebpagePreferences.ContentMode) -> Self {
        self.preferredContentMode = mode
        return self
    }

    @discardableResult
    func allowsContentJavaScript(_ enabled: Bool) -> Self {
        self.allowsContentJavaScript = enabled
        return self
    }

    @available(iOS 16.0, *)
    @discardableResult
    func isLockdownModeEnabled(_ enabled: Bool) -> Self {
        self.isLockdownModeEnabled = enabled
        return self
    }

    @available(iOS 18.2, *)
    @discardableResult
    func preferredHTTPSNavigationPolicy(_ policy: WKWebpagePreferences.UpgradeToHTTPSPolicy) -> Self {
        self.preferredHTTPSNavigationPolicy = policy
        return self
    }
}

