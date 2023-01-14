.PHONY: install install-casks install-formulas

update-casks:
	@echo Updating Casks file...
	@brew list --cask > casks
	@echo Done!

install-casks:
	@echo Installing Homebrew Casks...
	@xargs brew install < casks
	@echo Done installing casks!

install: install-casks
