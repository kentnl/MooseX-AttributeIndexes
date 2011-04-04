use strict;
use warnings;

package MooseX::AttributeIndexes::Meta::Role;

# ABSTRACT: MetaRole for AttributeIndexes.

use Moose::Role;

=method composition_class_roles

returns C<MooseX::AttributeIndexes::Meta::Role::Composite>

=cut

sub composition_class_roles {
    'MooseX::AttributeIndexes::Meta::Role::Composite'
}

no Moose::Role;

1;
