use strict;
use warnings;
package MooseX::AttributeIndexes::Provider::FromAttributes;
BEGIN {
  $MooseX::AttributeIndexes::Provider::FromAttributes::VERSION = '1.0.0';
}

# ABSTRACT: A Glue-on-role that provides attribute_indexes data to a class via harvesting attribute traits

# $Id:$
use Moose::Role;
use Scalar::Util qw( blessed reftype );
use namespace::autoclean;


sub attribute_indexes {

  my $self = shift;
  my $meta = $self->meta();

  my $k = {};

  for my $attr_name ( $meta->get_attribute_list ){
    my $attr = $meta->get_attribute( $attr_name );

    if( $attr->does( 'MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed' ) ) {
      my $indexed = $attr->primary_index;
      $indexed ||= $attr->indexed;
      my $result;
      if( $indexed ){
        $result = $attr->get_value($self);
      }
      if( not blessed($indexed) and defined reftype( $indexed ) and reftype( $indexed ) eq 'CODE' ){
        local $_ = $result;
        $result = $attr->$indexed( $self, $result );
      }
      if ( $result ){
        $k->{$attr_name} = $result;
      }
    }
  }
  return $k;
}
1;


__END__
=pod

=head1 NAME

MooseX::AttributeIndexes::Provider::FromAttributes - A Glue-on-role that provides attribute_indexes data to a class via harvesting attribute traits

=head1 VERSION

version 1.0.0

=head1 METHODS

=head2 attribute_indexes

A very trivial scanner, which looks for the

C<indexed> and C<primary_index> keys and returns a hashref of

key->value pairs ( circumventing the getter )

=head1 AUTHOR

Kent Fredric <kentnl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

