package WebService::OCLC::WCKB::Providers;

use Moo;
use namespace::clean;

has endpoint => ( is => 'ro', default => sub { 'providers' } );

with 'WebService::OCLC::WCKB::Client';

1;
