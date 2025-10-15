# UIPageControl

## function

### some default parameters

The following standard parameters can be written declaratively.

```swift
    func numberOfPages(_ numberOfPages: Int) -> Self

    func currentPage(_ currentPage: Int) -> Self

    func hidesForSinglePage(_ hidesForSinglePage: Bool) -> Self

    @available(iOS 17.0, *)
    func progress(_ progress: UIPageControlProgress?) -> Self

    func pageIndicatorTintColor(_ pageIndicatorTintColor: UIColor?) -> Self

    func currentPageIndicatorTintColor(_ currentPageIndicatorTintColor: UIColor?) -> Self

    func backgroundStyle(_ backgroundStyle: UIPageControl.BackgroundStyle) -> Self

    @available(iOS 16.0, *)
    func direction(_ direction: UIPageControl.Direction) -> Self

    func allowsContinuousInteraction(_ allowsContinuousInteraction: Bool) -> Self

    func preferredIndicatorImage(_ preferredIndicatorImage: UIImage?) -> Self

    func indicator(image: UIImage?, forPage page: Int) -> Self

    func indicatorAllPage(image: UIImage?) -> Self

    @available(iOS 16.0, *)
    func preferredCurrentPageIndicatorImage(_ preferredCurrentPageIndicatorImage: UIImage?) -> Self

    @available(iOS 16.0, *)
    func currentPageIndicator(image: UIImage?, forPage page: Int) -> Self

    @available(iOS 16.0, *)
    func currentPageIndicatorAllPage(image: UIImage?) -> Self
```

#### sample

```swift
self.declarative {
  UIStackView.vertical {
      UIPageControl()
          .numberOfPages(16)
          .currentPage(8)
          .currentPageIndicatorTintColor(.black)
          .pageIndicatorTintColor(.gray)
      UIPageControl()
          .numberOfPages(16)
          .currentPage(8)
          .currentPageIndicatorTintColor(.brown)
          .pageIndicatorTintColor(.black)
          .backgroundStyle(.prominent)
          .direction(.topToBottom)
  }
  .padding(insets: .init(all: 20))
}
```
