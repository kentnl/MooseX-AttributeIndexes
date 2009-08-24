use strict;
use warnings;
package MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed;

# ABSTRACT: A Trait for attributes which permits various indexing tunables

# $Id:$
use Moose::Role;
use Moose::Meta::Attribute::Custom::Trait::Indexed;
use MooseX::Types::Moose qw(:all);
use namespace::autoclean;

=head1 ATTRIBUTES

=head2 indexed

Bool. 0 = This attribute is not/cannot indexed, 1 = This Attribute is/can-be indexed.

=cut

has 'indexed' => (
  is       => 'ro',
  isa      => Bool,
  required => 1,
  default  => 0,
);

=head2 primary_index

Bool. 0 = This attribute is not a primary index, 1 = This Attribute is a primary index.

=cut

has 'primary_index' => (
  is       => 'ro',
  isa      => Bool,
  required => 1,
  default  => 0,
);

1;

