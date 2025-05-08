#!/bin/bash

# cmdh-completion.bash - Bash completion for cmdh

_cmdh_complete() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="-h --help -p --prompt -v --verbose -c --copy -s --setup"
    
    # Handle flags that take no arguments
    case "${prev}" in
        -h|--help|-v|--verbose|-c|--copy|-s|--setup)
            return 0
            ;;
        -p|--prompt)
            # Don't complete anything after prompt flag, user should type their query
            return 0
            ;;
        *)
            ;;
    esac
    
    # Complete options
    if [[ ${cur} == -* ]]; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi
    
    # No completion for free-form text queries
    return 0
}

complete -F _cmdh_complete cmdh
