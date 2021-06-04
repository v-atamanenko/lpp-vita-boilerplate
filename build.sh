#!/usr/bin/env bash

vagrant up
vagrant ssh -- -t 'bash /vagrant/vagrant_scripts/build.sh;'
