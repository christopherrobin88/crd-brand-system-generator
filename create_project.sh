#!/bin/bash

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
  echo "Please provide a project name"
  exit 1
fi

PROJECT_NAME_CLEAN=$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')
PROJECT_PATH="PROJECTS/$PROJECT_NAME_CLEAN"

if [ -d "$PROJECT_PATH" ]; then
  echo "Project already exists: $PROJECT_PATH"
  exit 1
fi

cp -R PROJECTS/_template "$PROJECT_PATH"

open -a "Visual Studio Code" "$PROJECT_PATH"

echo "Created project: $PROJECT_PATH"