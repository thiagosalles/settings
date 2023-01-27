Settings
========

- Homebrew casks and formulas instalation
- Dotfiles configuration
- Macbook Settings

Running
=======

First, install [Homebrew](https://brew.sh/):
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then run the following command from the root folder:
```
make setup
```

iTerm2 Configuration
====================

Open the `.itermcolors` file from apps folder. The color settings will be imported into iTerm2.

Now, apply the imported settings in iTerm through iTerm → preferences → profiles → colors → load presets. 

Oh My Zsh + Powerlevel10k
=========================

Install oh-my-zsh:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Install zsh-autosuggestions plugin:
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Install zsh-syntax-highlighting plugin:
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Install Powerlevel10k:
```
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

Run Powerlevel10k configuration wizard **just to install the missing fonts**:
```
p10k configure
```

Dotfiles
========

Just run:
```
dotfiles/makesymlinks.sh
```

Credits
========

* http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
* https://github.com/michaeljsmalley/dotfiles
* https://github.com/nanernunes/settings
* https://macos-defaults.com/
* https://github.com/freekmurze/dotfiles/blob/main/macos/set-defaults.sh
* https://github.com/joeyhoer/starter/tree/master/system
* https://gist.github.com/kevin-smets/8568070
