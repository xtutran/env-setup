## Download file in Unix
```bash
# simple download
curl -O <link to download>

# with proxy
curl -O --proxy <[protocol://][user:password@]proxyhost[:port]> <link to download>
```

## Pip install with proxy
```bash
pip install --proxy=http://[user:password@]<proxy server>:8080 xgboost
```

## Forward a port from remote server to localhost
[Reference](https://www.ssh.com/ssh/tunneling/example)
```bash
ssh -L <local port>:localhost:<remote port> <remote server>
```
