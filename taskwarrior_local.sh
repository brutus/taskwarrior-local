# TASKWARRIOR LOCAL
#
# A couple of shell functions to easily use Taskwarrior with directory
# local task databases. These local DBs can be used alongside the global one
# (defined in the main config file or taken from defaults) but don't
# interfere with it in any way.
#
# https://taskwarrior.org/

mk-task-db ()
{
  # start a local ($PWD) tasklist
  if [ -e '.taskrc' ]; then
    echo '[ERROR] a Taskwarrior config already exists here.'
  else
    # include global settings
    if [ -e "$HOME/.taskrc" ]; then
      # shellcheck disable=SC2016
      echo 'include $HOME/.taskrc' > .taskrc
    fi
    # use local DB
    echo "data.location=$(pwd)/.taskwarrior" >> .taskrc
    # create local DB if needed
    if [ ! -e '.taskwarrior' ]; then
      mkdir .taskwarrior
    fi
  fi
}

mk-task-project ()
{
  # set local default project name
  # ARG1: default project name
  #
  if [ -e '.taskrc' ]; then
    echo '[ERROR] a Taskwarrior config already exists here.'
    return 1
  fi
  local pro="${1:-$(basename $(pwd))}"
  # include global settings
  if [ -e "$HOME/.taskrc" ]; then
    # shellcheck disable=SC2016
    echo "include $HOME/.taskrc" > .taskrc
  fi
  # set local project oerride
  echo "default.project=$pro" >> .taskrc
}

local-task ()
{
  # use local $PWD tasklist, instead of global
  if [[ "$PWD" != "$HOME" && -e ".taskrc" ]]; then
    task rc:.taskrc "$@"
  else
    task "$@"
  fi
}

alias lt="local-task"
alias ltask="local-task"
