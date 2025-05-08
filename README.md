# switch_gui_cli.sh
Here’s a Bash script to switch between CLI (Command Line Interface) and GUI (Graphical User Interface)

How It Works

systemctl set-default graphical.target → Boots into GUI on startup.

systemctl set-default multi-user.target → Boots into CLI.

systemctl start/stop lightdm → Starts or stops the display manager.

This is useful for saving resources on the Pi Zero W, since the GUI can be slow.
