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

sub create :Local :Args(0) {
    my ( $self, $c ) = @_;
    
    $DB::single = 1;
    my $doc = $c->model->newDB('test')->newDoc('bar')->create;

    my $id = $doc->{id};
    
    $c->response->redirect($c->uri_for_action($self->action_for('edit'), [$id]),302);
}

sub pr :PathPrefix Chained('/') CaptureArgs(1) {
    my ( $self, $c, $id ) = @_;

    my $pr = $c->model->newDB('test')->newDoc($id)->retrieve;
    $c->stash->{pr} = $pr->data;

}

sub view :Chained('pr') PathPart() Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched hattie::Controller::ProcessingRequest::view in ProcessingRequest.');
}

sub edit :Chained('pr') PathPart() Args(0) {
    my ( $self, $c ) = @_;
    my $pr = $c->stash->{pr};
    my $form = hattie::Form::ProcessingRequestEdit->new;
    $c->stash(
              form => $form,
              template => 'processingrequest/ProcessingRequestEdit.tt');
    return unless $form->process(posted => ($c->req->method eq 'POST'), item => $pr, params => $c->req->params);
    $c->log->debug('*** edit processed ***');

    $c->response->redirect( $self->uri_for_action($self->action_for('index') ), 302 );
}

sub debugdump :Chained('pr') Args(0) {
    my ( $self, $c ) = @_;

    my $pr = undef;
    $c->response->body('Matched hattie::Controller::ProcessingRequest::debugdump in ProcessingRequest.');
}

=head1 AUTHOR

Martin Pollard

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
