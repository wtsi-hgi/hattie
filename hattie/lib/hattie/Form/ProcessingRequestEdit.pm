package hattie::Form::ProcessingRequestEdit;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler';
use Moose::Util::TypeConstraints;
use namespace::autoclean;

has '+item_class' => ( default => 'ProcessingRequest' );
has '+field_name_space' => ( default => 'hattie::Form::Field' );
has '+widget_wrapper' => ( default => 'SimpleInline' );

# core fields
has_block 'core' => ( render_list => ['project', 'name', 'request_type', 'studies', 'target_block'] );
has_field 'revision' => ( type => 'Hidden', required => 1 );
has_field 'project' => ( label => 'HGI Project Name', type => 'NonEditable', required => 1 );
has_field 'name' => ( label => 'Processing Request Name', required => 1 );
has_field 'request_type' => ( label => 'Project Type', type => 'Select', required => 1 );
has_field 'studies' => ( type => 'AddRemListbox' );
has_field 'target' => ( type => 'ListOrFile' );

# show or hide subforms
has_field 'call_variants' => ( label => 'Do you require variants to be called?', type => 'BoolSelect', required => 1 );
has_field 'perform_imputation' => ( label => 'Do you require imputation?', type => 'BoolSelect', required => 1 );

has_field 'submit' => ( type => 'Submit' );

__PACKAGE__->meta->make_immutable;

no HTML::FormHandler::Moose;

1;

