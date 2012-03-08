# Issues


* must run some stuff as sudo, which leads to some suckage


* note the existence of FileEdit class (in chef/chef/lib/chef/util)  -- has `search_file_replace_line` and stuff -- http://tickets.opscode.com/browse/CHEF-78


## Hi Travis


* make brew install emacs 24
* make dotfiles refer to the brew coreutils

* set up terminal for solarized
* set up emacs (see below)

* (test the getting started in the readme)

__________________________________________________________________________

# Tasks

## Configuration

### OSX defaults

* set global keys 
* impose modest system prefs

* solarized into OSX colorpalette

### Terminal

* cmd-key-happy
* command is meta
* solarized colors


* terminal keystrokes
  - flip wants:
  - ctrl-left, ctrl-right     to M-b M-f 
  - home, end                 to C-a, C-e
  - page-up, page-down        to 'scroll to {next,previous} page in buffer'

  - flip has:
  - option-left, option-right to C-a, C-e

### Emacs

* installs emacs24 via homebrew
* the 'right' emacs package manager, if any
* solarized color theme
* make the menubar sane

* I like this organization:

  - `prefs.el`    -- customizations    
  - `bindings.el` -- key bindings
  - `defuns.el`   -- functions
  - `modes.el`    -- configures major-/minor-modes; expands the list of extensions for each mode (eg `Rakefile` => ruby-mode)

* figure out what the cool kids are doing for rails in emacs and do that
* please no paredit (unless you decide it's totally awesome)

* modes; if any of those are built-in or you find there are better ones, feel free to replace
  - ido-mode 
  - recentf-mode
  - hippie-expand
  - flymake
  - magit
  - there are many javascript modes. figure out the best and put that in and make sure the others don't come in even if I load a .json file. 
  - Make sure the javascript mode is *not* paredit-infected
  - others: coffee-mode, cucumber-mode, haml-mode, markdown-mode, textile-mode, sass-mode, scss-mode, yaml-mode, textile-mode, pig-mode

* make it so backups are stored somewhere that 1) is in my home dir tree (ie not the /tmp dir) 2) is not in my way 3) is not twiddle turd~ files in the current directory

* tweaks:
  - everything is indent two spaces, no tabs, everywhere
  - everything is as UTF-8 as it's possible to make it
  - choose a fill-column default -- can be 80, can be larger

* here are the keybinding choices I think might be controversial -- my request list is at https://gist.github.com/1997579
  - C-z and M-z are **undo** everywhere
  - M-C, M-V are copy/paste; M-backtick is `'other-frame`; M-h hides emacs
  - M-Q is **NOT** quit, it is fill-paragraph
  - C-M-3 is comment-region, C-M-# is uncomment-region
  - C-x f is find-file (not set-fill-column)


* if desired, here is snippet to use with osx_application definition:

      "Emacs": {
        "url": "http://emacsformacosx.com/emacs-builds/Emacs-pretest-24.0.93-universal-10.6.8.dmg",
        "checksum": "d51e85bc5c7bfa7d2cf28c249c17fa4733d53"


#### Things I don't know how to do in emacs but I know they're awesome and possible

* is there a way to make it compile the .el files into .elc (even if it involves a Guardfile)? Cause that makes startup HELLA faster
* emacs-server
* mumamo (multiple editing modes eg for a .pig.erb it knows when you're ruby and when you're pig


### Dotfiles

* zsh
  - assembly of atomic files

### Textmate

* [solarized color scheme](https://github.com/altercation/solarized/tree/master/textmate-colors-solarized)

## Brew and DMG Packages  
  
### Essentials  

* homebrew
* git 
* java
* lion build essentials
* rbenv
* vim
* zsh (see above)
* emacs (see above)

### Install Apps

* textmate
  - bundles, plugins and prefs
* chrome
  - adblock
* firefox
* dropbox
* Github for Mac
* GitX (from that one guy's branch)
* skype

### Install Backend Services

* nginx
* mongod
* node
* mysql
* virtualbox
