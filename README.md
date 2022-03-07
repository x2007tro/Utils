# Utils
Utility functions

## tools
1. Ubuntu/install_r_pkgs.bash
  - Overview: It scans one file and install all required packages
  - Prerequisites: create a folder called 'tmp' under /home/user_name/
  - Usage: sh install_r_pkgs.bash file_path
  
2. Ubuntu/ubuntu_cleanup.bash
  - Overview: It cleanup ubuntu system
  - Usage: sh ubuntu_cleanup.bash

3. Ubuntu/git_pull_all.bash
  - Overview: It updates all existing git repos
  - Usage: sh git_pull_all.bash

4. ShinyServer/home
  - Overview: Configuration files for nginx and shiny-server

## new webapp addition
1. Clone the repo to Ubuntu server, use command git clone https://github.com/x200tro/REPO_NAME.git
2. Install all required packages on Ubuntu server, use install_r_pkgs.bash /home/kmin/ShinyApps/REPO_NAME/README.md
3. Add the new webapp to ShinyServer/home, use sudo nano /etc/nginx/sites-available/home
4. Reload nginx, use sudo nginx -s reload
5. Add the new webapp to existing webapp home-global.R, pull the home webapp from github to Ubuntu server
6. Restart ShinyServer, use sudo systemctl restart shiny-server
7. If webapp doesn't launch successfully, check error log in /home/kmin/ShinyApps/log
8. It might be helpful to run ShinyApp within server R environment, setWD to webapp directory, use shiny::runApp('app.R') 
