#!/bin/bash

# USAGE: ./MakeHack.sh

base_dir=$(dirname "$(readlink -f "$0")")

# defining buildfile config

source_rom="$base_dir/FE8_clean.gba"

main_event="$base_dir/ROM Buildfile.event"

target_rom="$base_dir/Hack.gba"
target_ups="$base_dir/Hack.ups" # unused

# do the actual building

cd "$base_dir"

echo "Copying ROM"

cp -f "$source_rom" "$target_rom" || exit 2

echo "Assembling"

cd "$base_dir/Event Assembler"
mono ColorzCore.exe A FE8 "-output:$target_rom" "-input:$main_event"

# TODO: generate patch (would require a linux version of ups)

echo "Done!"
