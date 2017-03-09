use 5.006;    # our, pragma
use strict;
use warnings;

package MooseX::AttributeIndexes::Provider;

our $VERSION = '2.000002';

# ABSTRACT: A role that advertises an object is capable of providing metadata.

# AUTHORITY

use Moose::Role qw( requires );
use namespace::clean -except => 'meta';

requires 'attribute_indexes';

no Moose::Role;

1;

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

=head2 C<attribute_indexes>

A sub that returns a hashref of index-name=>index-value entries
for the given object

=cut
