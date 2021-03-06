"Set the maximum line lenght to 120 before vim switches to a new line
"automatically.
autocmd BufEnter *.php setlocal textwidth=120

"Mark the 81th character in a line as color column. So, just the lines with
"more than 80 characters are marked. 
autocmd BufEnter *.php call matchadd('ColorColumn', '\%81v', 100)
autocmd BufLeave *.php call clearmatches()

"Autocommand to regenerate the tags when writing a php buffer
autocmd BufWritePost *.php silent !ctags

"Display tabs, trailing whitespaces and non breaking spaces.
autocmd BufEnter *.php setlocal listchars=tab:»»,trail:·,nbsp:~"

"Add a keyboard shortcut 'tl' to invoke the php linter and print the error
"text of the first error if available.
autocmd BufEnter *.php noremap <buffer> 1tl :compiler phplint <bar> :silent make <bar> redraw! <bar> :cfirst<cr>

"Add a keyboard shortcut to invoke a php codesniffer and print the error
"text of the first error if available.
autocmd BufEnter *.php noremap <buffer> 1ts :compiler phpcodesniffer <bar> :silent make <bar> redraw! <bar> :cfirst<cr>

"Add a keyboard shortcut to invoke phpunit for unit testing.
autocmd BufEnter *.php noremap <buffer> 1tu :!vendor/bin/phpunit --colors=always tests<cr>

"Add a keyboard shortcut to invoke phpunit and generating a coverage report.
autocmd BufEnter *.php noremap <buffer> 1tc :!vendor/bin/phpunit --colors=always --coverage-text tests<cr>
