package hattie::View::ProcessingRequest;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
);

=head1 NAME

hattie::View::ProcessingRequest - TT View for hattie

=head1 DESCRIPTION

TT View for hattie.

=head1 SEE ALSO

L<hattie>

=head1 AUTHOR

Martin Pollard

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;