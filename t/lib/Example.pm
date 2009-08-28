package Example;
our $VERSION = '0.01000613';


# $Id:$
use Moose;

use MooseX::AttributeIndexes;
use namespace::autoclean;
has 'foo_indexed' => (
  isa => 'Str',
  required => 1,
  is => 'rw',
  indexed => 1,
);

has 'foo_primary' => (
  isa => 'Str',
  required => 1,
  is => 'rw',
  primary_index => 1,
);

has 'foo_nothing' => (
  isa => 'Str',
  required => 1,
  is => 'rw',
);

1;

