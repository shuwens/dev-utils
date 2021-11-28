# dev-utils


## Step 0
```
mkdir -p ~/git && cd ~/git && git clone https://github.com/jethrosun/dev-utils.git
# setup ssh key
mkdir -p ~/dev/pvn && cd ~/dev/pvn && git clone git@github.com:jethrosun/pvn-utils.git utils && git clone git@github.com:jethrosun/pvn-utils2.git utils2
```

## then

+ rust setup
+ dev-setup
+ make ssh key
+ auditbox
+ rs-registry-ng


## vagrant disk size
```
vagrant plugin install vagrant-disksize
```

```
vagrant.configure('2') do |config|
    config.vm.box = 'ubuntu/xenial64'
    config.disksize.size = '50GB'
end
```

## old
To setup Netbricks:
```
curl -s -L https://raw.githubusercontent.com/jethrosun/dev-utils/master/scripts/netbricks-setup.sh | bash
```

To setup Docker:
```
curl -s -L https://raw.githubusercontent.com/jethrosun/dev-utils/master/scripts/docker-setup.sh | bash
```

To setup nvim
```
curl -s -L https://raw.githubusercontent.com/jethrosun/dev-utils/master/scripts/dev-setup.sh | bash
```
