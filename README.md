# Taskwarrior Local

A couple of shell functions to easily use [Taskwarrior] with directory local
task databases. These local DBs can be used alongside the global one (defined in
the main config file or taken from defaults) but don't interfere with it in any
way.


## Usage

Source the script from your shell, `.bashrc`, `.bash_aliases` or similar.

The script provides two functions / commands:

* `mktaskdb`

  Creates a `.taskwarrior` directory that will hold the local DB and a `.taskrc`
  file that points to it. Both in the local directory (and only if they don't
  already exists).

* `local-task` (alias: `ltask` and `lt`)

  Use this exactly like the normal `task` command.

  The difference is, that if a `.taskrc` exists in the current directory, it is
  automatically used. Together with the `mktaskdb` command, this enables
  directory local Taskwarrior databases, that don't interfere with your global
  DB.


[Taskwarrior]: http://taskwarrior.org/
