use strict;
use warnings;
package MooseX::AttributeIndexes::Provider::FromAttributes;

# ABSTRACT: A Glue-on-role that provides attribute_indexes data to a class via harvesting attribute traits

# $Id:$
use Moose::Role;
use namespace::autoclean;

=head1 METHODS

=head2 attribute_indexes

A very trivial scanner, which looks for the

C<indexed> and C<primary_index> keys and returns a hashref of

key->value pairs ( circumventing the getter )

=cut

sub attribute_indexes {

  my $self = shift;
  my $meta = $self->meta();

  my $k = {};

  my $map = $meta->get_attribute_map;
  for my $attr_name ( keys %{ $map } ){
    my $attr = $map->{$attr_name};

    if( $attr->does( 'MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed' ) ) {
      if( $attr->indexed || $attr->primary_index ){
        $k->{$attr_name} = $attr->get_value($self);
      }
    }
  }
  return $k;
}
1;

