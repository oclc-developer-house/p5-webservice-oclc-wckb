use strict;
use warnings;

use lib 't/lib';
use MockAgent;

use Test::More tests => 7;

use_ok( 'WebService::OCLC::WCKB::Settings' );

my $s_api = WebService::OCLC::WCKB::Settings->new( { institution_id => 123456, wskey => 'badkey' } );

isa_ok( $s_api, 'WebService::OCLC::WCKB::Settings' );
is( $s_api->institution_id, 123456, 'institution_id' );
is( $s_api->wskey, 'badkey', 'wskey' );

$s_api->agent( MockAgent->new );

isa_ok( $s_api->agent, 'MockAgent' );

my $r = eval { $s_api->get };

ok( !defined $r, 'no response due to error' );

like( $@, qr/WSKEY_INVALID/, 'error code' );
