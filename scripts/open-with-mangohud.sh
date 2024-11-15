#!/usr/bin/env bash

source $HOME/.local/bin/kde-servicemenus/lib/wine.sh

if ! command -v mangohud > /dev/null; then
	kdialog --error "Wine is not installed. Please install it to proceed."
fi

select_wine_prefix
env MANGOHUD=1 mangohud "$1"
