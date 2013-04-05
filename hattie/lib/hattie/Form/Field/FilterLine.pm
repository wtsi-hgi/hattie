package hattie::Form::Field::FilterLine;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Compound';

has_field 'annotation' => ( type => 'Static', build_label_method => \&name_annot );
has_field 'min' => ( type => 'Float' );
has_field 'max' => ( type => 'Float' );

has 'annot_name' => ( is => 'rw' );

sub name_annot
{
    my $self = shift;
    return $self->parent->annot_name();
}

__PACKAGE__->meta->make_immutable;

no HTML::FormHandler::Moose;

1;

