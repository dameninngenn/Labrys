#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use File::Spec;
use File::Basename;
use lib File::Spec->catdir(dirname(__FILE__), '..', 'extlib', 'lib', 'perl5');
use lib File::Spec->catdir(dirname(__FILE__), '..', 'lib');
use Labrys::UrlHistoryCounter;

my $counter = Labrys::UrlHistoryCounter->new();
$counter->send_to_gf();

