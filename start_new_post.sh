#!/bin/bash
# check if correct branch
# Get the current branch name
current_branch=$(git branch --show-current)

# Check if the current branch is "inprogress"
if [ "$current_branch" != "inprogress" ]; then
    # Switch to the "inprogress" branch
    git checkout inprogress

    # Check if the checkout was successful
    if [ $? -ne 0 ]; then
        echo "Script message: Failed to switch to branch 'inprogress'."
        exit 1
    else
        echo "Script message : Switched to branch 'inprogress'."
    fi
else
    echo "Script Message : Already on branch 'inprogress'."
fi
# check if the post name provided
if [ $# -eq 0 ]; then
 echo "no arguments, enter post name as argument like ./start_new_post <POSTNAME>"
 exit 1
fi
PTITLE=$1
TDATE=$(date +'%Y-%m-%d')
#function to create file name a and check for ext
add_ext () {
  FILENAME="${TDATE}-${PTITLE}-inprogress"
  echo $FILENAME
  if [[ $FILENAME != *".md"* ]]; then
    FILENAME+=".md"
  fi
}

#check add .md ext to post filename
add_ext


#create post using hugo
FFNAME="./posts/${FILENAME}"
hugo new --kind post $FFNAME

#check if post file is created
ABSPATH="content/${FFNAME}"
if [[ -f $ABSPATH ]]; then
    echo "$ABSPATH created."
fi
