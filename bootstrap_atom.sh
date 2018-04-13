#!/bin/zsh

packages=("verse-of-the-day" "godsdjs"
	"hey-pane" "hydrogen" "atom-ternjs" "svg-preview" "atom-video" "preview"
	"pigments" "file-icons" "editorconfig" "clipboard-ide" "clipboard-plus" "undo-tree" "git-time-metric" "npm-plus" "atom-vim-like-tab" "atom-commander" "block-cursor" "atom-cursor-indent" "multi-cursor-plus" "cursor-history" "split-selection-into-cursors" "indent-guide-improved" "line-count-status" "highlight-line"
	"tree-view-sort" "chary-tree-view" "tree-view-panes" "tree-view-git-branch" "tree-view-git-status" "tree-view-scope-lines" "tree-view-autoresize" "tree-view-copy-relative-path" "nerd-treeview" "tree-view-filter"
	"vim-mode-plus" "vim-mode-zz" "ex-mode" "vim-mode-clipboard-plus" "vim-mode-plus-move-selected-text" "vim-shift-movers"
	"hyperclick" "css-hyperclick" "js-hyperclick" "hyperlink-hyperclick"
	"minimap" "minimap-git-diff" "minimap-bookmarks" "minimap-cursorline" "minimap-linter" "minimap-find-and-replace" "minimap-selection" "minimap-codeglance"
	"git-plus" "git-hide" "git-tabs" "git-status" "git-time-machine" "inline-git-diff" "git-split-diff-hyperclick" "git-blame" "git-reset-selection"
	"linter" "linter-spell" "linter-sass-lint" "linter-twig" "linter-tidy" "linter" "linter-eslint" "linter-less" "linter-tslint" "linter-spell-project" "linter-spell-shellscript" "linter-spell-javascript" "linter-spell-html" "linter-markdown"
    "language-javascript-jsx" "language-pug" "atom-typescript" "language-babel" "language-html-babel" "language-ignore" "language-markdown"
	"autocomplete-json" "gherkin-autocomplete" "autocomplete-modules" "tsx-tags-autocomplete" "autocomplete-en-en"
	"atom-ide-ui" "ide-json" "ide-yaml" "ide-html" "flow-ide" "ide-bash" "ide-docker" "ide-flowtype" "ide-typescript"
	"markdown-image-paste" "markdown-scroll-sync" "markdown-writer" "markdown-preview-plus")

for package in $packages; do
	apm install $package
done

exit 0
