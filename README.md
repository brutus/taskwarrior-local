# Taskwarrior Local

A couple of shell functions to easily use [Taskwarrior][] with directory
**local task databases** or with **default project names**.

These local DBs can be used alongside the global one (defined in the main config
file or taken from defaults) but don't interfere with it in any way.

## Usage

Source the script from your shell, `.zshrc`, `.bashrc`, `.bash_aliases` or
similar.

The script provides three functions and some aliases:

- `mk-task-db`

  Creates a `.taskwarrior` directory, that will hold the _"local DB"_ and an
  `.taskrc` file, that sets `data.location` to it. Both will be created in the
  current working directory.

  If a `.taskrc` file already exists in the current working directory, nothing
  will be changed (and an error is reported).

- `mk-task-project [project]`

  Creates an `.taskrc` file in the current working directory, that sets
  `default.project` to _project_ (defaults to `$(basename $(pwd))`).

  If a `.taskrc` file already exists in the current working directory, nothing
  will be changed (and an error is reported).

- `local-task` (alias: `ltask` and `lt`)

  Use this exactly like the normal `task` command. The difference is, that if
  a `.taskrc` exists in the current directory, it is **automatically** used.

[taskwarrior]: http://taskwarrior.org/
