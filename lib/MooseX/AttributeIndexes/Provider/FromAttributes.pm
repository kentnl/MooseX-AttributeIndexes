use 5.006;    # our, pragma
use strict;
use warnings;

package MooseX::AttributeIndexes::Provider::FromAttributes;

our $VERSION = '2.000000';

# ABSTRACT: A Glue-on-role that provides attribute_indexes data to a class via harvesting attribute traits

# AUTHORITY

use Moose::Role;
use Scalar::Util qw( blessed reftype );
use namespace::autoclean;

=head1 METHODS

=head2 C<attribute_indexes>

A very trivial scanner, which looks for the

C<indexed> and C<primary_index> keys and returns a hashref of

key->value pairs ( circumventing the getter )

=cut

sub attribute_indexes {

  my $self = shift;
  my $meta = $self->meta();

  my $k = {};

  for my $attr_name ( $meta->get_attribute_list ) {
    my $attr = $meta->get_attribute($attr_name);

    if ( $attr->does('MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed') ) {
      my $indexed = $attr->primary_index;
      $indexed ||= $attr->indexed;
      my $result;
      if ($indexed) {
        $result = $attr->get_value($self);
      }
      if (  not blessed($indexed)
        and defined reftype($indexed)
        and reftype($indexed) eq 'CODE' )
      {
        local $_ = $result;
        $result = $attr->$indexed( $self, $result );
      }
      if ($result) {
        $k->{$attr_name} = $result;
      }
    }
  }
  return $k;
}

no Moose::Role;

1;

