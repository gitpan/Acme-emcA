#!/usr/bin/perl
# $File: //member/autrijus/Acme-ComeFrom/Makefile.PL $ $Author: autrijus $
# $Revision: #4 $ $Change: 8742 $ $DateTime: 2003/11/08 06:18:43 $

use inc::Module::Install;

name		('Acme-emcA');
author		('Autrijus Tang (autrijus@autrijus.org)');
abstract	('Acme::emcA');
version_from	('lib/Acme/emcA.pm');
license		('perl');
sign		(1);

&Meta->write;
&Makefile->write;
