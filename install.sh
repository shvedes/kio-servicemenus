#!/usr/bin/env bash

git clone https://github.com/shvedes/kio-servicemenus
cd kio-servicemenus

mkdir -p $HOME/.local/bin/kio-servicemenus
mkdir -p $HOME/.local/share/kio

sed -i "s/username/$USER/g" ./servicemenus/*

cp -r ./scripts/* $HOME/.local/bin/kio-servicemenus
cp -r ./servicemenus $HOME/.local/share/kio

echo "servicemenus installed"
