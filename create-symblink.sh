#!/bin/bash

# Set the main_directory to the parent directory of the script
main_directory="$(pwd)"

# Loop through subdirectories
for sub_directory in "$main_directory"/*; do
  if [ -d "$sub_directory" ]; then
    if [ -f "$main_directory/config.env" ]; then
      echo "creating .env symbolic link in [$sub_directory] from [$main_directory/config.env]"
      ln -sf "$main_directory/config.env" "$sub_directory/.env"
    fi
  fi
done


# Load the .env file
source "$main_directory/config.env"