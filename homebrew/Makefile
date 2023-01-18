.PHONY: update-casks update-formulas install install-casks install-formulas

update-casks:
	@printf "Updating Casks file... "
	@brew list --cask > casks
	@echo Done!

update-formulas:
	@printf "Updating Formulas file... "
	@brew leaves > formulas
	@echo Done!

install-casks:
	@echo "\n➡️  Installing Homebrew Casks...\n"
	@for cask in $(shell cat casks); do \
		printf "\033[1m$$cask...\033[0m "; \
		result="$$(brew install --cask "$$cask" 2>/dev/null | tee /dev/tty)"; \
		if [ "$$result" == "" ]; then \
			echo "Already installed!"; \
		fi; \
	done
	@echo "\n✅ Done installing casks!"

install-formulas:
	@echo "\n➡️  Installing Homebrew Formulas...\n"
	@for formula in $(shell cat formulas); do \
		printf "\033[1m$$formula...\033[0m "; \
		result="$$(brew install "$$formula" 2>/dev/null | tee /dev/tty)"; \
		if [ "$$result" != "" ]; then \
			printf "\033[1mCheck if there's any extra step to finish its configuration and press ENTER to continue...\033[0m"; \
			read -s user_input; \
			echo; \
		else \
			echo "Already installed!"; \
		fi; \
	done
	@echo "\n✅ Done installing formulas!"

install: install-casks install-formulas
