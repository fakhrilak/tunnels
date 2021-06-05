#!/bin/zsh                                                                                                   

SESSIONNAME1="main_script"
tmux has-session -t $SESSIONNAME1 &> /dev/null

if [ $? != 0 ] 
 then
    tmux new-session -s $SESSIONNAME1 -n tunnels1 -d
    tmux send-keys -t $SESSIONNAME1 "cd /root/tunnels" C-m
    tmux send-keys -t $SESSIONNAME1 "export FLASK_APP=tunnles.py" C-m
    tmux send-keys -t $SESSIONNAME1 "export FLASK_ENV=development" C-m
    tmux send-keys -t $SESSIONNAME1 "flask run --host '0.0.0.0' --port 6001" C-m
    tmux split-window -h
    tmux send-keys -t $SESSIONNAME1 "cd /root" C-m
    tmux send-keys -t $SESSIONNAME1 "ngrok authtoken 1tVrf4hxrUShibDXMrDXUQcMOVQ_5ixw3cEnLUHDuMwPcbpSy" C-m
    # contoh "ngrok authtoken 1qyLknH222LdM2C8IQhx3clAR_2s8cEPiNpDT6nz8gmfHyg"
    tmux send-keys -t $SESSIONNAME1 "ngrok tcp 22" C-m
fi

tmux attach -t $SESSIONNAME1
