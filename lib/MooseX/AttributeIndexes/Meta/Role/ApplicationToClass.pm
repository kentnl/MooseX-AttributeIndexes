use strict;
use warnings;

package MooseX::AttributeIndexes::Meta::Role::ApplicationToClass;
BEGIN {
  $MooseX::AttributeIndexes::Meta::Role::ApplicationToClass::AUTHORITY = 'cpan:KENTNL';
}
{
  $MooseX::AttributeIndexes::Meta::Role::ApplicationToClass::VERSION = '1.0.2';
}
use Moose::Role;

around apply => sub {
  my $orig = shift;
  my $self = shift;
  my ( $role, $class ) = @_;

  Moose::Util::MetaRole::apply_base_class_roles(
    for   => $class->name,
    roles => [ 'MooseX::AttributeIndexes::Provider', 'MooseX::AttributeIndexes::Provider::FromAttributes', ],
  );

  $self->$orig( $role, $class );
};

no Moose::Role;

1;

__END__
=pod

=head1 NAME

MooseX::AttributeIndexes::Meta::Role::ApplicationToClass

=head1 VERSION

version 1.0.2

=head1 AUTHORS

=over 4

=item *

Kent Fredric <kentnl@cpan.org>

=item *

Jesse Luehrs <doy@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

