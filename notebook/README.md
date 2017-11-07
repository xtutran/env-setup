## Setup public server, <a href='http://jupyter-notebook.readthedocs.io/en/stable/public_server.html'>more</a>

### 1. Install Anaconda or Conda
### 2. Setup jupyter-notebook & securing a notebook server
 - Generate a notebook configuration file
```bash
jupyter notebook --generate-config
```

 - Create notebook password
```bash

```

 - Create ssl certificate to enable HTTPS 
```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout mykey.key -out mycert.pem
```

 - Modify notebook config
```bash
vi ~/.jupyter/jupyter_notebook_config.py
```

```
# enable notebook prompt password
c.NotebookApp.password_required = True

## The login handler class to use.
c.NotebookApp.login_handler_class = 'notebook.auth.login.LoginHandler'

## The logout handler class to use.
c.NotebookApp.logout_handler_class = 'notebook.auth.logout.LogoutHandler'

## enable https 
## The full path to an SSL/TLS certificate file.
c.NotebookApp.certfile = u'/Users/txuantu/mycert.pem'

## The full path to a certificate authority certificate for SSL/TLS client
#  authentication.
c.NotebookApp.keyfile = u'/Users/txuantu/mykey.key'

# disable auto open browser
c.NotebookApp.open_browser = False

## The port the notebook server will listen on.
c.NotebookApp.port = 8888
```

