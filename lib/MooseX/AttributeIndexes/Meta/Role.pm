use 5.006;    # our, pragmas
use strict;
use warnings;

package MooseX::AttributeIndexes::Meta::Role;

our $VERSION = '2.000000';

# ABSTRACT: MetaRole for AttributeIndexes.

# AUTHORITY

use Moose::Role;

=method C<composition_class_roles>

returns C<MooseX::AttributeIndexes::Meta::Role::Composite>

=cut

sub composition_class_roles {
  'MooseX::AttributeIndexes::Meta::Role::Composite';
}

no Moose::Role;

1;
