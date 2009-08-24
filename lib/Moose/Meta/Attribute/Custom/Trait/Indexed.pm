package Moose::Meta::Attribute::Custom::Trait::Indexed;

# $Id:$
use strict;
use warnings;

sub register_implementation {
  'MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed';
}

1;

