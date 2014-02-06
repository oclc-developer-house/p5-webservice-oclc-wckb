use strict;
use warnings;

use lib 't/lib';
use MockAgent;

use Test::More tests => 10;

use_ok( 'WebService::OCLC::WCKB::Settings' );

my $s_api = WebService::OCLC::WCKB::Settings->new( { institution_id => 123456, wskey => 'decafbad' } );

isa_ok( $s_api, 'WebService::OCLC::WCKB::Settings' );
is( $s_api->institution_id, 123456, 'institution_id' );
is( $s_api->wskey, 'decafbad', 'wskey' );

$s_api->agent( MockAgent->new );

isa_ok( $s_api->agent, 'MockAgent' );

my $r = $s_api->get;

isa_ok( $r, 'WebService::OCLC::WCKB::Response' );

isa_ok( $r->entries, 'ARRAY' );
is( scalar @{ $r->entries }, 1, 'only 1 entry for settings' );

my $e = $r->entries->[ 0 ];
isa_ok( $e, 'HASH' );
is( $e->{ 'kb:institution_name' }, 'University of OCLC Test', 'b:institution_name' );

