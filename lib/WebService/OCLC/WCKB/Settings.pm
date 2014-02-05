package WebService::OCLC::WCKB::Settings;

use Moo;
use namespace::clean;

has endpoint => ( is => 'ro', default => sub { 'settings' } );

with 'WebService::OCLC::WCKB::Client';

1;
