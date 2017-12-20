## Setup Cloudera VM quickstart

   * Download Cloudera VM
   ```bash
   curl -O https://downloads.cloudera.com/demo_vm/virtualbox/cloudera-quickstart-vm-5.12.0-0-virtualbox.zip
   unzip cloudera-quickstart-vm-5.12.0-0-virtualbox
   ```

   * Install VirtualBox and import the VM

   * Open VM via VirtualBox

   * Setup openssh-server inside VM & shut VM down
   ```bash
   yum install openssh-server
   shutdown -h now
   ```

   * Forward SSH port (22) from VM to local machine (only need with NAT network)
   ```
   # 1. List virtual machines
   VBoxManage list vms #"cloudera-quickstart-vm-5.12" {e4b0c92c-4301-4a7d-8af8-fe02fed00451}

   # 2. Rename the VM
   VBoxManage modifyvm cloudera-quickstart-vm-5.12 --name cloudera-5.12

   # 3. Forward port
   VBoxManage modifyvm cloudera-5.12 --natpf1 "ssh,tcp,,3022,,22"

   # 4. Start VM in headless mode
   VBoxManage startvm cloudera-5.12 --type headless

   # 5. Power off VM
   VBoxManage controlvm cloudera-5.12 poweroff
   ```

   * Access to the VM platform
     * SSH
     ```bash
     ssh -p 3022 cloudera@127.0.0.1
     ```
     * HUE
     ```
     http://localhost:8888/
     ```
