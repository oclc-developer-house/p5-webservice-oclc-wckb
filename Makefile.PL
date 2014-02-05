use inc::Module::Install 1.00;

if ( -e 'MANIFEST.SKIP' ) {
    system( 'pod2text lib/WebService/OCLC/WCKB.pm > README' );
}

perl_version '5.008';

name 'WebService-OCLC-WCKB';
all_from 'lib/WebService/OCLC/WCKB.pm';

test_requires 'Test::More' => '0.96';

WriteAll;
