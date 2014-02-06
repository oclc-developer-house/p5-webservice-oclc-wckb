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
