use 5.006;    #our, pragmas
use strict;
use warnings;

package MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed;

our $VERSION = '2.000000';

# ABSTRACT: A Trait for attributes which permits various indexing tunables

# AUTHORITY

use Moose::Role qw( has );
use Moose::Meta::Attribute::Custom::Trait::Indexed;
use MooseX::Types::Moose 0.19 qw( CodeRef Bool );
use namespace::clean -except => 'meta';

has 'primary_index' => (
  is       => 'ro',
  isa      => Bool | CodeRef,    ## no critic (Bangs::ProhibitBitwiseOperators)
  required => 1,
  default  => 0,
);

has 'indexed' => (
  is       => 'ro',
  isa      => Bool | CodeRef,    ## no critic (Bangs::ProhibitBitwiseOperators)
  required => 1,
  default  => 0,
);

no Moose::Role;

1;

=head1 ATTRIBUTES

=head2 C<indexed>

Bool. 0 = This attribute is not/cannot indexed, 1 = This Attribute is/can-be indexed.

CodeRef.  sub{ my( $attribute_meta, $object, $attribute_value ) = @_;  .... return }

=head2 C<primary_index>

Bool. 0 = This attribute is not a primary index, 1 = This Attribute is a primary index.

CodeRef.  sub{ my( $attribute_meta, $object, $attribute_value ) = @_;  .... return }

=cut
