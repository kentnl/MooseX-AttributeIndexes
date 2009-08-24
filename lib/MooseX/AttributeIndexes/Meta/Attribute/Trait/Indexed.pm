package MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed;

# $Id:$
use strict;
use warnings;
use Moose::Role;
use Moose::Meta::Attribute::Custom::Trait::Indexed;
use MooseX::Types::Moose qw(:all);
use namespace::autoclean;

has 'indexed' => (
  is       => 'ro',
  isa      => Bool,
  required => 1,
  default  => 0,
);

has 'primary_index' => (
  is       => 'ro',
  isa      => Bool,
  required => 1,
  default  => 0,
);

1;

