# SQL-Project
This is the code for my lab work in the Database course.
#  On Ubuntu/Debian
##  Install MySQL Server
```bash
sudo apt install mysql-server -y
```
##  Start and enable the service to run automatically
```bash
sudo systemctl start mysql
sudo systemctl enable mysql
```
##  Run the security configuration
```bash
sudo mysql_secure_installation
```
##  Verify the installation
```bash
mysql --version
sudo systemctl status mysql
```
# After Installation
## Log in to MySQL as root
```bash
mysql -u root -p
```
## Create a new user account
```bash
CREATE USER 'dbuser'@'localhost' IDENTIFIED BY 'Password!';
```
dbuser → the username you want.

localhost → restricts login to local machine (use % for any host if you want remote access).

Password → replace with a secure password.


