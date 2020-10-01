#!/bin/zsh

###
 # Checkout a branch using fzf.
 #
 # @since 5/15/17
 # @since 1.0.0
 ##
function fzf-git-branch {
	local branches=$(git branch -a) &&
	local branch=$(echo "$branches" | fzf +s +m -e) &&
	local cmd=$(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")

	if [ -z "$cmd" ]; then
		return
	fi

	git checkout "$cmd"
}
