package MockAgent;

use strict;
use warnings;

use base 'HTTP::Tiny';

use Digest::MD5 ();

sub get {
    my $self = shift;
    my $url  = shift;

    # This works because the query string is set by an array instead of a hash
    my $file = Digest::MD5::md5_hex( $url );
    open( my $fh, '<', "t/responses/$file.txt" );
    my $content = do { local $/; <$fh> };
    close( $fh );

    my $response = eval $content;
    return $response;
}

1;
