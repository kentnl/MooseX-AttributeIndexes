use strict;
use warnings;

package AttributeIndexes;

# ABSTRACT: Advertise metadata about your Model-Representing Classes to Any Database tool.

use Moose::Exporter;
use Moose::Util::MetaRole;
use MooseX::AttributeIndexes::Provider;
use MooseX::AttributeIndexes::Provider::FromAttributes;
use MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed;

use namespace::autoclean;

=head1 SYNOPSIS

=head2 Implementing Indexes

  package My::Package;
  use Moose;
  use MooseX::AttributeIndexes;
  use MooseX::Types::Moose qw( :all );

  has 'id' => (
    isa => Str,
    is  => 'rw',
    primary_index => 1,
  );

  has 'name' => (
    isa => Str,
    is  => 'rw',
    indexed => 1,
  );

  has 'foo' => (
    isa => Str,
    is  => 'rw',
  );

=head2 Accessing Indexed Data

  package TestScript;

  use My::Package;

  my $foo = My::Package->new(
    id => "Bob",
    name => "Smith",
    foo  => "Bar",
  );

  $foo->attribute_indexes
  # { id => 'Bob', name => 'Smith' }

=head2 Using With Search::GIN::Extract::Callback

  Search::GIN::Extract::Callback(
    extract => sub {
      my ( $obj, $callback, $args ) = @_;
      if( $obj->does( 'MooseX::AttributeIndexes::Provider') ){
        return $obj->attribute_indexes;
      }
    }
  );

=cut

Moose::Exporter->setup_import_methods;

sub init_meta {
  my ( $class, %options ) = @_;
  Moose::Util::MetaRole::apply_metaclass_roles (
    for_class => $options{'for_class'},
    attribute_metaclass_roles => [qw( Indexed )],
  );
  Moose::Util::MetaRole::apply_base_class_roles (
    for_class => $options{'for_class'},
    roles => [
      'MooseX::AttributeIndexes::Provider',
      'MooseX::AttributeIndexes::Provider::FromAttributes',
    ],
  )
}


1;

