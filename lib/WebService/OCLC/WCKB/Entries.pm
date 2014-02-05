package WebService::OCLC::WCKB::Entries;

use Moo;
use namespace::clean;

has endpoint => ( is => 'ro', default => sub { 'entries' } );

with 'WebService::OCLC::WCKB::Client';

1;
