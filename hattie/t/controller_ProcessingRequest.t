use strict;
use warnings;
use Test::More;


use Catalyst::Test 'hattie';
use hattie::Controller::ProcessingRequest;

ok( request('/processingrequest')->is_success, 'Request should succeed' );
done_testing();
