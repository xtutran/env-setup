## Config git global username/email
```bash
git config --global user.email "email@example.com"
git config --global user.name "username"
```

## Config git with a proxy server
Command to use:
```bash
git config --global http.proxy http://proxyuser:proxypwd@proxy.server.com:8080
```
 - change proxyuser to your proxy user
 - change proxypwd to your proxy password
 - change proxy.server.com to the URL of your proxy server
 - change 8080 to the proxy port configured on your proxy server

Unset proxy:
```bash
git config --global --unset http.proxy
```

Print out the currently set proxy:
```bash
git config --global --get http.proxy
```

## Remove `.DS_Store` in MacBook git
 - Find and remove `.DS_Store` in current repo
```bash
find . -name .DS_Store -print0 | xargs -0 git rm --ignore-unmatch
```

 - Add global .gitignore
```bash
echo ".DS_Store" >> ~/.gitignore_global
echo "._.DS_Store" >> ~/.gitignore_global
echo "**/.DS_Store" >> ~/.gitignore_global
echo "**/._.DS_Store" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```
