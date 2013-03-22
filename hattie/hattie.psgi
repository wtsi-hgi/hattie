use strict;
use warnings;

use hattie;

my $app = hattie->apply_default_middlewares(hattie->psgi_app);
$app;

