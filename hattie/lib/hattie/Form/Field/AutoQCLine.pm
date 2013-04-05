package hattie::Form::Field::AutoQCLine;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Compound';

has_field 'stat' => ( type => 'Static', build_label_method => \&name_stat );
has_field 'error_min' => ( type => 'Float' );
has_field 'error_max' => ( type => 'Float' );
has_field 'warning_min' => ( type => 'Float' );
has_field 'warning_max' => ( type => 'Float' );

has 'stat_name' => ( is => 'rw' );

sub name_stat
{
    my $self = shift;
    return $self->parent->stat_name();
}

__PACKAGE__->meta->make_immutable;

no HTML::FormHandler::Moose;

1;

