function cd
    if not status is-interactive
        command cd $argv
        return
    end
    
    if test (count $argv) -eq 0
        z ~
    else
        z $argv 2>/dev/null; or command cd $argv
    end
end
