# TASKWARRIOR LOCAL
#
# A couple of shell functions to easily use Taskwarrior with directory
# local task databases. These local DBs can be used alongside the global one
# (defined in the main config file or taken from defaults) but don't
# interfere with it in any way.
#
# https://taskwarrior.org/

mktaskdb ()
{
  # start a local ($PWD) tasklist
  if [[ -e .taskrc ]]; then
    echo "[ERROR] a Taskwarrior config already exists here."
  else
    # include global settings
    if [[ -e ~/.taskrc ]]; then
      echo "include ~/.taskrc" > .taskrc
    fi
    # use local DB
    echo "data.location=$(pwd)/.taskwarrior" >> .taskrc
    # create local DB if needed
    if [[ ! -e .taskwarrior ]]; then
      mkdir .taskwarrior
    fi
  fi
}

local-task ()
{
  # use local ($PWD) tasklist, instead of global
  if [[ "$PWD" != "$HOME" && -e ".taskrc" ]]; then
    task rc:.taskrc $@
  else
    task $@
  fi
}

alias lt="local-task"
alias ltask="local-task"
