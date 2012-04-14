WHAT?
====================

Heavily inspired by Vimux-ruby-test. Most of the codebase is directly taken from that plugin itself.

- Run the feature your cursor is currently on
- Run the entire feature you are working in
- Streaming output to tmux via vimux

HOW?
====================

Use any of the commands below. Map them to shortcuts
in your .vimrc for easy access.

  - RunFocusedCuke - run focused cuke
  - RunAllCukes - run all cukes in the current file

IMPORTANT: if you use this plugin and Vimux-Ruby-Test, you may want to share the same shortcut.
If you do, you can use the following configuration:

    autocmd FileType ruby map <buffer> <Leader>f :RunRubyFocusedTest<CR>
    autocmd FileType ruby map <buffer> <Leader>t :RunAllRubyTests<CR>
    autocmd FileType cucumber map <Leader>f :RunFocusedCuke<CR>
    autocmd FileType cucumber map <Leader>t :RunAllCukes<CR>

This assumes that your Vim configuration recognizes Cucumber features with the `cucumber` file type.

INSTALL
====================

Put the contents of this directory into your pathogen bundle. That's it!

REQUIREMENTS
====================

- vim with ruby support (compiled +ruby)
- [vimux](https://github.com/benmills/vimux)

CONTRIBUTORS:
====================

- [Claudio Ortolina](http://github.com/cloud8421)

Original code by:

- [Drew Olson](https://github.com/drewolson)
- [Paul Gross](https://github.com/pgr0ss)
