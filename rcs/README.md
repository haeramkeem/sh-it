# RCs

## Index

1. .vimrc -> vim configuration file
2. .vimrc.min -> minimum setting for vim (no-plugins)
3. .zshrc -> zsh & oh-my-zsh configuration file
4. coc-settings.json -> Coc configuration JSON
5. grub -> Grub default configuration

## Import

### Vim

```bash
curl https://raw.githubusercontent.com/haeramkeem/rcs/main/.vimrc > ~/.vimrc
```

### Vim (no plugin option)

```bash
curl https://raw.githubusercontent.com/haeramkeem/rcs/main/.min.vimrc > ~/.vimrc
```

### Zsh

```bash
curl https://raw.githubusercontent.com/haeramkeem/rcs/main/.zshrc > ~/.zshrc
```

### CoC

```bash
curl https://raw.githubusercontent.com/haeramkeem/rcs/main/coc-settings.json -o ~/.vim/coc-settings.json
```

### Grub

```bash
sudo curl https://raw.githubusercontent.com/haeramkeem/rcs/main/grub -o /etc/default/grub
```
