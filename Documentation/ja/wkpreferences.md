# WKPreferences

`WKPreferences`は、`WKWebView`の設定を構成するための宣言的なメソッドを提供します。

## メソッド

### 標準パラメータ

以下の標準パラメータは宣言的に記述できます。

```swift
func minimumFontSize(_ size: CGFloat) -> Self
func javaScriptEnabled(_ enabled: Bool) -> Self
func javaScriptCanOpenWindowsAutomatically(_ canOpen: Bool) -> Self
func isFraudulentWebsiteWarningEnabled(_ enabled: Bool) -> Self
func isTextInteractionEnabled(_ enabled: Bool) -> Self
func shouldPrintBackgrounds(_ shouldPrint: Bool) -> Self
func isSiteSpecificQuirksModeEnabled(_ enabled: Bool) -> Self
func isElementFullscreenEnabled(_ enabled: Bool) -> Self
func inactiveSchedulingPolicy(_ policy: WKPreferences.InactiveSchedulingPolicy) -> Self
```

#### サンプル

```swift
WKPreferences()
    .javaScriptEnabled(true)
    .minimumFontSize(12)
    .isFraudulentWebsiteWarningEnabled(true)
```