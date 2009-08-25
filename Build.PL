
use strict;
use warnings;

use Module::Build;

my $build = Module::Build->new(
  module_name   => 'MooseX::AttributeIndexes',
  license       => 'perl',
  dist_abstract => "Advertise\ metadata\ about\ your\ Model\-Representing\ Classes\ to\ Any\ Database\ tool\.",
  dist_name     => "MooseX\-AttributeIndexes",
  dist_author   => [
"Kent\ Fredric\ \<kentnl\@cpan\.org\>",
  ],
  requires      => {
    "Test::More" => '0.92',
    "MooseX::Types::Moose" => '0',
    "namespace::autoclean" => '0.08',
    "Data::Dump" => '0',
    "Moose" => '0.89',
  },
  script_files => [ qw() ],
);

$build->create_build_script;
