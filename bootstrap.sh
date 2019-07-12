#!/usr/bin/env bash

function install {
  echo installing $1
  shift
  apt-get -y install "$@" >/dev/null 2>&1
}

export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo -E apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo updating package information
apt-get -y update >/dev/null 2>&1

install Ruby ruby-full
install 'development-tools' build-essential autoconf libtool

echo installing current Ruby gems
gem update --system -N >/dev/null 2>&1

echo installing Bundler
gem install bundler -N >/dev/null 2>&1

install Git git
install SQLite sqlite3 libsqlite3-dev

install PostgreSQL postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser --superuser vagrant
# sudo -u postgres createdb -O vagrant -E UTF8 -T template0 activerecord_unittest
# sudo -u postgres createdb -O vagrant -E UTF8 -T template0 activerecord_unittest2


install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev zlib1g-dev
install 'ExecJS Runtime' nodejs

echo Installing Rails
gem install rails

echo 'Ready for Ruby development.'
