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
## Grant privileges to the new user
```bash
GRANT ALL PRIVILEGES ON company.* TO 'dbuser'@'localhost';
```
## Apply changes
```bash
FLUSH PRIVILEGES;
```
## Test login with the new account
```bash
mysql -u dbuser -p
```




