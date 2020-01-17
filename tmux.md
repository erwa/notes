### Scroll up

Ctrl-b, [
q  # to quit scroll mode
Esc-up/down  # half page up/down
Ctrl-up/down  # scroll up/down

Ctrl-S # search forward
Ctrl-R # search backward

https://superuser.com/questions/231002/how-can-i-search-within-the-output-buffer-of-a-tmux-shell
https://superuser.com/questions/209437/how-do-i-scroll-in-tmux


### Copy paste

C-b [ to enter copy mode
C-<space> to start copying
C-w (or Alt-w) to copy selected to buffer
C-b ] to paste

https://www.rushiagr.com/blog/2016/06/16/everything-you-need-to-know-about-tmux-copy-pasting-ubuntu/


### Nested tmux sessions

Send command to inner-session:
C-b C-b ,  # for example, to rename inner window

https://www.freecodecamp.org/news/tmux-in-practice-local-and-nested-remote-tmux-sessions-4f7ba5db8795/


### Resize pane

C-b C-<arrow>
C-b Alt-1  # 50-50 vertical split
C-b Alt-2  # 50-50 horizontal split

https://unix.stackexchange.com/questions/32986/how-do-i-equally-balance-tmux1-split-panes


### Full screen current pane

C-b z  # do again to go back to normal split screen


### Sessions

C-b d  # detach session
tmux ls  # list sessions
tmux attach -t 0  # attach to session 0
tmux new -s debug-npe  # create session named "debug-npe"
tmux rename-session -t 0 debug-npe  # rename session


### Kill window

C-b &

https://gist.github.com/henrik/1967800


### Renumber windows / reorder windows / rearrange windows

```
tmux movew -r

# swap current window with first window
Ctrl-b :
swap-window  -t 0
```

https://superuser.com/questions/343572/how-do-i-reorder-tmux-windows
https://stackoverflow.com/questions/8469612/how-do-i-make-tmux-reorder-windows-when-one-is-deleted


### Rename current window

C-b ,


### New window / new tab

C-b c
C-b n  # next window
C-b p  # prev window
C-b <number>  # go to window number


### Split screen

C-b % (vertical split)
C-b " (horizontal split)
C-b <arrow>  (change screen)

https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/