## SSH Passwordless Login Using SSH Keygen, [ref](https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps)
### 1. Environment
Example: SSH password-less automatic login from localhost to Cloudera-VM  with user cloudera.
```
SSH Client : localhost ( MacOS  )
SSH Remote Host : 127.0.0.1 ( RedHat - cloudera-vm )
```

### 2. Create Authentication SSH-Kegen Keys on Client machine
```bash
ssh-keygen -t rsa
```

### 3. Create .ssh Directory on Remote machine
```bash
ssh cloudera@127.0.0.1 mkdir -p .ssh
```

### 4. Upload Generated Public Keys from Client to Remote machine 
```bash
cat .ssh/id_rsa.pub | ssh cloudera@127.0.0.1 'cat >> .ssh/authorized_keys'
```

### 5. Set Permissions on Remote machine
```bash
ssh cloudera@127.0.0.1 "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"
```

### 5. Make an alias for Remote server
```bash
vi ~/.ssh/config
```

 * 3022 is forwarding port of 22 from VM to my local machine
```
Host cloudera-vm
    HostName 127.0.0.1
    Port 3022 
    User cloudera
    IdentityFile ~/.ssh/id_rsa
```

```bash
ssh cloudera-vm
```

:boom: Enjoy!

