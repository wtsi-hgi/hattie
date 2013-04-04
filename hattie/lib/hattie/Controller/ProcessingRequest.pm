package hattie::Controller::ProcessingRequest;
use Moose;
use hattie::Form::ProcessingRequestEdit;
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
    my $pr = undef;
    my $form = hattie::Form::ProcessingRequestEdit->new;
    $c->stash(
              form => $form,
              template => 'processingrequest/ProcessingRequestEdit.tt');
    return unless $form->process(posted => ($c->req->method eq 'POST'), item => $pr, params => $c->req->params);
}

=head1 AUTHOR

Martin Pollard

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
