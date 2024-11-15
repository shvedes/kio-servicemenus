#!/usr/bin/env bash

select_wine_prefix() {
	PREFIX="$(kdialog --getexistingdirectory $HOME --title 'Select a folder for wine prefix' 2> /dev/null)"

	if [ -z "$PREFIX" ]; then
		kdialog --error "Aborted"
		exit 1
	fi

	export WINEPREFIX="$PREFIX"
	echo "[LOG]: WINEPREFIX=$WINEPREFIX"
}
