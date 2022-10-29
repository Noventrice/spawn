# spawn
This will install a function in Bash which will open a shell in a new window.

This is different from pressing <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>T</kbd> because you can specify the directory the window starts in. It defaults to the current directory! Also, you can give code for the new window to run. So, you could use history substitution to run code in the current window which runs the code in a new window; bypassing the need to copy-paste/retype for the same result.

You will need to follow the instructions from runing install.sh.
You will eventually be instructed change your shell's init file.
Changing the init file is necessary because the spawned shell will need to clean up after the spawner.
