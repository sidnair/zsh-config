Installation
------------

To install, run

    git clone git://github.com/sidnair/zsh-config.git ~/.oh-my-zsh
    cd ~/.oh-my-zsh
    make install

If zsh isn't your default shell, you might also want to run

    chsh -s `which zsh`

Usage
-------------
Put environment specific settings in custom/

Key Bindings
-------------

`Ctrl + b` Go back in the directory location history
`Ctrl + f` Go forward in the directory location history
`Ctrl + u` Go up in the directory structure
`Alt + v` vim

Features
--------

* `vim file:123` will open file at line 123.
* The command history is shared across sessions (very useful with `Ctrl + r`).
  To disable type `noh` (useful when all you are doing is Up arrow + Enter).
* No need to type `bundler exec` for most commands (annotate cap capify
  cucumber ey foreman guard heroku middleman nanoc rackup rainbows rails rake
  rspec ruby shotgun spec spork thin thor unicorn unicorn\_rails).
