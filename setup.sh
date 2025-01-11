#!/usr/bin/env bash

PROJECT_NAME="project_name"
PROJECT_DESC="A python project"

# in ./project-template-py folder 
uv init --name ${PROJECT_NAME}

# create and initialize git repo
git init --initial-branch main ${PROJECT_NAME}
git config user.name "fc510"
git config user.email "frostyblueye@gmail.com"
git config init.defaultBranch main

# setup virtual env
uv add -r ./requirements.txt
uv add -r ./requirements-test.txt

# add & commit changes
git add . && git commit -m "initial commit"

# create remote repo and push local commits
gh repo create "${PROJECT_NAME}" \
    --private \
    --push --source=. \
    --description "${PROJECT_DESC}"

