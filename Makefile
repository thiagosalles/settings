.PHONY: setup

setup:
	@make -C ./homebrew install
	@make -C ./macos setup