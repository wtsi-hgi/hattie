package hattie::Form::Field::ListOrFile;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Compound';

has_field 'list' => ( type => 'Select', build_label_method => \&lbl_list );
has_field 'file' => ( type => 'Upload', build_label_method => \&lbl_file );

has 'list_label' => ( is => 'rw' );
has 'file_label' => ( is => 'rw' );

sub lbl_list
{
    my $self = shift;
    return $self->parent->list_label();
}
sub lbl_file
{
    my $self = shift;
    return $self->parent->file_label();
}

__PACKAGE__->meta->make_immutable;

no HTML::FormHandler::Moose;

1;

