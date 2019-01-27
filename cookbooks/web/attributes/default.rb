default['phpenv']['root_path'] = '/usr/local/phpenv'
default['phpenv']['packages'] = %w(
  httpd-devel
  bzip2-devel
  libc-client-devel
  curl-devel
  freetype-devel
  gmp-devel
  libjpeg-devel
  libpng-devel
  libXpm-devel
  krb5-devel
  openssl-devel
  t1lib-devel
  libmcrypt-devel
  mhash-devel
  readline-devel
  libxml2-devel
  libtidy-devel
  libxslt-devel
  pcre-devel
  sqlite-devel
  postgresql-libs
  libicu-devel
  re2c
  git
)

default['phpenv']['phps'] = ['7.3.1']
default['phpenv']['global'] = '7.3.1'
default['phpenv']['mod_php'] = '7.3.1'

default[:fqdn] = 'web.sandbox.test'
default['web']['document_root'] = '/var/www/roundcube'
default['web']['server_name'] = default[:fqdn]
default['web']['max_client'] = 100

default['roundcube']['install_dir'] = '/var/www'
