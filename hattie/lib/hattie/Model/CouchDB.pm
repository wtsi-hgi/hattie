package hattie::Model::CouchDB;
use Moose;
use namespace::autoclean;

extends 'Catalyst::Model::CouchDB';

__PACKAGE__->config(
    uri => 'http://localhost:5984/',
);

=head1 NAME

hattie::Model::CouchDB - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.

=head1 AUTHOR

Martin Pollard

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
