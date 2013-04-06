#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

{

  package Foo::Role;
  use Moose::Role;
  use MooseX::AttributeIndexes;

  has bar => (
    ( Moose->VERSION < 1.9900 ? ( traits => ['Indexed'] ) : () ),
    is      => 'ro',
    isa     => 'Str',
    indexed => 1,
  );
}

{

  package Foo;
  use Moose;

  with 'Foo::Role';
}

{

  package Bar::Role;
  use Moose::Role;

  with 'Foo::Role';
}

{

  package Bar;
  use Moose;

  with 'Bar::Role';
}

{

  package Empty::Role;
  use Moose::Role;
}

{

  package Baz;
  use Moose;

  with 'Foo::Role', 'Empty::Role';
}

is_deeply( Foo->new( bar => "BAR" )->attribute_indexes, { bar => "BAR" }, "application to class works" );
is_deeply( Bar->new( bar => "BAR" )->attribute_indexes, { bar => "BAR" }, "application to role works" );
is_deeply( Baz->new( bar => "BAR" )->attribute_indexes, { bar => "BAR" }, "role composition works" );

done_testing;
