# $File: //member/autrijus/Acme-emcA/lib/Acme/emcA.pm $ $Author: autrijus $
# $Revision: #2 $ $Change: 6926 $ $DateTime: 2003/07/11 00:49:54 $

package Acme::emcA;
use strict qw[vars subs];
use vars '$VERSION';

$VERSION = '0.03';

open 0 or print "Can't reverse '$0'\n" and exit;
(my $code = join "", <0>) =~ s/.*?^(\s*);?use\s+Acme::emcA\s*(?: esu)?;\n//sm;
my $max = 10 + length $1;
local $SIG{__WARN__} = \&is_forward;
do {eval forward($code); exit} if is_backward($code);
open 0, ">$0" or print "Cannot reverse '$0'\n" and exit;
$max = 10; $code = backward($code);
$code = (" " x ($max - 10)). ";use Acme::emcA esu;\n". (" " x ($max * 2))."\n" . $code;
print {0} $code . (join("\n", reverse split(/\n/, $code))), "\n" and exit;

sub forward  { join("\n", map substr($_, $max), (split "\n", substr($_[0], 0, length($_[0])/2))) }

sub is_forward  { $_[0] !~ /^ {20,}$/m }
sub is_backward { $_[0] =~ s/\n?.*$// if $_[0] =~ /^ {20,}$/m }

sub backward {
    @_ = split "\n", $_[0];
    length > $max && ( $max = length ) for @_;
    return join "\n", map sprintf( "%${max}s", scalar reverse $_ ) . $_, @_, '';
}

1;

__END__

=head1 NAME

Acme::emcA - Acme::emcA

=head1 SYNOPSIS

    use Acme::emcA;
    print "Hello, World";

=head1 DESCRIPTION

The first time you run a program under C<use Acme::emcA>, the module takes
your source file and makes an mirror image of it at both row- and column-
level.  The code continues to work exactly as it did before, but now it looks
like this:

		;use Acme::emcA esu;

    ;"!dlroW ,olleH" tnirpprint "Hello, World!";

    ;"!dlroW ,olleH" tnirpprint "Hello, World!";

		;use Acme::emcA esu;

=head1 DIAGNOSTICS

=over 4

=item C<Can't reverse "%s">

Acme::emcA could not access the source file to modify it.

=head1 SEE ALSO

L<Acme::Palindrome> - Code and documentation nearly taken verbatim.

=head1 AUTHOR

Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>

=head1 COPYRIGHT

Copyright 2003 by Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
