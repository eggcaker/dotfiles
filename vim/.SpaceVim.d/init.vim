" Here are some basic customizations, please refer to the top of the vimrc
" file for all possible options:
let g:spacevim_default_indent = 2
let g:spacevim_max_column     = 110
let g:spacevim_colorscheme    = 'my_awesome_colorscheme'
let g:spacevim_plugin_manager = 'dein'  " neobundle or dein or vim-plug

" Change the default directory where all miscellaneous persistent files go.
" By default it is ~/.cache/vimfiles.
" let g:spacevim_plugin_bundle_dir = "/some/place/else"

" By default, language specific plugins are not loaded. This can be changed
" with the following:
let g:spacevim_plugin_groups_exclude = ['ruby', 'python']

" If there are groups you want always loaded, you can use this:
let g:spacevim_plugin_groups_include = ['js']

" Alternatively, you can set this variable to load exactly what you want:
let g:spacevim_plugin_groups = ['core', 'web']

" If there is a particular plugin you don't like, you can define this
" variable to disable them entirely:
let g:spacevim_disabled_plugins=['vim-foo', 'vim-bar']
" If you want to add some custom plugins, use these options:
let g:spacevim_custom_plugins = [
 \ ['plasticboy/vim-markdown', {'on_ft' : 'markdown'}],
 \ ['wsdjeg/GitHub.vim'],
 \ ]

" Anything defined here are simply overrides
set wildignore+=\*/node_modules/\*
set guifont=Wingdings:h10
