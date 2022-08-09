# To prevent debug code from being accidentally committed, simply add a comment near your
# debug code containing the keyword !nocommit and this script will abort the commit.
#
# Source:  https://medium.com/@ripoche.b/using-global-pre-commit-hook-to-prevent-committing-unwanted-code-edbbf957ad12
# TODO: echo list of files?
nocommit() {
	if git commit -v --dry-run | grep '!nocommit' >/dev/null 2>&1; then
	  echo "Trying to commit non-committable code."
	  echo "Remove the !nocommit string and try again."
	  exit 1
	else
	  # Run local pre-commit hook if exists
	  if [ -e ./.git/hooks/pre-commit ]; then
	    ./.git/hooks/pre-commit "$@"
	  else
		exit 0
	  fi
	fi
}
