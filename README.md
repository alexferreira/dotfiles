# Alex’s dotfiles

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/alexferreira/dotfiles.git
cd dotfiles
sh bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
sh bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
sh bootstrap.sh -f
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/alexferreira/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh}
```

To update later on, just run that command again.


### Backup OS X Settings

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
sh osx_backup.sh
```

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

### Restore OS X Settings

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
sh osx_restore.sh
```

## Feedback

Suggestions/improvements
[welcome](https://github.com/alexferreira/dotfiles/issues)!