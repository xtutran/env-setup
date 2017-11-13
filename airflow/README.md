## Install & config apache airflow mysql
### 1. Install mysql <a href='https://dev.mysql.com/downloads/mysql/'>here</a>
 - Homebrew in Macbook
```bash
brew install mysql
```
 - Mannually install without Admin right, refer [here](../mysql)

### 2. Install mysql-python
```bash
pip install mysql-python
pip install mysqlclient
```

 - Create airflow db
```bash
chmod +x scripts/create_db.sh
. scripts/create_db.sh
```

 - Test mysql-python connection
```python
from sqlalchemy import create_engine

eng = create_engine('mysql://root:@localhost:3306/mysql')
with eng.connect() as con:
    
    rs = con.execute('SELECT 6')
        
    data = rs.fetchone()[0]
    
    print "Data: %s" % data 
```

### 3. Install apache airflow, official site <a href='http://airflow.incubator.apache.org/installation.html'>here</a>

 - Install airflow[celery,mysql]
```bash
pip install "pip install airflow[celery,mysql]"
```

 - Config airflow
###### a. Initialize an airflow home
```bash
export AIRFLOW_HOME=~/airflow
export PATH=/Users/txuantu/anaconda2/lib/python2.7/site-packages/airflow/bin:$PATH

airflow version
```

###### b. Go to airflow home and config mysql connection
```bash
cd $AIRFLOW_HOME
vi airflow.cfg
```

 - Default mysql
```bash
# The executor class that airflow should use. Choices include
# SequentialExecutor, LocalExecutor, CeleryExecutor
executor = CeleryExecutor


# The SqlAlchemy connection string to the metadata database.
# SqlAlchemy supports many different database engine, more information
# their website
sql_alchemy_conn = mysql://airflow:airflow@localhost/airflow

# The Celery broker URL. Celery supports RabbitMQ, Redis and experimentally
# a sqlalchemy database. Refer to the Celery documentation for more
# information.
broker_url = sqla+mysql://airflow:airflow@localhost:3306/airflow

# Another key Celery setting
celery_result_backend = db+mysql://airflow:airflow@localhost:3306/airflow
```

 - Mannual mysql
```bash
# The executor class that airflow should use. Choices include
# SequentialExecutor, LocalExecutor, CeleryExecutor
executor = CeleryExecutor


# The SqlAlchemy connection string to the metadata database.
# SqlAlchemy supports many different database engine, more information
# their website
sql_alchemy_conn = mysql+mysqldb://airflow:airflow@localhost/airflow?unix_socket=/path/to/thesock

# The Celery broker URL. Celery supports RabbitMQ, Redis and experimentally
# a sqlalchemy database. Refer to the Celery documentation for more
# information.
broker_url = sqla+mysql://airflow:airflow@localhost:3306/airflow?unix_socket=/path/to/thesock

# Another key Celery setting
celery_result_backend = db+mysql://airflow:airflow@localhost:3306/airflow?unix_socket=/path/to/thesock
```

 - Enable SSL 
```bash
[webserver]
# The base url of your website as airflow cannot guess what domain or
# cname you are using. This is used in automated emails that
# airflow sends to point links to the right web server
base_url = http://localhost:443

# The ip specified when starting the web server
web_server_host = 0.0.0.0

# The port on which to run the web server
web_server_port = 443

# Paths to the SSL certificate and key for the web server. When both are
# provided SSL will be enabled. This does not change the web server port.
web_server_ssl_cert = ~/airflow/mycert.pem
web_server_ssl_key = ~/airflow/mykey.key
```

###### c. Initialise db connection
```bash
airflow initdb
```

###### d. Launch airflow webserver
```bash
airflow webserver
```

```bash
ariflow worker
```
