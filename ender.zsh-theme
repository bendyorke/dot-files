PROMPT='%{$fg_bold[red]%}➜ %{$reset_color%}$(battery)%{$fg[cyan]%}%c %{$fg_bold[blue]%}$(check_git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

function check_git_prompt_info() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        if [[ -z $(git_prompt_info) ]]; then
            echo "%{$fg[magenta]%}detached-head%{$reset_color%})"
        else
            echo "$(git_prompt_info)"
        fi
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

battery() {
  local bat=$(pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d ';' | tr -d ' ')
  local char=$(pmset -g batt | sed -n '2p' | cut -f2 -d ';' | tr -d ' ')
  case $char in
    'ACattached'|'charging'|'charged'|'finishing charge')
      case $bat in
        100*)         local bat_flag="%{$fg[green]%}℥ %{$reset_color%}";;
        *)            local bat_flag="$bat %{$fg[green]%}﹪%{$reset_color%}";;
      esac
      ;;
    'discharging')
      case $bat in
        100*)         local bat_flag="℥ %{$reset_color%}";;
        [2-9][0-9]*)  local bat_flag="$bat ﹪";;
        1[0-9]*)      local bat_flag="%{$fg[yellow]%}$bat ﹪%{$reset_color%}";;
        [5-9][^0-9]*) local bat_flag="%{$fg[red]%}$bat ﹪%{$reset_color%}";;
        [0-4][^0-9]*) local bat_flag="%{$fg[red]%}$bat ﹪";;
      esac
      ;;
  esac
  echo $bat_flag
}

