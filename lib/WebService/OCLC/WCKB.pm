package WebService::OCLC::WCKB;

use Moo;
use namespace::clean;

use WebService::OCLC::WCKB::Settings;
use WebService::OCLC::WCKB::Collections;
use WebService::OCLC::WCKB::Providers;
use WebService::OCLC::WCKB::Entries;

our $VERSION = '0.01';

has wskey => ( is => 'rw', required => 1 );

has institution_id => ( is => 'rw', required => 1 );

sub get_settings {
    my $self = shift;
    return WebService::OCLC::WCKB::Settings->new( %$self )->get();
}

1;
