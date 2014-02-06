package WebService::OCLC::WCKB::Collections;

use Moo;
use namespace::clean;

has endpoint => ( is => 'ro', default => sub { 'collections' } );

with 'WebService::OCLC::WCKB::Client';

1;

__END__

=head1 NAME

WebService::OCLC::WCKB::Collections - Collections endpoint to the Knowledge Base API

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
