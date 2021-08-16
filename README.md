# Ruby - Generasi GIGIH Intermediate Level Homeworks

## Status

LEARNING

## Requirement(s)

1. Ruby
2. MySQL/MariaDB
3. Ansible
4. Vagrant
5. VirtualBox

## Gem(s)

1. mysql2
2. rspec
3. simplecov
4. sinatra
5. sinatra-contrib
6. thin
7. travis

## Vagrant Box(es)

1. ubuntu/focal64

## How to Use

1. Clone this repository to your desired location.
   ```bash
   $ git clone https://github.com/rgxcp/GGIntermediate.git
   ```
2. Change your directory into project.
   ```bash
   $ cd GGIntermediate
   ```
3. Run the script.
   ```bash
   $ ruby /path/to/file.rb
   ```
4. Do-what-you-want-with-it!

## Guides

### [Module #1](https://github.com/rgxcp/GGIntermediate/tree/master/module1)

#### [Session #1](https://github.com/rgxcp/GGIntermediate/tree/master/module1/session1)

```bash
$ ruby module1/session1/app.rb
```

#### [Session #2](https://github.com/rgxcp/GGIntermediate/tree/master/module1/session2)

```bash
$ ruby module1/session2/app.rb
```

#### [Session #3 (No Homework)](https://github.com/rgxcp/GGIntermediate/tree/master/module1/session3)

### [Module #2](https://github.com/rgxcp/GGIntermediate/tree/master/module2)

#### [Session #1 (No Homework)](https://github.com/rgxcp/GGIntermediate/tree/master/module2/session1)

#### [Session #2 (No Homework)](https://github.com/rgxcp/GGIntermediate/tree/master/module2/session2)

#### [Session #3](https://github.com/rgxcp/GGIntermediate/tree/master/module2/session3)

### [Module #3](https://github.com/rgxcp/GGIntermediate/tree/master/module3)

#### [Session #1](https://github.com/rgxcp/GGIntermediate/tree/master/module3/session1)

```bash
$ ruby module3/session1/router.rb
```

#### [Session #2 (No Homework)](https://github.com/rgxcp/GGIntermediate/tree/master/module3/session2)

#### [Session #3](https://github.com/rgxcp/GGIntermediate/tree/master/module3/session3)

```bash
$ cd module3/session3
$ rackup -p 4567
```

### [Module #4](https://github.com/rgxcp/GGIntermediate/tree/master/module4)

#### [Session #1 (No Homework)](https://github.com/rgxcp/GGIntermediate/tree/master/module4/session1)

#### [Session #2 (No Homework)](https://github.com/rgxcp/GGIntermediate/tree/master/module4/session2)

#### [Session #3](https://github.com/rgxcp/GGIntermediate/tree/master/module4/session3)

```bash
$ cd module4/session3
$ rspec -fd spec/controllers/categories_controller_spec.rb
$ rspec -fd spec/controllers/category_items_controller_spec.rb
$ rspec -fd spec/controllers/items_controller_spec.rb
$ rspec -fd spec/models/category_spec.rb
$ rspec -fd spec/models/item_spec.rb
```

### [Module #5](https://github.com/rgxcp/GGIntermediate/tree/master/module5)

#### [Session #1 (No Homework)](https://github.com/rgxcp/GGIntermediate/tree/master/module5/session1)

#### [Session #2](https://github.com/rgxcp/GGIntermediate/tree/master/module5/session2)

```bash
$ cd module5/session2
$ vagrant init ubuntu/focal64
```

```ruby
# Vagrantfile
Vagrant.configure("2") do |config|
   config.vm.network "private_network", ip: "192.168.20.21"
end
```

```bash
$ vagrant up
$ vagrant ssh
$ scp -i .vagrant/machines/default/virtualbox/private_key bundle.tar.gz vagrant@192.168.20.21:/home/vagrant/app
$ ansible-playbook --inventory inventory.yml --user vagrant --private-key .vagrant/machines/default/virtualbox/private_key playbook.yml
```

#### [Session #3 (No Homework)](https://github.com/rgxcp/GGIntermediate/tree/master/module5/session3)

### [Module #6](https://github.com/rgxcp/GGIntermediate/tree/master/module6)

#### [Session #1 (No Homework)](https://github.com/rgxcp/GGIntermediate/tree/master/module6/session1)

#### [Session #2](https://github.com/rgxcp/GGIntermediate/tree/master/module6/session2)

```bash
$ ruby module6/session2/<?>.rb
```

#### [Session #3](https://github.com/rgxcp/GGIntermediate/tree/master/module6/session3)

```bash
$ ruby module6/session3/<?>.rb
```

### [Module #7](https://github.com/rgxcp/GGIntermediate/tree/master/module7)

#### [Session #1](https://github.com/rgxcp/GGIntermediate/tree/master/module7/session1)

```bash
$ ruby module7/session1/<?>.rb
```

#### [Session #2](https://github.com/rgxcp/GGIntermediate/tree/master/module7/session2)

```bash
$ ruby module7/session2/<?>.rb
```

#### [Session #3](https://github.com/rgxcp/GGIntermediate/tree/master/module7/session3)

```bash
$ ruby module7/session3/<?>.rb
```

### [Module #8](https://github.com/rgxcp/GGIntermediate/tree/master/module8)

#### [Session #1](https://github.com/rgxcp/GGIntermediate/tree/master/module8/session1)

```bash
$ ruby module8/session1/<?>.rb
```

#### [Session #2](https://github.com/rgxcp/GGIntermediate/tree/master/module8/session2)

```bash
$ ruby module8/session2/<?>.rb
```

#### [Session #3](https://github.com/rgxcp/GGIntermediate/tree/master/module8/session3)

```bash
$ ruby module8/session3/<?>.rb
```
