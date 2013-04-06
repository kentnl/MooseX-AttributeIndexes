use strict;
use warnings;

package MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed;
BEGIN {
  $MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed::AUTHORITY = 'cpan:KENTNL';
}
{
  $MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed::VERSION = '1.0.3';
}

# ABSTRACT: A Trait for attributes which permits various indexing tunables

use Moose::Role;
use Moose::Meta::Attribute::Custom::Trait::Indexed;
use MooseX::Types::Moose 0.19 qw(:all);
use namespace::autoclean 0.08;


has 'indexed' => (
  is       => 'ro',
  isa      => Bool | CodeRef,
  required => 1,
  default  => 0,
);


has 'primary_index' => (
  is       => 'ro',
  isa      => Bool | CodeRef,
  required => 1,
  default  => 0,
);

1;

__END__

=pod

=head1 NAME

MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed - A Trait for attributes which permits various indexing tunables

=head1 VERSION

version 1.0.3

=head1 ATTRIBUTES

=head2 C<indexed>

Bool. 0 = This attribute is not/cannot indexed, 1 = This Attribute is/can-be indexed.

CodeRef.  sub{ my( $attribute_meta, $object, $attribute_value ) = @_;  .... return }

=head2 C<primary_index>

Bool. 0 = This attribute is not a primary index, 1 = This Attribute is a primary index.

CodeRef.  sub{ my( $attribute_meta, $object, $attribute_value ) = @_;  .... return }

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
