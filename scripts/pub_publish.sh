#!/bin/bash

# Run command: [bash pub_publish.sh]

# This script is intended for publishing your plugin on pub.dev.
# Before publishing, the script performs code analysis, tests, package verification, and code formatting.

# Change to the root directory of the project
cd "$(dirname "$0")/.."

# Your comments for the changelog split by "/"
comments=("Fixed readme")

# Increment the version number
echo -e "\033[32mIncrementing the version number...\033[0m"

# Increment version in pubspec.yaml
awk -F'.' -v OFS='.' '/version:/{++$3}1' pubspec.yaml > temp && mv temp pubspec.yaml

# Extract new version from pubspec.yaml
new_version=$(awk -F' ' '/version:/{print $2}' pubspec.yaml)

# Update version in README.md
awk -v new_version="$new_version" '/^  search_autocomplete:/{sub(/\^.*$/, "^" new_version)}1' README.md > temp && mv temp README.md

# Form the changelog entry
changelog_entry="## $new_version\n\n"
for c in "${comments[@]}"; do
    changelog_entry+="- $c\n"
done

# Update version and add comment in CHANGELOG.md
echo -e "$changelog_entry\n$(cat CHANGELOG.md)" > CHANGELOG.md

# ... rest of your script

set -e # Stop the script at the first error

flutter pub get

# Code analysis
echo -e "\033[32mAnalyzing the code...\033[0m"
flutter analyze

# Dry run to verify the package before publishing
echo -e "\033[32mVerifying package for publishing (dry run)...\033[0m"
flutter pub publish --dry-run

# Format the code
echo -e "\033[32mFormatting the code...\033[0m"
dart format .

# Publishing the package
echo -e "\033[32mPublishing the package...\033[0m"
flutter pub publish

echo -e "\033[32mPublication complete!\033[0m"
