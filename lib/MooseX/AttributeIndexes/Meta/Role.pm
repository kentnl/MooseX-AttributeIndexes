package MooseX::AttributeIndexes::Meta::Role;
use Moose::Role;

sub composition_class_roles {
    'MooseX::AttributeIndexes::Meta::Role::Composite'
}

no Moose::Role;

1;
