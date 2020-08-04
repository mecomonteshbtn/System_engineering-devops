# Puppet to set changes in a server
file_line { 'disable password login':
  path => '/etc/ssh/ssh_config',
  line => 'PasswordAuthentication no',
}
file_line { 'add path to find the keys':
  path => '/etc/ssh/ssh_config',
  line => 'IdentityFile ~/.ssh/holberton',
}
