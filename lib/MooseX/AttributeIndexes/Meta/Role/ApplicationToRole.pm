use 5.006;    # our, pragmas
use strict;
use warnings;

package MooseX::AttributeIndexes::Meta::Role::ApplicationToRole;

our $VERSION = '2.000000';

# ABSTRACT: Give a role indexable attributes

# AUTHORITY

use Moose::Role qw( around );

around apply => sub {
  my $orig = shift;
  my $self = shift;
  my ( $role1, $role2 ) = @_;

  $role2 = Moose::Util::MetaRole::apply_metaroles(
    for            => $role2,
    role_metaroles => {
      application_to_class => [ 'MooseX::AttributeIndexes::Meta::Role::ApplicationToClass', ],
      application_to_role  => [ 'MooseX::AttributeIndexes::Meta::Role::ApplicationToRole', ],
    }
  );

  $self->$orig( $role1, $role2 );
};

no Moose::Role;

1;
