use strict;
use warnings;

package MooseX::AttributeIndexes::Meta::Role::Composite;
BEGIN {
  $MooseX::AttributeIndexes::Meta::Role::Composite::AUTHORITY = 'cpan:KENTNL';
}
{
  $MooseX::AttributeIndexes::Meta::Role::Composite::VERSION = '1.0.2';
}
use Moose::Role;

around apply_params => sub {
  my $orig = shift;
  my $self = shift;

  $self->$orig(@_);

  $self = Moose::Util::MetaRole::apply_metaroles(
    for            => $self,
    role_metaroles => {
      application_to_class => ['MooseX::AttributeIndexes::Meta::Role::ApplicationToClass'],
      application_to_role  => ['MooseX::AttributeIndexes::Meta::Role::ApplicationToRole'],
    },
  );

  return $self;
};

no Moose::Role;

1;

__END__
=pod

=head1 NAME

MooseX::AttributeIndexes::Meta::Role::Composite

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

