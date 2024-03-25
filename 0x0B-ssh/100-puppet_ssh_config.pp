# Set up client SSH configuration file so that to connect to a server without typing a password

file_line { 'Turn off passwd auth':
  path    => '/etc/ssh/ssh_config',
  line    => '^PasswordAuthentication\s+yes$',
  match   => '^PasswordAuthentication\s+yes$',
  replace => 'PasswordAuthentication no',
}

file_line { 'Declare identity file':
  path    => '/etc/ssh/ssh_config',
  line    => '^#?\s*IdentityFile\s+~/.ssh/school$',
  match   => '^#?\s*IdentityFile\s+~/.ssh/school$',
  replace => 'IdentityFile ~/.ssh/school',
}

