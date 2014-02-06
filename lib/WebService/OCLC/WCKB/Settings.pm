package WebService::OCLC::WCKB::Settings;

use Moo;
use namespace::clean;

has endpoint => ( is => 'ro', default => sub { 'settings' } );

with 'WebService::OCLC::WCKB::Client';

1;

__END__

=head1 NAME

WebService::OCLC::WCKB::Settings - Settings endpoint to the Knowledge Base API

=head1 SYNOPSIS

    my $s_api = WebService::OCLC::WCKB::Settings->new( {
        wskey          => $wskey,
        institution_id => $id
    } );

    my $r = $s_api->get();
    print $r->entries->[ 0 ]->{ kb:institution_name' };

=head1 DESCRIPTION

=head1 ATTRIBUTES

=over 4

=item * endpoint - Specifies the 'settings' endpoint name

=back

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
