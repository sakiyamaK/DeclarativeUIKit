.PHONY: preview build-doc publish clean help

# デフォルトターゲット
help:
	@echo "Usage:"
	@echo "  make preview    - Start the DocC preview server on http://localhost:8080"
	@echo "  make build-doc  - Build the documentation archive and open it in Xcode"
	@echo "  make publish    - Generate static documentation for GitHub Pages in ./docs"
	@echo "  make clean      - Remove all generated documentation files"

# ブラウザでのプレビュー（swift-docc-pluginを使用）
preview:
	swift package --disable-sandbox preview-documentation --target DeclarativeUIKit --port 8080

# Xcodeドキュメントビューア用のビルドと表示
build-doc:
	xcodebuild docbuild -scheme DeclarativeUIKit -destination 'generic/platform=iOS' -derivedDataPath ./.build/docc_build
	open ./.build/docc_build/Build/Products/Debug-iphoneos/DeclarativeUIKit.doccarchive

# GitHub Pages用の静的サイト生成
publish:
	@echo "Building documentation for iOS..."
	xcodebuild docbuild -scheme DeclarativeUIKit -destination 'generic/platform=iOS' -derivedDataPath ./.build/docc_build
	@echo "Transforming for static hosting..."
	xcrun docc process-archive transform-for-static-hosting ./.build/docc_build/Build/Products/Debug-iphoneos/DeclarativeUIKit.doccarchive \
		--output-path ./docs \
		--hosting-base-path DeclarativeUIKit
	@echo "\033[32mDocumentation generated in ./docs\033[0m"
	@echo "To publish, push the 'docs' folder to the 'main' branch or use the 'gh-pages' branch."

# 生成物の削除
clean:
	rm -rf ./.build/docc_build
	rm -rf ./docs
	@echo "Cleaned up generated documentation."
