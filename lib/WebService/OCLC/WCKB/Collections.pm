package WebService::OCLC::WCKB::Collections;

use Moo;
use namespace::clean;

has endpoint => ( is => 'ro', default => sub { 'collections' } );

with 'WebService::OCLC::WCKB::Client';

1;
