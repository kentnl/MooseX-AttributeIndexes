use strict;
use warnings;

package MooseX::AttributeIndexes::Provider;

our $VERSION = '2.000000';

# ABSTRACT: A role that advertises an object is capable of providing metadata.

# $Id:$
use Moose::Role;
use namespace::autoclean;

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

=cut

=head1 REQUIRES

=head2 C<attribute_indexes>

A sub that returns a hashref of index-name=>index-value entries
for the given object

=cut

requires 'attribute_indexes';

1;

