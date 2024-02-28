#!/bin/bash

session=lb

tmux new-window -t $session:1 -n lb-demo

tmux split-window -h -t $session:1
tmux split-window -h -t $session:1
tmux select-layout -t $session:1 even-horizontal

tmux select-pane -t :2
tmux split-window -v -p 60
tmux split-window -v -p 60

tmux send-keys -t :1.1 "docker-compose up" C-m
sleep 3
tmux send-keys -t :1.4 "docker logs -f load-balancer-app-3" C-m
tmux send-keys -t :1.3 "docker logs -f load-balancer-app-2" C-m
tmux send-keys -t :1.2 "docker logs -f load-balancer-app-1" C-m
