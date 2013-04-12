package hattie::Form::Field::AddRemListbox;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Select';

has 'list_label' => ( is => 'ro' );
has 'to_add_label' => ( is => 'ro' );
has 'value_field' => ( is => 'ro' );
has '+multiple' => ( default => 1 );
has '+widget_name_space' => ( default => sub { ['hattie::Widget::Field'] } );
has '+widget' => ( default => 'AddRemListbox' );

#has_field 'list' => ( type => 'Select', multiple => 1, build_label_method => \&lbl_list);
#has_field 'remove' => ( do_label => 0, value => 'Remove', type => 'Button' );
#has_field 'to_add' => ( type => 'Text', build_label_method => \&lbl_to_add );
#has_field 'add' => ( do_label => 0, value => 'Add', type => 'Button' );

#sub lbl_list
#{
#    my $self = shift;
#    return $self->parent->list_label();
#}
#sub lbl_to_add
#{
#    my $self = shift;
#    return $self->parent->to_add_label();
#}

#sub build_update_subfields
#{
#    my $self = shift;
#    if (defined($self->value_field)) {
#        return { list => {full_accessor => $self->value_field}};
#    } else {
#        return {};
#    }
#}

__PACKAGE__->meta->make_immutable;

no HTML::FormHandler::Moose;

1;

