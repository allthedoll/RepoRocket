# RepoRocket README  
## What is it?  
RepoRocket is a Bash funtion to easily create a new repository from existing local commits.

## Why? Command line commits are easy.  
Two reasons, really:

1. Command line stuff isn't as easy for newer users or users that might not be as tech-oriented. For some folks, the command line can even be a little scary.

2. Typing everything out takes time. If you make new repositories often, then wouldn't you rather automate most of the work? Using this function is also faster than creating a new repository on GitHub.com itself.

## How did you come up with this idea?  
The "Customer Scenario D" in my homework for GitHub mentioned that the company is "not very familiar with command line." Instead of having to remember all of these new terms and commands, it might be easier and faster to simply type "new-repo" and answer some basic questions so the script can do the work for them; this saves people from getting frustrated, helps them feel comfortable with a common task, and ultimately makes for happier workers.

Even for people that are very familiar with this process might like the time it saves them off of typing each item out by hand. Less typing is more efficient!

## How do I use it?  
This script assumes you already have been using GitHub from the command line, so everything is set up (e.g. username, token, etc.).

Linux users copy the *functions.sh* to their bin folder, or add the script onto an existing functions.sh they might already have.

Source the file (e.g. *. functions.sh*).

Once you have at least one commit ready to go into a new repository, you simply type *new-repo* and the script will ask you for everything it needs to complete the actions.

If an error were to occur, the script will let you know; similarly, the script will inform you of successes after actions and when it is finished.
