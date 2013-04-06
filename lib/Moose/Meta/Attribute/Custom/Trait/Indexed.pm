use strict;
use warnings;

package Moose::Meta::Attribute::Custom::Trait::Indexed;
BEGIN {
  $Moose::Meta::Attribute::Custom::Trait::Indexed::AUTHORITY = 'cpan:KENTNL';
}
{
  $Moose::Meta::Attribute::Custom::Trait::Indexed::VERSION = '1.0.3';
}

# ABSTRACT: Registration Node for the Indexed Trait.


sub register_implementation {
  return 'MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed';
}

1;

__END__

=pod

=head1 NAME

Moose::Meta::Attribute::Custom::Trait::Indexed - Registration Node for the Indexed Trait.

=head1 VERSION

version 1.0.3

=head1 METHODS

=head2 C<register_implementation>

Associates the Indexed trait with MX::AI

=head1 AUTHORS

=over 4

=item *

Kent Fredric <kentnl@cpan.org>

=item *

Jesse Luehrs <doy@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
