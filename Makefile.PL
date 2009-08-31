
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'MooseX-AttributeIndexes',
  NAME      => 'MooseX::AttributeIndexes',
  AUTHOR    => 'Kent\ Fredric\ \<kentnl\@cpan\.org\>',
  ABSTRACT  => 'Advertise\ metadata\ about\ your\ Model\-Representing\ Classes\ to\ Any\ Database\ tool\.',
  VERSION   => '0.01001007',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Test::More" => '0.92',
    "MooseX::Types::Moose" => '0.19',
    "Scalar::Util" => '1.21',
    "namespace::autoclean" => '0.08',
    "MooseX::Types" => '0.19',
    "Data::Dump" => '1.15',
    "Moose" => '0.89',
  },
);
