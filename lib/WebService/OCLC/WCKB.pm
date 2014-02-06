package WebService::OCLC::WCKB;

use Moo;
use namespace::clean;

with 'WebService::OCLC::WCKB::ClientInfo';

use WebService::OCLC::WCKB::Settings;
use WebService::OCLC::WCKB::Collections;
use WebService::OCLC::WCKB::Providers;
use WebService::OCLC::WCKB::Entries;

our $VERSION = '0.01';

sub get_settings {
    my $self = shift;
    return WebService::OCLC::WCKB::Settings->new( %$self )->get()
        ->entries->[ 0 ];
}

sub search_providers {
    my $self = shift;
    my $args = shift;

    return WebService::OCLC::WCKB::Providers->new( %$self )->search( $args );
}

sub get_provider {
    my $self = shift;
    my $uid  = shift;

    return WebService::OCLC::WCKB::Providers->new( %$self )
        ->search( { provider_uid => $uid } )->entries->[ 0 ];
}

sub get_all_providers {
    my $self = shift;

    return WebService::OCLC::WCKB::Providers->new( %$self )->get();
}

sub search_collections {
    my $self = shift;
    my $args = shift;

    return WebService::OCLC::WCKB::Collections->new( %$self )
        ->search( $args );
}

sub get_collection {
    my $self = shift;
    my $uid  = shift;

    return WebService::OCLC::WCKB::Collections->new( %$self )
        ->search( { collection_uid => $uid } )->entries->[ 0 ];
}

sub get_collections_by_provider {
    my $self = shift;
    my $uid  = shift;

    return WebService::OCLC::WCKB::Collections->new( %$self )
        ->search( { provider_uid => $uid } );
}

sub get_all_collections {
    my $self = shift;

    return WebService::OCLC::WCKB::Collections->new( %$self )->get();
}

sub search_entries {
    my $self = shift;
    my $args = shift;

    return WebService::OCLC::WCKB::Entries->new( %$self )->search( $args );
}

sub get_entries_by_provider {
    my $self = shift;
    my $uid  = shift;

    return WebService::OCLC::WCKB::Entries->new( %$self )
        ->search( { provider_uid => $uid } );
}

sub get_entries_by_collection {
    my $self = shift;
    my $uid  = shift;

    return WebService::OCLC::WCKB::Entries->new( %$self )
        ->search( { collection_uid => $uid } );
}

1;

__END__

=head1 NAME

WebService::OCLC::WCKB - Library to access the OCLC WorldCat Knowledge Base API

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head1 SEE ALSO

=over 4

=item * L<http://www.oclc.org/developer/services/worldcat-knowledge-base-api>

=back

=head1 AUTHOR

Brian Cassidy E<lt>bricas@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2014 by Brian Cassidy

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
