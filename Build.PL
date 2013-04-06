
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.4004"
  },
  "configure_requires" => {
    "Module::Build" => "0.4004"
  },
  "dist_abstract" => "Advertise metadata about your Model-Representing Classes to Any Database tool.",
  "dist_author" => [
    "Kent Fredric <kentnl\@cpan.org>",
    "Jesse Luehrs <doy\@cpan.org>"
  ],
  "dist_name" => "MooseX-AttributeIndexes",
  "dist_version" => "1.0.3",
  "license" => "perl",
  "module_name" => "MooseX::AttributeIndexes",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Moose" => "0.94",
    "Moose::Exporter" => 0,
    "Moose::Role" => 0,
    "Moose::Util::MetaRole" => 0,
    "MooseX::Types::Moose" => "0.19",
    "Scalar::Util" => 0,
    "namespace::autoclean" => "0.08",
    "perl" => "v5.10.0",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Test::Moose" => 0,
    "Test::More" => "0.98"
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
