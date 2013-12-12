package hattie::Form::Widget::Field::EditAdd;
# ABSTRACT: EditAdd field rendering widget


use Moose::Role;
use namespace::autoclean;
use HTML::FormHandler::Render::Util ('process_attrs');

sub render {
    my ( $self, $result ) = @_;
    $result ||= $self->result;
    die "No result for form field '" . $self->full_name . "'. Field may be inactive." unless $result;
    my $output = $self->render_elements( $result );
    return $self->wrap_field( $result, $output );
}

sub render_elements {
    my $result = shift;
    my $output = render_text_element ( $result );
    $output .= render_add_button( $result );
    return $output;
}

sub render_text_element {
	return "<input type=\"text\" />";
}

sub render_add_button {
	return "<input type=\"button\" value=\"Add\" title=\"Add the study\" />";
}

1;

__END__
=pod

=head1 NAME

hattie::Form::Widget::Field::RemListbox - AddRemListbox field rendering widget

=head1 VERSION

version 0.1

=head1 DESCRIPTION

Renders single and multiple selects. Options hashrefs must
have 'value' and 'label' keys, and may have an 'attributes' key.

=head1 NAME

hattie::Form::Widget::Field::AddRemListbox

=head1 AUTHOR

Martin Pollard <mp15@sanger.ac.uk> based on work by
FormHandler Contributors - see HTML::FormHandler

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Gerda Shank, Genome Research Limited.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

