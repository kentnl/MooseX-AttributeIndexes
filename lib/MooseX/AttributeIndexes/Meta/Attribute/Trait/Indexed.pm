use strict;
use warnings;
package MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed;
our $VERSION = '0.01000404';


# ABSTRACT: A Trait for attributes which permits various indexing tunables

# $Id:$
use Moose::Role;
use Moose::Meta::Attribute::Custom::Trait::Indexed;
use MooseX::Types::Moose qw(:all);
use namespace::autoclean;


has 'indexed' => (
  is       => 'ro',
  isa      => Bool,
  required => 1,
  default  => 0,
);


has 'primary_index' => (
  is       => 'ro',
  isa      => Bool,
  required => 1,
  default  => 0,
);

1;


__END__

=pod

=head1 NAME

MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed - A Trait for attributes which permits various indexing tunables

=head1 VERSION

version 0.01000404

=head1 ATTRIBUTES

=head2 indexed

Bool. 0 = This attribute is not/cannot indexed, 1 = This Attribute is/can-be indexed.



=head2 primary_index

Bool. 0 = This attribute is not a primary index, 1 = This Attribute is a primary index.



=head1 AUTHOR

  Kent Fredric <kentnl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 


