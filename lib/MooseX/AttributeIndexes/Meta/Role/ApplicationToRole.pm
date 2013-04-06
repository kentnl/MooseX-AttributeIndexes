use strict;
use warnings;

package MooseX::AttributeIndexes::Meta::Role::ApplicationToRole;
BEGIN {
  $MooseX::AttributeIndexes::Meta::Role::ApplicationToRole::AUTHORITY = 'cpan:KENTNL';
}
{
  $MooseX::AttributeIndexes::Meta::Role::ApplicationToRole::VERSION = '1.0.3';
}
use Moose::Role;

around apply => sub {
  my $orig = shift;
  my $self = shift;
  my ( $role1, $role2 ) = @_;

  $role2 = Moose::Util::MetaRole::apply_metaroles(
    for            => $role2,
    role_metaroles => {
      application_to_class => [ 'MooseX::AttributeIndexes::Meta::Role::ApplicationToClass', ],
      application_to_role  => [ 'MooseX::AttributeIndexes::Meta::Role::ApplicationToRole', ],
    }
  );

  $self->$orig( $role1, $role2 );
};

no Moose::Role;

1;

__END__

=pod

=head1 NAME

MooseX::AttributeIndexes::Meta::Role::ApplicationToRole

=head1 VERSION

version 1.0.3

=head1 AUTHORS

=over 4

=item *

Kent Fredric <kentnl@cpan.org>

=item *

Jesse Luehrs <doy@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
