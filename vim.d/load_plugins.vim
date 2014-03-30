if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle/'))

"github repositories
NeoBundleFetch 'Shougo/neobundle.vim'

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
    let g:make = 'make'
endif
NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}

function! s:meet_neocomplete_requirements()
    return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

if s:meet_neocomplete_requirements()
    NeoBundleLazy 'Shougo/neocomplete.vim'
    NeoBundleFetch 'Shougo/neocomplcache.vim'
else
    NeoBundleFetch 'Shougo/neocomplete.vim'
    NeoBundleLazy 'Shougo/neocomplcache.vim'
endif

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'

NeoBundleLazy 'Shougo/vimfiler.vim'
NeoBundleLazy 'Shougo/vimshell.vim'

NeoBundleLazy 'Shougo/unite.vim'
NeoBundleLazy 'Shougo/neomru.vim', { 'depends' : 'Shougo/unite.vim' }
NeoBundleLazy 'thinca/vim-unite-history', { 'depends' : 'Shougo/unite.vim' }
NeoBundleLazy 'Shougo/unite-outline', { 'depends' : 'Shougo/unite.vim' }
NeoBundleLazy 'tsukkee/unite-help', { 'depends' : 'Shougo/unite.vim' }

NeoBundle 'itchyny/lightline.vim'

NeoBundle 'tyru/skk.vim'
"NeoBundle 'tyru/eskk.vim'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'vim-scripts/eregex.vim'

NeoBundle 'tmhedberg/matchit'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'

NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'osyo-manga/vim-over'

NeoBundle 'kana/vim-submode'
NeoBundle 'kana/vim-arpeggio'

NeoBundle 'kana/vim-operator-user'
NeoBundle 'emonkak/vim-operator-comment', { 'depends' : 'kana/vim-operator-user' }

NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent', { 'depends' : 'kana/vim-textobj-user' }
NeoBundle 'kana/vim-textobj-function', { 'depends' : 'kana/vim-textobj-user' }
NeoBundle 'kana/vim-textobj-entire', { 'depends' : 'kana/vim-textobj-user' }
NeoBundle 'kana/vim-textobj-line', { 'depends' : 'kana/vim-textobj-user' }
NeoBundle 'mattn/vim-textobj-url', { 'depends' : 'kana/vim-textobj-user' }
NeoBundle 'osyo-manga/vim-textobj-multiblock', { 'depends' : 'kana/vim-textobj-user' }
NeoBundle 'osyo-manga/vim-textobj-multitextobj', { 'depends' : 'kana/vim-textobj-user' }

NeoBundleLazy 'tyru/capture.vim'

NeoBundleLazy 'basyura/unite-rails'

NeoBundleLazy 'eagletmt/ghcmod-vim'
NeoBundleLazy 'ujihisa/neco-ghc'
NeoBundleLazy 'dag/vim2hs'
NeoBundleLazy 'pbrisbin/html-template-syntax'

NeoBundleLazy 'mattn/learn-vimscript'

NeoBundle 'mattn/webapi-vim'
NeoBundleLazy 'moznion/hateblo.vim',{ 'depends' : ['mattn/webapi-vim', 'Shougo/unite.vim'] }

NeoBundleLazy 'koron/codic-vim'
NeoBundleLazy 'rhysd/unite-codic.vim', { 'depends' : ['Shougo/unite.vim', 'koron/codic-vim'] }


"Plugin settings

if s:meet_neocomplete_requirements()
    "neocomplete
    if neobundle#tap('neocomplete.vim')
        call neobundle#config({
                    \ 'autoload' : {
                    \   'insert' : 1,
                    \ }
                    \})

        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#auto_completion_start_length = 1
        let g:neocomplete#enable_smart_case = 1

        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        if !exists('g:neocomplete#sources#omni#input_patterns')
          let g:neocomplete#sources#omni#input_patterns = {}
        endif

        inoremap <expr><C-g> neocomplete#undo_completion()
        inoremap <expr><C-l> neocomplete#complete_common_string()

        call neobundle#untap()
    endif
else
    "neocomplcache
    if neobundle#tap('neocomplcache.vim')
        call neobundle#config({
                \ 'autoload' : {
                \   'insert' : 1,
                \ }
                \})

        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_auto_completion_start_length = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_underbar_completion = 1
        
        if !exists('g:neocomplcache_omni_patterns')
          let g:neocomplcache_omni_patterns = {}
        endif

        call neobundle#untap()
    endif
endif

"Enable omni function
augroup omnifuncs
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

if neobundle#tap('neosnippet')
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    
    " Tell Neosnippet about the other snippets
    let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
    
    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    
     " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif

    call neobundle#untap()
endif

if neobundle#tap('vimfiler.vim')
    call neobundle#config({
            \ 'autoload' : {
            \   'commands' : [
            \     'VimFilerTab',
            \     'VimFiler',
            \     'VimFilerExplorer'
            \   ]
            \ }
            \})
    function! neobundle#tapped.hooks.on_source(bundle)
        let g:vimfiler_force_overwrite_statusline = 0
    endfunction
    call neobundle#untap()
endif

if neobundle#tap('vimshell.vim')
    call neobundle#config({
            \ 'autoload' : {
            \   'commands' : [
            \     'VimShell',
            \     'VimShellPop',
            \     'VimShellInteractive'
            \   ]
            \ }
            \})
    function! neobundle#tapped.hooks.on_source(bundle)
        let g:vimshell_force_overwrite_statusline = 0
    endfunction
    call neobundle#untap()
endif

if neobundle#tap('unite.vim')
    call neobundle#config({
            \ 'autoload' : {
            \   'commands' : [
            \     'Unite',
            \     'UniteWithBufferDir',
            \     'UniteWithCurrentDir'
            \   ]
            \ }
            \})
    function! neobundle#tapped.hooks.on_source(bundle)
        let g:unite_force_overwrite_statusline = 0
        let g:unite_enable_start_insert = 0
        let g:unite_source_history_yank_enable = 1
        let g:unite_source_history_yank_limit = 1000
        let g:unite_prompt = '❯ '

        if !exists('g:unite_source_menu_menus')
            let g:unite_source_menu_menus = {}
        endif
        let g:unite_source_menu_menus.shortcut = {
                    \ 'description' : 'shortcut'
        \}
        let g:unite_source_menu_menus.shortcut.candidates = [
                    \ ['vimrc', $MYVIMRC],
                    \ ['map', 'Unite output:map'],
                    \ ['neobundle', 'Unite neobundle'],
                    \ ['neobundle install', 'NeoBundleInstall'],
                    \ ['neobundle update', 'NeoBundleUpdate']
        \]
        function! g:unite_source_menu_menus.shortcut.map(key, value)
            let [word, value] = a:value
        
            if isdirectory(value)
                return {
        \               'word' : '[directory] '.word,
        \               'kind' : 'directory',
        \               'action__directory' : value
        \           }
            elseif !empty(glob(value))
                return {
        \               'word' : '[file] '.word,
        \               'kind' : 'file',
        \               'default_action' : 'tabdrop',
        \               'action__path' : value,
        \           }
            else
                return {
        \               'word' : '[command] '.word,
        \               'kind' : 'command',
        \               'action__command' : value
        \           }
            endif
        endfunction
        let g:unite_source_menu_menus.kaomoji = {
                    \ 'description' : 'kaomoji dictionary',
        \}
        let g:unite_source_menu_menus.kaomoji.candidates= [
                    \["", "( 'ω').｡oO(…)"],
                    \["kyun", "\_(⌒(_*'ω'*)_"],
                    \["kyun", "ヾ(⌒(\_*'ω'*)\_"],
                    \["kyun", "（*/ω＼*）"],
                    \["kyun", "(っ´ω`c)♡"],
                    \["namida", "\.˚‧º·(´ฅωฅ｀)‧º·˚."],
                    \["namida", "(☍﹏⁰)"],
                    \["namida", "( ˃﹏˂ഃ )"],
                    \["hawawa", "｡ﾟ(ﾟ∩´﹏`∩ﾟ)ﾟ｡"],
                    \["hawawa", "\:;( っ'﹏'c);:"],
                    \["hawawa", "\:;( っ'ω'c);:"],
                    \["hawawa", "\:;(∩´﹏`∩);:"],
                    \["hawawa", "(っ´﹏`c)"],
                    \["firstspring", "(╯•﹏•╰)"],
                    \["fuee", "✧*。ヾ(｡>﹏<｡)ﾉﾞ。*✧"],
                    \["ja-n", "٩(*'ω'*)و"],
                    \["panpaka", "＼＼\\٩( 'ω' )و /／／"],
                    \["crow", "( っ'ω'c)"],
                    \["wahhab", "( っ'ヮ'c)"],
                    \["poyo", "(´,,•ω•,,｀)"],
                    \["mogumogu", "(∩´〰`∩)"],
                    \["pero", "(๑´ڡ`๑)"],
                    \["juru", "(๑╹﹃╹)"],
                    \["makimono", "(๑╹◡╹)o[]o"],
                    \["pei", "(っ`ω´c)"],
                    \["chu", "(っ＞ω＜c)"],
                    \["chu", "°+♡:.(っ>ω<c).:♡+°"],
                    \["kichigai", "└(՞ةڼ◔)」"],
                    \["teokure", "ヾ(〄⌒ー⌒〄)ノ"],
                    \["teokure", "ヽ('ω')ﾉ=͟͟͞͞=͟͟͞͞ヽ('ω')ﾉ"],
                    \["wa-i", "ヾ(✿╹◡╹)ﾉ\""],
                    \["wa-i", "ヾ(๑╹◡╹)ﾉ\""],
                    \["wa-i", "ヾ(＠⌒ー⌒＠)ノ"],
                    \["peta", "\_(⌒(_-ω-)_"],
                    \["osenbe", "〄"],
        \]
        function! g:unite_source_menu_menus.kaomoji.map(key, value)
            let [word, value] = a:value
            if !empty(word)
                return {
                        \ 'word' : '[' .word .'] ' .value,
                        \ 'kind' : 'word',
                        \ 'action__text' : value,
                \}
            else
                return {
                        \ 'word' : '[no pronounce] ' .value,
                        \ 'kind' : 'word',
                        \ 'action__text' : value,
                \}
            endif
        endfunction
    endfunction

    nnoremap [unite] <Nop>
    nmap ,u [unite]
    "buffer
    nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
    "tab
    nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
    "file
    nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
    nnoremap <silent> [unite]fr :<C-u>Unite file_rec<CR>
    "register
    nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
    "recently files
    nnoremap <silent> [unite]m :<C-u>Unite file_mru:short<CR>
    nnoremap <silent> [unite]ml :<C-u>Unite file_mru:long<CR>
    "menu
    nnoremap <silent> [unite]ms :<C-u>Unite menu:shortcut<CR>
    nnoremap <silent> [unite]mk :<C-u>Unite menu:kaomoji -start-insert<CR>
    "history
    nnoremap <silent> [unite]hy :<C-u>Unite history/yank<CR>
    "thinca/vim-unite-history
    nnoremap <silent> [unite]hc :<C-u>Unite history/command<CR>
    nnoremap <silent> [unite]hs :<C-u>Unite history/search<CR>
    "Shougo/unite-outline
    nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
    "tsukkee/unite-help
    nnoremap <silent> [unite]he :<C-u>Unite -start-insert help<CR>

    call neobundle#untap()
endif

if neobundle#tap('neomru.vim')
    call neobundle#config({
            \ 'autoload' : {
            \   'unite_sources' : ['file_mru']
            \ }
            \})
    call neobundle#untap()
endif

if neobundle#tap('vim-unite-history')
    call neobundle#config({
            \ 'autoload' : {
            \   'unite_sources' : ['history/command', 'history/search']
            \ }
            \})
    call neobundle#untap()
endif

if neobundle#tap('unite-outline')
    call neobundle#config({
            \ 'autoload' : {
            \   'unite_sources' : ['outline']
            \ }
            \})
    call neobundle#untap()
endif

if neobundle#tap('unite-help')
    call neobundle#config({
            \ 'autoload' : {
            \   'unite_sources' : ['help']
            \ }
            \})
    call neobundle#untap()
endif

if neobundle#tap('vim-quickrun')
    let g:quickrun_config = {
            \ '_' : {
            \   'runner' : 'vimproc',
            \   'runner/vimproc/updatetime' : 60
            \ },
            \}
    nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
    call neobundle#untap()
endif

if neobundle#tap('skk.vim')
    let skk_jisyo = '~/.skk-jisyo'
    
    if OSTYPE == 'Darwin\n'
        let skk_large_jisyo = '/Library/Dictionaries/SKK/SKK-JISYO.LL'
    elseif OSTYPE == 'Linux\n'
        let skk_large_jisyo = '/usr/share/skk/SKK-JISYO.LL'
    endif
    
    let skk_auto_save_jisyo = 1
    let skk_keep_state = 1
    let skk_egg_like_newline = 1
    let skk_show_annotation = 1
    let skk_use_face = 1
    let skk_marker_white = '>'
    let skk_marker_black = '>>'
    let skk_use_color_cursor = 1
    let skk_cursor_hira_color = '#ff0000'
    let skk_cursor_kata_color = '#00ff00'
    let skk_cursor_zenei_color = '#ffcc00'
    let skk_cursor_ascii_color = '#ffffff'
    let skk_cursor_addrev_color = '#0000ff'
    let skk_sticky_key = ';'
    let skk_imdisable_state = 1
    let skk_ascii_mode_string =  'aA'
    let skk_hira_mode_string  =  'あ'
    let skk_kata_mode_string  =  'ア'
    let skk_zenei_mode_string =  'Ａ'
    let skk_abbrev_mode_string = 'aあ'

    call neobundle#untap()
endif

if neobundle#tap('eskk.vim')
    let g:eskk#dictionary = '~/.skk-jisyo'
    let g:eskk#large_dictionary = '/usr/share/skk/SKK-JISYO.LL'
    let g:eskk#show_annotation = 1
endif

if neobundle#tap('syntastic')
    let g:syntastic_mode_map = { 'mode': 'passive' }
    augroup AutoSyntastic
      autocmd!
      autocmd BufWritePost *.c,*.cpp,*.hs,*.rb,*.py call s:syntastic()
    augroup END
    function! s:syntastic()
      SyntasticCheck
      call lightline#update()
    endfunction

    call neobundle#untap()
endif


if neobundle#tap('vim-anzu')
    nmap n <Plug>(anzu-n)
    nmap N <Plug>(anzu-N)
    nmap * <Plug>(anzu-star)
    nmap # <Plug>(anzu-sharp)
    augroup vim-anzu
        autocmd!
        autocmd CursorHold,CursorHoldI,WinLeave,Tableave * call anzu#clear_search_status()
    augroup END

    call neobundle#untap()
endif


"operator
if neobundle#tap('vim-arpeggio')
    call arpeggio#load()
    call neobundle#untap()
endif

if neobundle#tap('vim-operator-comment')
    Arpeggio map oc <Plug>(operator-comment)
    Arpeggio map od <Plug>(operator-uncomment)

    call neobundle#untap()
endif


"textobj
if neobundle#tap('vim-textobj-multiblock')
    omap ab <Plug>(textobj-multiblock-a)
    omap ib <Plug>(textobj-multiblock-i)
    vmap ab <Plug>(textobj-multiblock-a)
    vmap ib <Plug>(textobj-multiblock-i)

    call neobundle#untap()
endif

if neobundle#tap('vim-textobj-multitextobj')
    let g:textobj_multitextobj_textobjects_i = [
        \   '\<Plug>(textobj-url-i)',
        \   '\<Plug>(textobj-multiblock-i)',
        \   '\<Plug>(textobj-function-i)',
        \   '\<Plug>(textobj-entire-i)',
    \]
    let g:textobj_multitextobj_textobjects_a = [
        \   '\<Plug>(textobj-url-a)',
        \   '\<Plug>(textobj-multiblock-a)',
        \   '\<Plug>(textobj-function-a)',
        \   '\<Plug>(textobj-entire-a)',
    \]
    omap amt <Plug>(textobj-multitextobj-a)
    omap imt <Plug>(textobj-multitextobj-i)
    vmap amt <Plug>(textobj-multitextobj-a)
    vmap imt <Plug>(textobj-multitextobj-i)

    call neobundle#untap()
endif

if neobundle#tap('capture.vim')
    call neobundle#config({
            \ 'autoload' : {
            \   'commands' : [
            \     'Capture'
            \   ]
            \ }
            \})
    call neobundle#untap()
endif

if neobundle#tap('unite-rails')
    call neobundle#config({
            \ 'autoload' : {
            \   'filetypes' : ['ruby']
            \ }
            \})
    call neobundle#untap()
endif

if neobundle#tap('ghcmod-vim')
    call neobundle#config({
            \ 'autoload' : {
            \   'filetypes' : ['haskell']
            \ }
            \})
    call neobundle#untap()
endif

if neobundle#tap('neco-ghc')
    call neobundle#config({
            \ 'autoload' : {
            \   'filetypes' : ['haskell']
            \ }
            \})
    call neobundle#untap()
endif

if neobundle#tap('vim2hs')
    call neobundle#config({
            \ 'autoload' : {
            \   'filetypes' : ['haskell']
            \ }
            \})
    call neobundle#untap()
endif

if neobundle#tap('html-template-syntax')
    call neobundle#config({
            \ 'autoload' : {
            \   'filetypes' : ['haskell']
            \ }
            \})
    call neobundle#untap()
endif

if neobundle#tap('learn-vimscript')
    call neobundle#config({
            \ 'autoload' : {
            \   'commands' : [
            \     'help'
            \   ],
            \   'unite_sources' : ['help']
            \ }
            \})
    call neobundle#untap()
endif

if neobundle#tap('hateblo.vim')
    call neobundle#config({
            \ 'autoload' : {
            \   'commands' : [
            \     'HatebloCreate',
            \     'HatebloCreateDraft',
            \     'HatebloList',
            \     'HatebloUpdate',
            \     'HatebloDelete'
            \   ]
            \ }
            \})
    call neobundle#untap()
endif

if neobundle#tap('codic-vim')
    call neobundle#config({
            \ 'autoload' : {
            \   'commands' : [
            \     'Codic'
            \   ],
            \   'unite_sources' : ['codic']
            \ }
            \})
    call neobundle#untap()
endif

if neobundle#tap('unite-codic.vim')
    call neobundle#config({
            \ 'autoload' : {
            \   'unite_sources' : ['codic']
            \ }
            \})
    call neobundle#untap()
endif
