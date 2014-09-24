use strict;
use warnings;

package MooseX::AttributeIndexes::Meta::Role;

our $VERSION = '2.000000';

# ABSTRACT: MetaRole for AttributeIndexes.

our $AUTHORITY = 'cpan:KENTNL'; # AUTHORITY

use Moose::Role;







sub composition_class_roles {
  'MooseX::AttributeIndexes::Meta::Role::Composite';
}

no Moose::Role;

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

MooseX::AttributeIndexes::Meta::Role - MetaRole for AttributeIndexes.

=head1 VERSION

version 2.000000

=head1 METHODS

=head2 C<composition_class_roles>

returns C<MooseX::AttributeIndexes::Meta::Role::Composite>

=head1 AUTHOR

Kent Fredric <kentnl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
