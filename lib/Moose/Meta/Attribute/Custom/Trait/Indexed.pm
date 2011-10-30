use strict;
use warnings;

package Moose::Meta::Attribute::Custom::Trait::Indexed;

# ABSTRACT: Registration Node for the Indexed Trait.

=head1 METHODS

=head2 C<register_implementation>

Associates the Indexed trait with MX::AI

=cut

sub register_implementation {
  return 'MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed';
}

1;

