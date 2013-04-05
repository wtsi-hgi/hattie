package hattie::Form::Field::AddRemListbox;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Compound';

has 'list_label' => ( is => 'rw' );
has 'to_add_label' => ( is => 'rw' );

has_field 'list' => ( type => 'Select', multiple => 1, build_label_method => \&lbl_list );
has_field 'remove' => ( do_label => 0, value => 'Remove', type => 'Button' );
has_field 'to_add' => ( type => 'Text', build_label_method => \&lbl_to_add );
has_field 'add' => ( do_label => 0, value => 'Add', type => 'Button' );

sub lbl_list
{
    my $self = shift;
    return $self->parent->list_label();
}
sub lbl_to_add
{
    my $self = shift;
    return $self->parent->to_add_label();
}

__PACKAGE__->meta->make_immutable;

no HTML::FormHandler::Moose;

1;

