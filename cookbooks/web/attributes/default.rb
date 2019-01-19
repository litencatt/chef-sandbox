default['phpenv']['root_path'] = '/usr/local/phpenv'
default['phpenv']['default_configure_options_cookbook'] = 'web'
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

default['phpenv']['phps'] = ['7.2.1']
default['phpenv']['global'] = '7.2.1'
default['phpenv']['mod_php'] = '7.2.1'