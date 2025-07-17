# WKPreferences

`WKPreferences` provides declarative methods to configure the preference settings for a `WKWebView`.

## Methods

### Some default parameters

The following standard parameters can be written declaratively.

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

#### Sample

```swift
WKPreferences()
    .javaScriptEnabled(true)
    .minimumFontSize(12)
    .isFraudulentWebsiteWarningEnabled(true)
```