abbr -a c cargo
abbr -a vim nvim
abbr -a e nvim
abbr -a m make
abbr -a g git
abbr -a gc 'git checkout'
abbr -a vimdiff 'nvim -d'
abbr -a ct 'cargo t'

# special stuff
abbr -a Ef 'nvim ~/.config/fish/config.fish'
abbr -a Ev 'nvim ~/.config/nvim/init.vim'
abbr -a pull "git pull"
abbr -a push "git push"
abbr -a gs "git status"
abbr -a gits "git status"
#abbr -a gl "git log --graph --decorate --oneline"
abbr -a gl "git lg1"
abbr -a gc 'git clone'
abbr -a cc "checkout -- ."
abbr -a gs 'git status -s'
abbr -a ca 'git commit -a -m'
abbr -a cnet "git clone git@github.com:jethrosun/NetBricks.git -b dev ~/dev/netbricks; and cd ~/dev/netbricks; and ./build.sh"
abbr -a n "cd ~/dev/netbricks/"
abbr -a pg "cd ~/dev/pktgen-dpdk/"
abbr -a c "command $HOME/dev/netbricks/build.sh"
abbr -a r "sudo ./run.sh"
abbr -a p "sudo ./prun.sh"
abbr -a o "vim -u NONE output.out"
abbr -a ag "ag --rust"

# for git journal, I should only use ["Added", "Changed", "Fixed", "Improved", "Removed"]
function lazy
  if test "$argv"
    git add -A
    git commit -m "$argv"
    git push
  else
    git add -A
    git commit -m "Changed files w/ little update"
    git push
  end
end

# fix thje remote display? https://github.com/joashc/dotfiles/blob/28ba5ed46a7dc9f40e4db192a8e566e1ecbb204e/fish/config.fish
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end

# fzf
set PATH $PATH $HOME/.fzf/bin
setenv FZF_DEFAULT_OPTS '--height 20%'

if [ -e $HOME/.fzf/shell/key-bindings.fish ]; and status --is-interactive
  . $HOME/.fzf/shell/key-bindings.fish
end

if test (uname) = Darwin
  setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
  setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
else
  setenv FZF_DEFAULT_COMMAND 'ag -g ""'
  setenv FZF_CTRL_T_COMMAND 'ag -g ""'
end

function fish_user_key_bindings
  bind \cz 'fg>/dev/null ^/dev/null'
  if functions -q fzf_key_bindings
    fzf_key_bindings
  end
end

complete --command aurman --wraps pacman

if command -v aurman > /dev/null
  #abbr -a p 'aurman'
  abbr -a up 'aurman -Syu'
else
  #abbr -a p 'sudo pacman'
  abbr -a up 'sudo pacman -Syu'
end

if command -v exa > /dev/null
  abbr -a l 'exa'
  abbr -a ls 'exa'
  abbr -a ll 'exa -l'
  abbr -a lll 'exa -la'
else
  abbr -a l 'ls'
  abbr -a ll 'ls -l'
  abbr -a lll 'ls -la'
end


alias sduo sudo

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

# Set envvars since we don't have .pam_environment
setenv EDITOR nvim
setenv BROWSER links
setenv NAME "Jethro Shuwen Sun"
setenv EMAIL jethro.sun7@gmail.com
setenv CARGO_INCREMENTAL 1
setenv RUSTFLAGS "-C target-cpu=native"
setenv RUST_BACKTRACE 1
setenv LESS "-F -X -R"

set PATH $PATH ~/.cargo/bin
set PATH $PATH /snap/bin

# Fish should not add things to clipboard when killing
# See https://github.com/fish-shell/fish-shell/issues/772
set FISH_CLIPBOARD_CMD "cat"

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

set fish_git_dirty_color red
set fish_git_not_dirty_color green

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_status (git status -s)

  if test -n "$git_status"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
else
  echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
end
end

function fish_prompt
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  if test -n "$git_dir"
    printf '%s@%s %s%s%s:%s> ' (whoami) (hostname|cut -d . -f 1) (set_color yellow) (prompt_pwd) (set_color normal) (parse_git_branch)
else
  printf '%s@%s %s%s%s> ' (whoami) (hostname|cut -d . -f 1) (set_color yellow) (prompt_pwd) (set_color normal)
end
end

function fish_greeting
  echo
  echo -e (uname -ro | awk '{print " \\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
  echo -e (uptime -p | sed 's/^up //' | awk '{print " \\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
  echo -e (uname -n | awk '{print " \\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')
  echo -e " \\e[1mDisk usage:\\e[0m"
  echo
  echo -ne (\
  df -l -h | grep -E 'dev/(xvda|sd|mapper)' | \
  awk '{printf "\\\\t%s\\\\t%4s / %4s  %s\\\\n\n", $6, $3, $2, $5}' | \
  sed -e 's/^\(.*\([8][5-9]\|[9][0-9]\)%.*\)$/\\\\e[0;31m\1\\\\e[0m/' -e 's/^\(.*\([7][5-9]\|[8][0-4]\)%.*\)$/\\\\e[0;33m\1\\\\e[0m/' | \
  paste -sd ''\
  )
  echo

  echo -e " \\e[1mNetwork:\\e[0m"
  echo
  # http://tdt.rocks/linux_network_interface_naming.html
  echo -ne (\
  ip addr show up scope global | \
  grep -E ': <|inet' | \
  sed \
  -e 's/^[[:digit:]]\+: //' \
  -e 's/: <.*//' \
  -e 's/.*inet[[:digit:]]* //' \
  -e 's/\/.*//'| \
  awk 'BEGIN {i=""} /\.|:/ {print i" "$0"\\\n"; next} // {i = $0}' | \
  sort | \
  #column -t -R1 | \
  # public addresses are underlined for visibility \
  sed 's/ \([^ ]\+\)$/ \\\e[4m\1/' | \
  # private addresses are not \
  sed 's/m\(\(10\.\|172\.\(1[6-9]\|2[0-9]\|3[01]\)\|192\.168\.\).*\)/m\\\e[24m\1/' | \
  # unknown interfaces are cyan \
  sed 's/^\( *[^ ]\+\)/\\\e[36m\1/' | \
  # ethernet interfaces are normal \
  sed 's/\(\(en\|em\|eth\)[^ ]* .*\)/\\\e[39m\1/' | \
  # wireless interfaces are purple \
  sed 's/\(wl[^ ]* .*\)/\\\e[35m\1/' | \
  # wwan interfaces are yellow \
  sed 's/\(ww[^ ]* .*\).*/\\\e[33m\1/' | \
  sed 's/$/\\\e[0m/' | \
  sed 's/^/\t/' \
  )
  echo
  set_color normal
end
