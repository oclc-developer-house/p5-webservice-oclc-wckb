package WebService::OCLC::WCKB::Response;

use Moo;
use namespace::clean;

use Data::Page;
use JSON ();

has response => ( is => 'ro', required => 1 );

has content => ( is => 'rw' );

has pager => ( is => 'rw', default => sub { Data::Page->new } );

has entries => ( is => 'rw' );

sub BUILDARGS {
    my ( $class, @args ) = @_;

    unshift @args, 'response' if @args == 1;

    return { @args };
}

sub BUILD {
    my $self = shift;

    my $content = JSON::decode_json( $self->response->{ content } );
    $self->content( $content );

    my $pager = $self->pager;

    $pager->total_entries( $content->{ 'os:totalResults' } );
    $pager->entries_per_page( $content->{ 'os:itemsPerPage' } );
    $pager->current_page( ( $content->{ 'os:startIndex' } - 1 )
        / $content->{ 'os:itemsPerPage' } + 1 );

    $self->entries( $content->{ entries } );
}

1;

__END__

=head1 NAME

WebService::OCLC::WCKB::Response - Wrapper around an HTTP response from the Knowledge Base API

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 ATTRIBUTES

=over 4

=item * content

=item * entries

=item * pager

=item * response

=back

=head1 METHODS

=head2 BUILD

=head2 BUILDARGS

=head1 SEE ALSO

=over 4

=item * L<WebService::OCLC::WCKB>

=item * L<http://www.oclc.org/developer/services/worldcat-knowledge-base-api>

=back

=head1 AUTHOR

Brian Cassidy E<lt>bricas@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2014 by Brian Cassidy

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
