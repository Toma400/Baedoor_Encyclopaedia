# 🧱 Git Management Guide

---
As Baedoor Encyclopaedia grows, its Git system becomes increasingly harder to manage through
both website and GitHub Desktop overviews. The terminal pipeline is also useful in particular
for keeping bigger control over the details and pace of work, not forcing for long, once-done
sessions.

The updated workflow goes as follows:
- create a `temp` branch **based on en_us branch**
- clone the repository
- `git checkout temp`, switching to temp branch
- `git merge [language branch]`
- terminal will prompt merge failure, showcasing what conflicts appeared
  - operate with conflicts via `git status`
  - this will list all conflicts as non-staged files
  - staged files will be files that differentiate language branch from en_us (aka translated ones)
  - resolved conflicts can simply be added (staged), either one-by-one, or by `git add --all`
  - logic of commiting is up to you, it can be either single big commit or several smaller ones
  - if file was removed, you can either `git rm [file]` and then `rm [file]`, or simply remove 
    the local file and then `git add` (the file will disappear from `git status` instead of being
    pushed to staged)
- once finished doing changes, commit staged files as normal and push
- do PR `temp > [language branch]` and merge it (now without conflicts) and remove `temp` branch