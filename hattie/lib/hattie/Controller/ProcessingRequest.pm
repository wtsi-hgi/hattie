package hattie::Controller::ProcessingRequest;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

hattie::Controller::ProcessingRequest - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched hattie::Controller::ProcessingRequest in ProcessingRequest.');
}

sub test :Local {
    my ( $self, $c ) = @_;
 
    $c->stash(
              template => 'processingrequest/ProcessingRequest.tt');
}

=head1 AUTHOR

Martin Pollard

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
