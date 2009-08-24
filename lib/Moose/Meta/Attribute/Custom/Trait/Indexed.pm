use strict;
use warnings;
package Moose::Meta::Attribute::Custom::Trait::Indexed;
our $VERSION = '0.01000300';


# ABSTRACT: Registration Node for the Indexed Trait.
#
# $Id:$


sub register_implementation {
  'MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed';
}

1;


__END__

=pod

=head1 NAME

Moose::Meta::Attribute::Custom::Trait::Indexed - Registration Node for the Indexed Trait.

=head1 VERSION

version 0.01000300

=head1 METHODS

=head2 register_implementation

Associates the Indexed trait with MX::AI



=head1 AUTHOR

  Kent Fredric <kentnl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 


