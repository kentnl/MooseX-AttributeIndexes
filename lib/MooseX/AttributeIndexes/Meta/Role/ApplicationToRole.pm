use 5.006;    # our, pragmas
use strict;
use warnings;

package MooseX::AttributeIndexes::Meta::Role::ApplicationToRole;

our $VERSION = '2.000001';

# ABSTRACT: Give a role indexable attributes

# AUTHORITY

use Moose::Role qw( around );

around apply => sub {
  my $orig = shift;
  my $self = shift;
  my ( $consumee, $consumer ) = @_;

  # applying $consumee to $consumer, $consumee has AttributeIndexes.
  # -> $consumer inherits indexable attributes.
  $consumer = Moose::Util::MetaRole::apply_metaroles(
    for            => $consumer,
    role_metaroles => {
      application_to_class => [ 'MooseX::AttributeIndexes::Meta::Role::ApplicationToClass', ],
      application_to_role  => [ 'MooseX::AttributeIndexes::Meta::Role::ApplicationToRole', ],
    },
  );

  $self->$orig( $consumee, $consumer );
};

no Moose::Role;

1;
