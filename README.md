# Simply switch between sets of environment variables

Managing multiple cloud authentication variables is a pain. Cloud Envy (clenv) is a stupid, simpel
set of bash functions for switching between sets of cloud environment variables in bash. Clenv may
or may not support other shells.

# Installation

```
$ make install
```

Then add the following to your `.bashrc` file

```
source ~/.clenv/clenv.sh
```

This command adds the clenv commands to your shell session and loads all the environment variables contained
in the files that match `~/.clenv/*-current`

# Usage

Clenv looks in the directory ~/.clenv for your cloud-specific environment variables

To do anything useful with clenv, you must add environment variables to your `~/.clenv` directory. You 
must `export` all the variables you add.

Here is an example of a personal account

```
# ~/.clenv/aws-personal
export AWS_ACCESS_KEY_ID=xxxxxxx
export AWS_SECRET_ACCESS_KEY=xxxxx
```

and a work account

```
# ~/.clenv/aws-work
export AWS_ACCESS_KEY_ID=xxxxxxx
export AWS_SECRET_ACCESS_KEY=xxxxx
```

See the examples directory for more.

clenv has 2 commands `clenv-show` which lists all currently loaded sets of environment and
`clenv-use` which loads a new set of environment variables.

Without any arguments, clenv-show displays all currently loaded applications

```
$ clenv-show
aws-personal
rax-work
```

With an argument, clenv-show displays the environment currently used for a given application

```
$ clenv-show aws
personal
```

To change which environment is used for a given application

```
$ clenv-use aws work
```

The variables for aws-work now loaded and will be used for subsequent shell sessions

### License

Copyright (c) 2015 Bryan W. Berry
BSD License
