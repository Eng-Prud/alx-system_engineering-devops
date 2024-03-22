# Puppet manifest to install Flask version 2.1.0 using pip3

# Install a specific version of flask (2.1.0)
package {'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
}
