# TASKWARRIOR

# functions to easily use TASKWARRIOR with local settings on a *per directory*
# base instead of using the global task registry.

mktaskdb ()
{
  # start a local ($PWD) tasklist
  if [[ -e .taskrc ]]; then
    echo "[ERROR] a local Taskwarrior config already exists."
  else
    if [[ ! -e .task ]]; then
      mkdir .task
    fi
    echo "data.location=\"$(pwd)/.task\"" > .taskrc
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
