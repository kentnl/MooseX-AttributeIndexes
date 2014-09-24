use strict;
use warnings;

package MooseX::AttributeIndexes::Meta::Role::Composite;

our $VERSION = '2.000000';

use Moose::Role;

around apply_params => sub {
  my $orig = shift;
  my $self = shift;

  $self->$orig(@_);

  $self = Moose::Util::MetaRole::apply_metaroles(
    for            => $self,
    role_metaroles => {
      application_to_class => ['MooseX::AttributeIndexes::Meta::Role::ApplicationToClass'],
      application_to_role  => ['MooseX::AttributeIndexes::Meta::Role::ApplicationToRole'],
    },
  );

  return $self;
};

no Moose::Role;

1;
