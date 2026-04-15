[Unit]
Description=Custom Startup TUI

#!bin/bash

cosmic-term -e &
cosmic-term -e btop  
cosmic-term -e yazi &
cosmic-term -e note &
