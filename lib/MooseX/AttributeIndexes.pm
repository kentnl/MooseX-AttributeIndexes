use strict;
use warnings;

package MooseX::AttributeIndexes;
our $VERSION = '0.01000613';


# ABSTRACT: Advertise metadata about your Model-Representing Classes to Any Database tool.
use Moose ();

use Moose::Exporter;
use Moose::Util::MetaRole;
use MooseX::AttributeIndexes::Provider;
use MooseX::AttributeIndexes::Provider::FromAttributes;
use MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed;



Moose::Exporter->setup_import_methods();


sub init_meta {
  my ( $class, %options ) = @_;
  Moose->init_meta( for_class => $options{'for_class'} )
    unless $options{'for_class'}->can('meta');

  Moose::Util::MetaRole::apply_metaclass_roles(
    for_class                 => $options{'for_class'},
    attribute_metaclass_roles => ['MooseX::AttributeIndexes::Meta::Attribute::Trait::Indexed'],
  );
  Moose::Util::MetaRole::apply_base_class_roles(
    for_class => $options{'for_class'},
    roles     => [ 'MooseX::AttributeIndexes::Provider', 'MooseX::AttributeIndexes::Provider::FromAttributes', ],
  );
}

1;


__END__

=pod

=head1 NAME

MooseX::AttributeIndexes - Advertise metadata about your Model-Representing Classes to Any Database tool.

=head1 VERSION

version 0.01000613

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



=head3 SEE ALSO

L<Search::GIN::Extract::AttributeIndexes>



=head1 METHODS

=head2 init_meta

Injects the traits for Indexed as default traits on all new attributes,
and glues the 2 magical roles into your package.



=head1 AUTHOR

  Kent Fredric <kentnl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 


