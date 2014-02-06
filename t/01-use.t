use strict;
use warnings;

use Test::More tests => 8;

BEGIN {
    use_ok( 'WebService::OCLC::WCKB' );
    use_ok( 'WebService::OCLC::WCKB::Client' );
    use_ok( 'WebService::OCLC::WCKB::ClientInfo' );
    use_ok( 'WebService::OCLC::WCKB::Settings' );
    use_ok( 'WebService::OCLC::WCKB::Collections' );
    use_ok( 'WebService::OCLC::WCKB::Providers' );
    use_ok( 'WebService::OCLC::WCKB::Entries' );
    use_ok( 'WebService::OCLC::WCKB::Response' );
}
