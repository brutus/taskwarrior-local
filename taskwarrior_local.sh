# TASKWARRIOR

# functions to easily use TASKWARRIOR with local settings on a *per directory*
# base instead of using the global task registry.

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
    echo "data.location=$(pwd)/.task" >> .taskrc
    # create local DB if needed
    if [[ ! -e .task ]]; then
      mkdir .task
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
