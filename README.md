# `fzf-git-branch`

Simple function to allow you to use fzf to checkout git branches. 

## Usage

```bash
fzf-git-branch
```

_But, I recommend you use it as a `git` alias (if you install with `antigen`):_

```
[alias]
	fb = ! /bin/bash -c 'source $HOME/.antigen/bundles/aubreypwd/zsh-plugin-fzf-git-branch/fzf-git-branch.plugin.zsh && fzf-git-branch'
```

Now you can just do `git fb` to find branches to checkout.

## Requirements

- `fzf`
- `sed`

## Install

Using [antigen](https://github.com/zsh-users/antigen):

```bash
antigen bundle aubreypwd/zsh-plugin-fzf-git-branch@1.0.0
```

## Development

Install the package on `master`:

```bash
antigen bundle aubreypwd/zsh-plugin-fzf-git-branch
```

...and contribute upstream by working in `$HOME/.antigen/bundles/aubreypwd/zsh-plugin-fzf-git-branch`.

---

## Changelog

### 1.0.0

- First version
