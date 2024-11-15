#!/usr/bin/env bash

if ! command -v wine > /dev/null; then
	kdialog --error "Wine is not installed. Please install it to proceed."
fi

source $HOME/.local/bin/kde-servicemenus/lib/wine.sh

select_wine_prefix
wineboot

if [[ "$1" = *.reg ]]; then
	regedit "$1"
else
	wine "$1"
fi
