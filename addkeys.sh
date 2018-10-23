ssh $1@$2 'mkdir .ssh'
cat ~/.ssh/id_rsa.pub | ssh $1@$2 'cat >> .ssh/authorized_keys'
