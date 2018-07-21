# ----------------------------------------------------------------------------
#
#  Description: This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.  Environment Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  Networking
#  7.  System Operations & Information
#  8.  Web Development
#  9.  Reminders & Notes
#
# ----------------------------------------------------------------------------

#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

#       Google Cloud SDK
#       ---------------------------------------------------------------------
#       The next line updates PATH for the Google Cloud SDK.
        if [ -f '/Users/David/Documents/google-cloud-sdk/path.bash.inc' ]; then source '/Users/David/Documents/google-cloud-sdk/path.bash.inc'; fi

#       The next line enables shell command completion for gcloud.
        if [ -f '/Users/David/Documents/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/David/Documents/google-cloud-sdk/completion.bash.inc'; fi

#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------

#       Change terminal colours
#       ----------------------------------------------------------------------
        export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
        export CLICOLOR=1
        export LSCOLORS=ExFxBxDxCxegedabagacad
        alias ls='ls -Gh'

#   -------------------------------
#   3. FILE AND FOLDER MANAGEMENT
#   -------------------------------

#       Alias definitions
#       ----------------------------------------------------------------------
        . ~/.bash_prompt
        . ~/.bash_aliases_docker

#       Default Text Editor
#       ----------------------------------------------------------------------
        export EDITOR=nano

#   ---------------------------
#   4. SEARCHING
#   ---------------------------


#   ---------------------------
#   5. PROCESS MANAGEMENT
#   ---------------------------


#   ---------------------------
#   6. NETWORKING
#   ---------------------------


#   ---------------------------------------
#   7. SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------


#   ---------------------------------------
#   8. WEB DEVELOPMENT
#   ---------------------------------------


#   ---------------------------------------
#   9. REMINDERS & NOTES
#   ---------------------------------------

