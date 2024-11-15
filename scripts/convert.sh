#!/bin/bash

if ! command -v convert &> /dev/null; then
  kdialog --error "ImageMagick is not installed. Please install it to proceed."
  exit 1
fi

target_format="$1"
shift

for file in "$@"; do
  extension="${file##*.}"
  extension="${extension,,}"

  if [[ "$extension" == "$target_format" ]]; then
    echo "Skipping '$file', already in the target format."
    continue
  fi

  output_file="${file%.*}.$target_format"
  convert "$file" "$output_file"
  echo "Converted '$file' to '$output_file'."
done

if kdialog --yesno "Do you want to delete the original files?"; then
  for file_to_delete in "$@"; do
    rm "$file_to_delete"
    echo "Deleted '$file_to_delete'."
  done
fi

