#!/bin/zsh

###
 # Checkout a branch using fzf.
 #
 # @since 5/15/17
 # @since 1.0.0
 ##
function fzf-git-branch {
	if ! [[ -x $(command -v fzf) ]]; then
		echo "Please install fzf:";
		echo "\tHomebrew: brew install fzf"
		return
	fi

	if ! [[ -x $(command -v sed) ]]; then
		echo "Please install sed";
		return
	fi

	if ! [[ -x $(command -v git) ]]; then
		echo "Please install git:";
		echo "\tHomebrew: brew install git"
		return
	fi

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
