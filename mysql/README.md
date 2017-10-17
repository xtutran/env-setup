## Install mysql manually without admin right
### 1. Download mysql community server from: <a href='https://dev.mysql.com/downloads/mysql/'>here</a>
- Download .tar.gz file since we will install it manually
```bash
# without proxy
curl -O https://cdn.mysql.com//Downloads/MySQL-5.7/mysql-5.7.20-macos10.12-x86_64.tar.gz
```
or

```bash
# with proxy server (change to your proxy server accordingly)
curl -O --proxy http://<username>:<password><proxy>:<port> https://cdn.mysql.com//Downloads/MySQL-5.7/mysql-5.7.20-macos10.12-x86_64.tar.gz
```

### 2. Go to the location where you want to place your mysql server and uncompress the .tar.gz file
```bash
# uncompress
tar zxvf mysql-5.7.20-macos10.12-x86_64.tar.gz

# create symbolic link
ln -s mysql-5.7.20-macos10.12-x86_64 mysql
```

### 3. Now it's time to config and run your mysql server
#### 3.1. Create your own mysql conf insde your msql directory
```bash
cd mysql
vi my.cnf
```

- Here is my sample
```bash
[mysqld]
port=3306
socket=/Users/txuantu/Documents/Tools/mysql/thesock
basedir=/Users/txuantu/Documents/Tools/mysql
datadir=/Users/txuantu/Documents/Tools/mysql/data
log-error=/Users/txuantu/Documents/Tools/mysql/data/mysql.err
pid-file=/Users/txuantu/Documents/Tools/mysql/mysql.pid
user=txuantu

[client]
port=3306
socket=/Users/txuantu/Documents/Tools/mysql/thesock
user=txuantu

[mysqladmin]
socket=/Users/txuantu/Documents/Tools/mysql/thesock
user=txuantu
```

#### 3.2. Init your mysql database
 - Specify mysql path and mysql home directory
```bash
#!/usr/bin/env bash

export MYSQL_HOME=/Users/txuantu/Documents/Tools/mysql
export BASE_DIR=$MYSQL_HOME
export DATADIR=$BASE_DIR/data
export PATH=$MYSQL_HOME/bin:$PATH
```
 - Initalize mysql db
```bash
mysql_install_db --basedir=$BASE_DIR --datadir=$DATADIR
``` 

#### 3.3. Start your mysql server
```bash
mysqld --basedir=$MYSQL_HOME --datadir=$BASE_DIR/data --log-error=$BASE_DIR/data/mysql.err --pid-file=$BASE_DIR/mysql.pid --socket=$BASE_DIR/thesock --port=3306 -u txuantu --skip-grant-tables &
```

<aside class="notice">
To ignore authentication issue at the beginning, we use: --skip-grant-tables. However this action is too dangerous, it allows anyone to connect to all databases with no restriction without a user and password. It must be used carefully and MOST be reverted quickly to avoid risks.
</aside> 

 - Set password for root user
```bash
mysql --socket=$BASE_DIR/thesock

# in mysql console
UPDATE user SET authentication_string = PASSWORD('root@123') WHERE User = 'root';

quit
```

 - Now quit mysql and remove: --skip-grant-tables and restart mysql server
```bash
# shut it down first
mysqladmin --socket=$BASE_DIR/thesock shutdown

# start it again without --skip-grant-tables
mysqld --basedir=$MYSQL_HOME --datadir=$BASE_DIR/data --log-error=$BASE_DIR/data/mysql.err --pid-file=$BASE_DIR/mysql.pid --socket=$BASE_DIR/thesock --port=3306 -u txuantu &

# launch mysql console again
mysql --socket=$BASE_DIR/thesock -u root -p

# try simple statement
show databases;
# will get this error: ERROR 1820 (HY000): You must reset your password using ALTER USER statement before executing this statement.

# reset root password
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';

quit
```


#### 3.4. Shutdown your mysql server
```bash
mysqladmin --socket=$BASE_DIR/thesock shutdown
```

#### 3.5. Open mysql terminal
```bash
mysql --socket=$BASE_DIR/thesock
```

#### 3.6. At the end, we should add all of these to **.bashrc** file and create some aliases
```bash
vi ~/.bashrc
```

 - Here is my sample
```bash
export MYSQL_HOME=/Users/txuantu/Documents/Tools/mysql
export PATH=$MYSQL_HOME/bin:$PATH

# make alias
alias mysqld='mysqld --defaults-file=$MYSQL_HOME/my.cnf &'
alias mysqladmin='mysqladmin --defaults-file=$MYSQL_HOME/my.cnf'
alias mysql='mysql --defaults-file=$MYSQL_HOME/my.cnf'
alias mysql_config='mysql_config --defaults-file=$MYSQL_HOME/my.cnf'
```

 - Enjoy your mysql server!
```bash
# apply new change
source ~/.bashrc

# to start mysql
mysqld

# to shutdown mysql
mysqladmin shutdown

# to launch mysql console
mysql -u root -p
```
