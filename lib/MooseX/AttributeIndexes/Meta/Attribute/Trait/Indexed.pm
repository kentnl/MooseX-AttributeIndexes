use strict;
use warnings;

package MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed;

our $VERSION = '2.000000';

# ABSTRACT: A Trait for attributes which permits various indexing tunables

# AUTHORITY

use Moose::Role;
use Moose::Meta::Attribute::Custom::Trait::Indexed;
use MooseX::Types::Moose 0.19 qw(:all);
use namespace::autoclean 0.08;

=head1 ATTRIBUTES

=head2 C<indexed>

Bool. 0 = This attribute is not/cannot indexed, 1 = This Attribute is/can-be indexed.

CodeRef.  sub{ my( $attribute_meta, $object, $attribute_value ) = @_;  .... return }

=cut

has 'indexed' => (
  is       => 'ro',
  isa      => Bool | CodeRef,
  required => 1,
  default  => 0,
);

=head2 C<primary_index>

Bool. 0 = This attribute is not a primary index, 1 = This Attribute is a primary index.

CodeRef.  sub{ my( $attribute_meta, $object, $attribute_value ) = @_;  .... return }

=cut

has 'primary_index' => (
  is       => 'ro',
  isa      => Bool | CodeRef,
  required => 1,
  default  => 0,
);

1;

