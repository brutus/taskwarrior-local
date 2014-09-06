# Taskwarrior Local

A set of shell functions to use a directory local [Taskwarrior] DB instead
of the global one.


## Usage

Source the script from your shell or `.bashrc`, `.bash_aliases` or similar.

The script provides two functions / commands:

* `mktaskdb`

  Creates a `.task` directory for the DB and a `.taskrc` file that points to
  it - both in the local directory (and only if they don't exists already).

* `local-task` (alias: `ltask` and `lt`)

  Use this exaclty like the normal `task` command.

  The difference is, that if a `.taskrc` exists in the current directory, it
  is used instead of the global [Taskwarrior] DB.


[Taskwarrior]: http://taskwarrior.org/
