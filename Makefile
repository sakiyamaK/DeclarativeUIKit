DOCC_TARGET = DeclarativeUIKit
DOCC_DIR = ./docs
GIT_RIPOSITORY_NAME = DeclarativeUIKit

.PHONY: push
push:
	bundle exec pod trunk push

.PHONY: setup
setup:
	bundle install

.PHONY: doc
doc:
	xcodebuild docbuild -scheme $(DOCC_TARGET) \
			-destination generic/platform=iOS \
			OTHER_DOCC_FLAGS="--transform-for-static-hosting --hosting-base-path $(GIT_RIPOSITORY_NAME)" \
			DOCC_OUTPUT_DIR=./
	cp -Rn DeclarativeUIKit.doccarchive docs
