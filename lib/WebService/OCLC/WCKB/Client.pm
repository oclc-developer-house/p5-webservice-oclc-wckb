package WebService::OCLC::WCKB::Client;

use Moo::Role;
use namespace::clean;

requires 'endpoint';

with 'WebService::OCLC::WCKB::ClientInfo';

use HTTP::Tiny;
use URI;
use WebService::OCLC::WCKB::Response;

sub get {
    my $self   = shift;
    my $params = shift || {};
    my $uri    = URI->new( $self->base_url . $self->endpoint );
    $uri->query_form( $self->_gen_params( $params ) );

    my $res = $self->agent->get( $uri );

    die 'Request Failed: ' . $res->{ content } if !$res->{ success };

    return WebService::OCLC::WCKB::Response->new( $res );
}

sub search {
    shift->get( @_ );
}

sub _gen_params {
    my $self   = shift;
    my $params = shift;

    # order matters here, otherwise the alt param isn't respected
    return [
        %$params,
        alt            => 'json',
        institution_id => $self->institution_id,
        wskey          => $self->wskey
    ];
}

1;
