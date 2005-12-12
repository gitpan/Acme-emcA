#!/usr/bin/perl

use inc::Module::Install;

name        'Acme-emcA';
all_from    'lib/Acme/emcA.pm';

sign; WriteAll;
