#!/usr/bin/env bash
source ./.env

# in ./project-template-py folder 
uv init --name ${PROJECT_NAME}

# create and initialize git repo
git init --initial-branch main .
git config user.name "${GIT_USERNAME}"
git config user.email "${GIT_USEREMAIL}"
git config init.defaultBranch main

cat >> ./requirements.txt << EOF
# requirements.txt
EOF

cat >> ./requirements-test.txt << EOF
pytest
EOF

# add & commit changes
git add . && git commit -m "initial commit"

# create remote repo and push local commits
gh repo create "${PROJECT_NAME}" \
    --private \
    --push --source=. \
    --description "${PROJECT_DESC}"

