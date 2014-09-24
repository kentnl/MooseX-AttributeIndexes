use 5.006;    # our, pragmas
use strict;
use warnings;

package Moose::Meta::Attribute::Custom::Trait::Indexed;

our $VERSION = '2.000000';

# ABSTRACT: Registration Node for the Indexed Trait.

# AUTHORITY

sub register_implementation {
  return 'MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed';
}

1;

=head1 METHODS

=head2 C<register_implementation>

Associates the Indexed trait with MX::AI

=cut
