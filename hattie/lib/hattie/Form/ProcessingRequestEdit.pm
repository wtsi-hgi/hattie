package hattie::Form::ProcessingRequestEdit;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler';
use Moose::Util::TypeConstraints;
use namespace::autoclean;

has '+item_class' => ( default => 'ProcessingRequest' );
has '+field_name_space' => ( default => 'hattie::Form::Field' );
has '+widget_name_space' => ( default => sub { ['hattie::Form::Widget'] } );
has '+widget_wrapper' => ( default => 'SimpleInline' );
has '+is_html5' => ( default => 1 );

has 'options_request_type' => ( is => 'rw', traits => ['Array'], default => sub { ["" => "Select...", 'WGS' => "WGS", 'WES' => "WES", 'Targeted' => "Targeted"] } );
has 'options_studies_list' => ( is => 'rw', traits => ['Array'], default => sub { [0 => "SEQCAP_WGS_FISH", 1 => "SEQCAP_WGS_PLAICE"]} );
has 'options_target_list' => ( is => 'rw', traits => ['Array'], default => sub { ["" => "Please select an option...", "Argelant All Exon 50Mb" => "A", "dummy" => "dummy"]} );

# core fields
has_block 'core' => ( render_list => ['project', 'name', 'request_type', 'studies', 'target_block'] );
has_field 'revision' => ( type => 'Hidden', required => 1 );
has_field 'project' => ( label => 'HGI Project Name', type => 'Text', required => 1 );
has_field 'name' => ( label => 'Processing Request Name', required => 1 );
has_field 'request_type' => ( label => 'Request Type', type => 'Select', required => 1 );
has_field 'studies' => ( type => 'AddRemListbox', list_label => 'Sequencescape Study Name', to_add_label => 'Study to add', value_field => 'studies' );
has_field 'target' => ( list_label => 'Please select either existing target file', file_label => 'or upload a target file', type => 'ListOrFile' );

# show or hide subforms
has_field 'call_variants' => ( label => 'Do you require variants to be called?', type => 'BoolSelect', required => 1 );
has_field 'perform_imputation' => ( label => 'Do you require imputation?', type => 'BoolSelect', required => 1 );

# autoqc
has_field 'auto_qc_gtype_regex' => ( type => 'Text', label => 'Allowed Genotype REGEX' );
has_field 'auto_qc_insert_peak_window' => ( type => 'Float', label => 'Insert Peak Window Size' );
has_field 'auto_qc_gtype_regex' => ( type => 'Text', label => 'Allowed Genotype REGEX' );


# improvement
has 'options_known_sites_realign_list' => ( is => 'rw', traits => ['Array'], default => sub { [0 => "Mills-Devine", 1 => "1000G low coverage"]} );
has 'options_known_sites_bqsr_list' => ( is => 'rw', traits => ['Array'], default => sub { [0 => "dbSNP 137"]} );

has_field 'known_sites_realign' => ( type => 'AddRemListbox', list_label => 'Known INDELs for realignment', to_add_label => '&nbsp;' );
has_field 'known_sites_bqsr' => ( type => 'AddRemListbox', list_label => 'Known SNPs for BQSR', to_add_label => '&nbsp;' );


# call variants
has_field 'vqsr_enable' => ( label => 'Do you wish to use VQSR Filtering?', type => 'BoolSelect', required => 1 );

# call variants - VQSR
has_field 'vqsr_snp_sites' => ( type => 'Select', required => 1 );
has_field 'vqsr_snp_initial_tsfilter' => ( label => 'SNP Initial Truth Sensitivity Filtering Level', type => 'Float');
has_field 'vqsr_indel_sites' => ( type => 'Select', required => 1 );
has_field 'vqsr_indel_initial_tsfilter' => ( label => 'INDEL Initial Truth Sensitivity Filtering Level', type => 'Float');

# call variants - manual filtering

# call variants - annotation
has 'options_id_field' => ( is => 'rw', traits => ['Array'], default => sub { ["" => "Select...", 0 => "dbSNP 137"]} );
has_field 'id_field' => ( type => 'Select', label => 'ID Field');
has_field 'annot_vep' => ( type => 'Checkbox', label => 'VEP' );

# imputation
has 'options_imputation_reference_list' => ( is => 'rw', traits => ['Array'], default => sub { [0 => "1000 Genomes"]} );
has 'options_imputation_mode' => ( is => 'rw', traits => ['Array'], default => sub { ["" => "Select...", "both" => "Both","refinement" => "Variant Refinement","ref_imputation" => "Reference Imputation"]} );
has_field 'imputation_mode' => (type => 'Select', label => 'Mode' );
has_field 'imputation_reference' => ( type => 'AddRemListbox', list_label => 'Imputation References', to_add_label => '&nbsp;' );

has_field 'submit' => ( type => 'Submit' );

__PACKAGE__->meta->make_immutable;

no HTML::FormHandler::Moose;

1;

