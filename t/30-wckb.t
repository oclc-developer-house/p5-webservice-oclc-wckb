use strict;
use warnings;

use lib 't/lib';
use MockAgent;

use Test::More tests => 7;

use_ok( 'WebService::OCLC::WCKB' );

my $s_api = WebService::OCLC::WCKB->new(
    { institution_id => 123456, wskey => 'decafbad' } );

isa_ok( $s_api, 'WebService::OCLC::WCKB' );
is( $s_api->institution_id, 123456,     'institution_id' );
is( $s_api->wskey,          'decafbad', 'wskey' );

$s_api->agent( MockAgent->new );

isa_ok( $s_api->agent, 'MockAgent' );

{
    my $e = $s_api->get_settings;

    isa_ok( $e, 'HASH' );
    is( $e->{ 'kb:institution_name' },
        'University of OCLC Test',
        'b:institution_name'
    );
}
