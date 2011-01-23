
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'English' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.3601',
    'Test::Moose' => '0',
    'Test::More' => '0.92'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Advertise metadata about your Model-Representing Classes to Any Database tool.',
  'dist_author' => [
    'Kent Fredric <kentnl@cpan.org>'
  ],
  'dist_name' => 'MooseX-AttributeIndexes',
  'dist_version' => '1.0.0',
  'license' => 'perl',
  'module_name' => 'MooseX::AttributeIndexes',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Moose' => '0.94',
    'Moose::Exporter' => '0',
    'Moose::Role' => '0',
    'Moose::Util::MetaRole' => '0',
    'MooseX::Types::Moose' => '0.19',
    'Scalar::Util' => '0',
    'namespace::autoclean' => '0.08'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
