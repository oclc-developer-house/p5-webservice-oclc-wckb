package WebService::OCLC::WCKB::ClientInfo;

use Moo::Role;
use namespace::clean;

has wskey => ( is => 'rw', required => 1 );

has institution_id => ( is => 'rw', required => 1 );

has base_url => (
    is      => 'rw',
    default => sub { 'http://worldcat.org/webservices/kb/rest/' }
);

has agent => ( is => 'rw', default => sub { HTTP::Tiny->new } );

1;

__END__

=head1 NAME

WebService::OCLC::WCKB::ClientInfo - Common attributes for HTTP client usage

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

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
