# x509 cert validity checker (`x509_validity`)

## Installation

- Add the following command to `~/.zshrc`.

```bash
source <(curl -fsSL https://raw.githubusercontent.com/haeramkeem/sh-it/main/func/x509_validity/x509_validity.sh 2> /dev/null || <<< "echo x509_validity not loaded")
```

## Usage

```bash
cat example.crt | x509_validity
```
