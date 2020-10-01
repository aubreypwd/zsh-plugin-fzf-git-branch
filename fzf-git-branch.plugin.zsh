#!/bin/zsh

if [[ $(command -v antigen) ]]; then
	antigen bundle aubreypwd/zsh-plugin-require@1.0.1
	antigen apply

	require "fzf" "brew reinstall fzf" "brew"
fi

###
 # Checkout a branch using fzf.
 #
 # @since 5/15/17
 # @since 1.0.0
 ##
function fzf-git-branch {
	if ! [[ -x $(command -v fzf) ]]; then >&2 echo "Please install fzf to use." && return; fi
	if ! [[ -x $(command -v sed) ]]; then >&2 echo "Please install sed to use." && return; fi
	if ! [[ -x $(command -v sed) ]]; then >&2 echo "Please install git to use." && return; fi

	if ! [[ -d ".git" ]]; then
		echo "Not a git repository."
		return
	fi

	local branches=$(git branch -a) &&
	local branch=$(echo "$branches" | fzf +s +m -e) &&
	local git_cmd=$(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")

	if [ -z "$git_cmd" ]; then
		return
	fi

	git checkout "$git_cmd"
}
