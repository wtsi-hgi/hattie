package hattie::Form::Field::AddRemListbox;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Compound';

has_field 'study_list' => ( label => 'Sequencescape Study Name', type => 'Select', multiple => 1 );
has_field 'study_remove' => ( label => '', value => 'Remove', type => 'Button' );
has_field 'study_to_add' => ( label => 'Study to add', type => 'Text' );
has_field 'study_add' => ( label => '', value => 'Add', type => 'Button' );

__PACKAGE__->meta->make_immutable;

no HTML::FormHandler::Moose;

1;

