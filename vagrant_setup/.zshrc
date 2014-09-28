export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
alias sudo='sudo env PATH=/home/vagrant/.rbenv/bin:/home/vagrant/.rbenv/shims:/home/vagrant/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games'

## emacs キーバインド
bindkey -e


## コマンド補完
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=2 # ハイライト

# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# 名前で色を付けるようにする
autoload colors
colors

# LS_COLORSを設定しておく
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# 補完に関するオプション
# http://voidy21.hatenablog.jp/entry/20090902/1251918174
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt list_types            # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完
setopt auto_param_keys       # カッコの対応などを自動的に補完
setopt interactive_comments  # コマンドラインでも # 以降をコメントと見なす
setopt magic_equal_subst     # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる

setopt complete_in_word      # 語の途中でもカーソル位置で補完
setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示

setopt print_eight_bit  #日本語ファイル名等8ビットを通す
setopt extended_glob  # 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt globdots # 明確なドットの指定なしで.から始まるファイルをマッチ

bindkey "^I" menu-complete   # 展開する前に補完候補を出させる(Ctrl-iで補完するようにする)

# apt-getとかdpkgコマンドをキャッシュを使って速くする
zstyle ':completion:*' use-cache true

# オブジェクトファイルとか中間ファイルとかはfileとして補完させない
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

## プロンプト
# case ${UID} in
# 0)
#     PROMPT="%B%{[37m%}%/#%{[m%}%b "
#     PROMPT2="%B%{[37m%}%_#%{[m%}%b "
#     SPROMPT="%B%{[37m%}%r is correct? [n,y,a,e]:%{[m%}%b "
#     [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#         PROMPT="%{[33m%}${HOST%%.*} ${PROMPT}"
#     ;;
# *)
# #    PROMPT="%{[34m%}%/%%%{[m%} "
#     RPROMPT="%{[37m%}%/%% "
#     PROMPT="%{[37m%}%m:%n%% "
#     PROMPT2="%{[37m%}%_%%%{[m%} "
#     SPROMPT="%{[37m%}%r is correct? [n,y,a,e]:%{[m%} "
#     [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#         PROMPT="%{[33m%}${HOST%%.*} ${PROMPT}"
#     ;;
# esac

# ## ターミナルのタイトルに「ユーザ@ホスト:カレントディレクトリ」を表示させる設定 
# case "${TERM}" in
# kterm*|xterm)
#     precmd() {
#         echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
#     }
#     ;;
# esac

## 履歴検索機能のショートカット設定
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# 古いコマンドと同じものは無視
setopt hist_save_no_dups

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開
setopt hist_expand

# 履歴をインクリメンタルに追加
setopt inc_append_history

# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

## コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAEHIVST=100000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

## ディレクトリ名だけで cd
setopt auto_cd

## 移動したディレクトリを記憶
setopt auto_pushd

## 入力したコマンドが間違ってる場合に修正
setopt correct

# 'cd -' [Tab] で以前移動したディレクトリに移動する
setopt pushd_ignore_dups

# '^' を押すと上のディレクトリに移動する
function cdup() {
echo
cd ..
zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup


## 補完候補を詰めて表示
setopt list_packed

## ビープ音を消す
setopt nolistbeep

## 先方予測
autoload predict-on
predict-on

## no remove postfix slash of command line
setopt noautoremoveslash

## 拡張子にコマンドを対応付け
alias -s txt=emacs
alias -s wmv=svlc
alias -s avi=svlc
#alias -s mp3=amarok
alias -s jpg=eog
alias -s pdf=evince
alias -s xls=libreoffice
alias -s doc=libreoffice

# autoload -Uz vcs_info
# zstyle ':vcs_info:*' formats '(%s)-[%b]'
# zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
# precmd () {
#     psvar=()
#     LANG=en_US.UTF-8 vcs_info
#     [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
# }
# RPROMPT="%1(v|%F{green}%1v%f|)"

## create emacs env file
perl -wle \
    'do { print qq/(setenv "$_" "$ENV{$_}")/ if exists $ENV{$_} } for @ARGV' \
    PATH > ~/.emacs.d/shellenv.el
eval "$(rbenv init)"

if [ "$EMACS" ];then
  export TERM=Eterm-color
fi

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

# export CLASSPATH=/Applications/adt-bundle-mac-x86_64-20131030/sdk/platforms/android-19/android.jar:$CLASSPATH
# export CLASSPATH=/System/Library/Frameworks/JavaVM.framework/Classes/classes.jar:$CLASSPATH


## 作業ディレクトリへのショートカット
# alias work='cd ~/work'
# alias ietty='cd ~/ietty'


autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

# cd 後に ls -F
function chpwd() { ls -F }

#plugins
export ZSH=$HOME/zsh_plugins/oh-my-zsh
#ZSH_THEME="dpoggi"
ZSH_THEME="ys"
#ZSH_THEME="jnrowe"
# ZSH_THEME="miloshadzic"
source $ZSH/oh-my-zsh.sh

source ~/zsh_plugins/zaw/zaw.zsh
zstyle ':filter-select' case-insensitive yes # 絞り込みをcase-insensitiveに
bindkey '^[d' zaw-cdr
bindkey '^[g' zaw-git-branches
bindkey '^[@' zaw-gitdir

function zaw-src-gitdir () {
  _dir=$(git rev-parse --show-cdup 2>/dev/null)
  if [ $? -eq 0 ]
  then
    candidates=( $(git ls-files ${_dir} | perl -MFile::Basename -nle \
                                               '$a{dirname $_}++; END{delete $a{"."}; print for sort keys %a}') )
  fi
  actions=("zaw-src-gitdir-cd")
  act_descriptions=("change directory in git repos")
}

function zaw-src-gitdir-cd () {
  BUFFER="cd $1"
  zle accept-line
}
zaw-register-src -n gitdir zaw-src-gitdir

# ctrl-h で履歴検索
bindkey '^h' zaw-history

# 履歴ジャンプ
# git clone https://github.com/rupa/z.git
_Z_CMD=j
source ~/zsh_plugins/z/z.sh
precmd() {
  _z --add "$(pwd -P)"
}

# git clone https://github.com/hchbaw/auto-fu.zsh.git
source ~/zsh_plugins/auto-fu.zsh/auto-fu.zsh

# http://qiita.com/maru_cc/items/4dfaa99be7bf95cf68bb
# if [ -e /usr/local/share/zsh-completions ]; then
#     fpath=(/usr/local/share/zsh-completions $fpath)
# fi

# for vagrant
#export VAGRANT_BRIDGE=Wi-Fi
