


#-----PROMPT-----#
parse_git_dirty() {
  STATUS="$(git status 2> /dev/null)"
  if [[$? -ne 0]]; then printf ""; return; else printf " ["; fi
  if echo "${STATUS}" | grep -c "renamed:" &> /dev/null; then printf " >" else printf ""; fi 
  if echo "${STATUS}" | grep -c "branch is ahead:" &> /dev/null; then printf " !" else printf ""; fi
  if echo "${STATUS}" | grep -c "new file::" &> /dev/null; then printf " +" else printf ""; fi
  if echo "${STATUS}" | grep -c "Untracked files:" &> /dev/null; then printf " ?" else printf ""; fi
  if echo "${STATUS}" | grep -c "modified:" &> /dev/null; then printf " *" else printf ""; fi
  if echo "${STATUS}" | grep -c "deleted:" &> /dev/null; then printf " -" else printf ""; fi
  printf " ]"
}

parse_git_branch() {
  #Long form
  git rev-parse --abbrev-ref HEAD 2> /dev/null
  #Shor form
  git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -e 's/.*\/\(.*\)/\1/'
}

PROMPT='%n@%m  %F{141}%/%f $ '






