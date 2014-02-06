use strict;
use warnings;

use Test::More tests => 6;

BEGIN {
    use_ok( 'WebService::OCLC::WCKB' );
    use_ok( 'WebService::OCLC::WCKB::Client' );
    use_ok( 'WebService::OCLC::WCKB::Settings' );
    use_ok( 'WebService::OCLC::WCKB::Collections' );
    use_ok( 'WebService::OCLC::WCKB::Providers' );
    use_ok( 'WebService::OCLC::WCKB::Entries' );
}
