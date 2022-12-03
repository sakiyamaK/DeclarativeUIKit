push:
	bundle exec pod trunk push
.PHONY: push

setup:
	bundle install
.PHONY: setup

document:
	bundle exec jazzy --config .jazzy.yml --source-directory Sources/DeclarativeUIKit
.PHONY: document
