use strict;
use warnings;
package MooseX::AttributeIndexes::Provider;
our $VERSION = '0.01000613';


# ABSTRACT: A role that advertises an object is capable of providing metadata.

# $Id:$
use Moose::Role;
use namespace::autoclean;



requires 'attribute_indexes';

1;


__END__

=pod

=head1 NAME

MooseX::AttributeIndexes::Provider - A role that advertises an object is capable of providing metadata.

=head1 VERSION

version 0.01000613

=head1 SYNOPSIS

  use Moose;
  with 'MooseX::AttributeIndexes::Provider';

  sub attribute_indexes {
    return {
      foo => 'bar',
    };
  }

=head1 WARNING

This code is alpha, and its interface is prone to change.



=head1 REQUIRES

=head2 attribute_indexes

A sub that returns a hashref of index-name=>index-value entries
for the given object



=head1 AUTHOR

  Kent Fredric <kentnl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 


