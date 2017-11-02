## Install & config apache airflow mysql
### 1. Install mysql <a href='https://dev.mysql.com/downloads/mysql/'>here</a>
 - Homebrew in Macbook
```bash
brew install mysql
```

### 2. Install mysql-python
```bash
pip install mysql-python
pip install mysqlclient
```

 - Create airflow db
```bash
./create_db.sh
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

Sample:
```bash
# The executor class that airflow should use. Choices include
# SequentialExecutor, LocalExecutor, CeleryExecutor
executor = CeleryExecutor


# The SqlAlchemy connection string to the metadata database.
# SqlAlchemy supports many different database engine, more information
# their website
sql_alchemy_conn = mysql://airflow:airflow@localhost/airflow
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
