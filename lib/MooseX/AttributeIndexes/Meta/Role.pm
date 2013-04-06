use strict;
use warnings;

package MooseX::AttributeIndexes::Meta::Role;
BEGIN {
  $MooseX::AttributeIndexes::Meta::Role::AUTHORITY = 'cpan:KENTNL';
}
{
  $MooseX::AttributeIndexes::Meta::Role::VERSION = '1.0.2';
}

# ABSTRACT: MetaRole for AttributeIndexes.

use Moose::Role;


sub composition_class_roles {
  'MooseX::AttributeIndexes::Meta::Role::Composite';
}

no Moose::Role;

1;

__END__
=pod

=head1 NAME

MooseX::AttributeIndexes::Meta::Role - MetaRole for AttributeIndexes.

=head1 VERSION

version 1.0.2

=head1 METHODS

=head2 C<composition_class_roles>

returns C<MooseX::AttributeIndexes::Meta::Role::Composite>

=head1 AUTHORS

=over 4

=item *

Kent Fredric <kentnl@cpan.org>

=item *

Jesse Luehrs <doy@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

