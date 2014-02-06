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
