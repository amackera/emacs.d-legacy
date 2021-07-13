# .emacs.d

This is my Emacs config. It's mostly based around using Emacs for Clojure programming, and keeping myself organized via `org-mode`.

## Installation

### macOS Catalina

1. `brew cask install emacs`
2. `git clone git@github.com:amackera/emacs.d.git .emacs.d`
3. `brew install cask`
4. `cd .emacs.d`
5. `cask install`
6. `brew install ispell`
7. Open Emacs

### ArchLinux

Requires: `yay`, `git`, `pacman`

1. `pacman -S emacs`
2. `git clone git@github.com:amackera/emacs.d.git .emacs.d`
3. `yay cask`
4. `cd .emacs.d`
5. `cask install`
6. `touch ~/.private.el`
7. Open Emacs

### Other Systems

Coming soon...
