#!/bin/bash
COMMIT_ERROR_EXITSTATUS=1
INVALID_CREDENTIALS_EXITSTATUS=1
CURL_ERROR_EXITSTATUS=1
GIT_ORIGIN_EXITSTATUS=1
GIT_PUSH_EXITSTATUS=1

new-repo() {
  git log -q
  if (( $? == 0 )); then
    echo "=== You have commits, let's make a repo for them! ==="
  else
    echo "=== You don't have any commits to put into a new repo, you turkey! ==="
    return $COMMIT_ERROR_EXITSTATUS
  fi
  
  repo_namen=$1
 
  dir_namen=$(basename "$(pwd)")
 
  if [[ ! $repo_namen ]]; then
    echo "What shall we call this fancy new repo (hit enter to use '$dir_namen')?"
    read repo_namen
  fi
 
  if [[ ! $repo_namen ]]; then
    repo_namen=$dir_namen
  fi
 
  usernamen=$(git config user.name)
  if [[ ! $usernamen ]]; then
    echo "=== Oh no, that user does not exist! Try running 'git config --global user.name <username>'. ==="
    return $INVALID_CREDENTIALS_EXITSTATUS
  fi
 
  token=$(git config github.token)
  if [[ ! $token ]]; then
    echo "=== GitHub doesn't like that token, sorry. :( Try running 'git config --global github.token <token>'. ==="
    return $INVALID_CREDENTIALS_EXITSTATUS
  fi
 
  echo "Making the '$repo_namen' repo!"
  curl -su "$usernamen:$token" https://api.github.com/user/repos -d '{"name":"'$repo_namen'"}'
  if (( $? == 0 )); then
    echo "Yay! We made the '$repo_namen' repo!"
  else
    echo "=== Oh noes! There was an error completing the cURL. :< ==="
    return $CURL_ERROR_EXITSTATUS
  fi
 
  echo "=== Reticulating spleens... ==="
  git remote set-url origin https://github.com/$usernamen/$repo_namen.git
  if (( $? == 0 )); then
    echo "We've added origin successfully, captain!"
  else
    echo "=== We were unable to add origin. :/ ==="
    return $GIT_ORIGIN_EXITSTATUS
  fi

  git push -u origin master
  if (( $? == 0 )); then
    echo "=== Mission success! Your local items are now in your remote repo. Yay! :) ==="
  else
    echo "=== Oh noes! There was an error with the push. :( ==="
    return $GIT_PUSH_EXITSTATUS
  fi
}
