package hattie::Form::Field::ListOrFile;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Compound';

has_field 'target_list' => ( label => 'Please select either existing target file', type => 'Select' );
has_field 'target_file' => ( label => 'or upload a target file', type => 'Upload' );

__PACKAGE__->meta->make_immutable;

no HTML::FormHandler::Moose;

1;

