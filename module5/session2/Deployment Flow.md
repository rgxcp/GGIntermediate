# A. Program to Deploy

## Compiled Programming Language (Java, etc.)

- Compile program using compiler.

## Interpreted Programming Language (Ruby, etc.)

- Bundle program into `tar.gz` file.

  ```bash
  [GGIntermediate] $ cd module4/session3
  [GGIntermediate/module4/session3] $ tar --exclude=spec --exclude=.rspec -czvf ../../module5/session2/bundle.tar.gz .
  ```

# B. Deployment Target

1. Init Vagrantfile.

   ```bash
   [GGIntermediate] $ cd module5/session2
   [GGIntermediate/module5/session2] $ vagrant init ubuntu/focal64
   ```

2. Configure Vagrant VM private network.

   ```ruby
   # Vagrantfile
   Vagrant.configure("2") do |config|
     config.vm.network "private_network", ip: "192.168.20.21"
   end
   ```

3. Start Vagrant VM.

   ```bash
   [GGIntermediate/module5/session2] $ vagrant up
   ```

4. SSH into Vagrant VM.

   ```bash
   [GGIntermediate/module5/session2] $ vagrant ssh
   ```

5. Copy `bundle.tar.gz` file from host machine into Vagrant VM.

   ```bash
   [GGIntermediate/module5/session2] $ scp -i .vagrant/machines/default/virtualbox/private_key bundle.tar.gz vagrant@192.168.20.21:/home/vagrant/app
   ```

6. Start Ansible Playbook.

   ```bash
   [GGIntermediate/module5/session2] $ ansible-playbook --inventory inventory.yml --user vagrant --private-key .vagrant/machines/default/virtualbox/private_key playbook.yml
   ```

# Tips

- Cheatsheet (TL;DR) of a program.

  ```bash
  $ curl cheat.sh/program-name
  ```
