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

__END__

=head1 NAME

WebService::OCLC::WCKB::Client - HTTP client class

=head1 DESCRIPTION

This class is a role which should not be instanciated directly. It provides 
a set of methods to do the HTTP interaction with the KB API and return an 
appropriate L<WebService::OCLC::WCKB::Response> object.

=head1 METHODS

=head2 get( $params )

=head2 search( $params )

This method is just an alias for C<get>.

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
