#!/usr/bin/env perl
# $File: //member/autrijus/.vimrc $ $Author: autrijus $
# $Revision: #14 $ $Change: 4137 $ $DateTime: 2003/02/08 11:41:59 $

require 5.001;
use inc::Module::Install;

WriteMakefile(
    NAME	=> 'Acme::emcA',
    VERSION	=> '0.01',
);

WriteMakefile (
    AUTHOR		=> 'Autrijus Tang (autrijus@autrijus.org)',
    ABSTRACT		=> 'Acme::emcA',
    NAME		=> 'Acme::emcA',
    VERSION_FROM	=> 'lib/Acme/emcA.pm',
    DISTNAME		=> 'Acme-emcA',

    dist		=> {
        COMPRESS	=> 'gzip -9',
        SUFFIX		=> '.gz',
    },
);

1;
