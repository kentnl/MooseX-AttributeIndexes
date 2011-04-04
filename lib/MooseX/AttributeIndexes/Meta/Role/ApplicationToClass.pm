use strict;
use warnings;

package MooseX::AttributeIndexes::Meta::Role::ApplicationToClass;
use Moose::Role;

around apply => sub {
    my $orig  = shift;
    my $self  = shift;
    my ($role, $class) = @_;

    Moose::Util::MetaRole::apply_base_class_roles(
        for   => $class->name,
        roles => [
            'MooseX::AttributeIndexes::Provider',
            'MooseX::AttributeIndexes::Provider::FromAttributes',
        ],
    );

    $self->$orig( $role, $class );
};

no Moose::Role;

1;
