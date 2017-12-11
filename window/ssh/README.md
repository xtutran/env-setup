1. Downloading Cygwin
   - download cygwin setup.exe and run it
   - choose an appropriate mirror
		Note: I will assume that Cygwin will be installed into C:\Programs\Cygwin. Do not install Cygwin into a folder that contains a space character (C:\Program Files). If you do so, you will face many random and unexpected troubles.
2. Install from packages, choose the following:
   - OpenSSH,
   - tcp_wrappers,
   - diffutils [this should be pre-selected],
   - zlib
   
   proceed with installation until it is finished.

3. Configuring Cygwin

   - run CygWin Bash Shell with Administrator privileges (C:\cygwin\Cygwin.bat)
   - from this Bash shell run ssh-host-config
   - say “yes” to privilege separation
   - say “yes” to create the sshd account
   - say “yes” to install sshd as a service
   - press to enter an empty value of CYGWIN for the daemon
   - Now Cygwin needs to create a new account that will be used as a “proxy”/setuid origin account. Say “no” to use the default name (cyg_server).
   - say “yes” to create a new privileged account cyg_server.
   - create a password for this new privileged account and confirm it
   - synchronize Windows user accounts with Cygwin user accounts:
		mkpasswd -cl > /etc/passwd
		mkgroup --local > /etc/group
   - start SSH server with net start sshd

   - test connection with 'ssh localhost' from Cygwin Bash Shell.
		say “yes” to check and store server fingerprint
		put your Windows account password to authenticate
		issue a few test commands in the remote session
		close session with exit.
		alternatively: test your SSHD with putty.
		
4. Common issues
   - Connection closed by ::1 error
   => How to fix?
		+ Check your hosts file: C:\Windows\System32\drivers\etc\hosts
		+ Uncomment two lines:
			127.0.0.1       localhost
			::1             localhost
		+ Uninstall current sshd
			# Remove sshd service
			cygrunsrv --stop sshd
			cygrunsrv --remove sshd
			# Delete any sshd or related users (such as cyg_server) from /etc/passwd
			#   (use your favorite editor)
			# Delete any sshd or relaged users (such as cyg_server) from the system
			net user sshd /delete
			net user cyg_server /delete
		+ Re-install sshd (as step 3.)
		