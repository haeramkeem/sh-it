# SH-IT!!

To save various bash script (or command) hacks

## Basic Usage

If you want to run a script without copying-pasting shit
(especially installation scripts), just type:

```bash
bash <(curl -sL https://raw.githubusercontent.com/haeramkeem/sh-it/main/path/to/script)
```

If you want to `source` a script to use functions or sh-it,
just type:

```bash
source <(curl -sL https://raw.githubusercontent.com/haeramkeem/sh-it/main/path/to/script)
```

If you want to download a boilerplate or sh-it, just type:

```bash
curl -sLO https://raw.githubusercontent.com/haeramkeem/sh-it/main/path/to/script
```

Or you can just look around the scripts I pushed in [here](https://gist.github.com/haeramkeem)

## RCs

### Vim

```bash
curl https://raw.githubusercontent.com/haeramkeem/sh-it/main/rcs/.vimrc > ~/.vimrc
```

To import minimum configuration (no vim-plugin setting), do:

```bash
curl https://raw.githubusercontent.com/haeramkeem/sh-it/main/rcs/.min.vimrc > ~/.vimrc
```

### Zsh

```bash
curl https://raw.githubusercontent.com/haeramkeem/sh-it/main/rcs/.zshrc > ~/.zshrc
```

### CoC

```bash
curl https://raw.githubusercontent.com/haeramkeem/sh-it/main/rcs/coc-settings.json -o ~/.vim/coc-settings.json
```

### Grub

```bash
sudo curl https://raw.githubusercontent.com/haeramkeem/sh-it/main/rcs/grub -o /etc/default/grub
```
