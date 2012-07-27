#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use File::Spec;
use File::Basename;
use lib File::Spec->catdir(dirname(__FILE__), '..', 'extlib', 'lib', 'perl5');
use lib File::Spec->catdir(dirname(__FILE__), '..', 'lib');
use DateTime;
use Labrys::CUI::UrlHistory;

my $url_history = Labrys::CUI::UrlHistory->new();
$url_history->send_count_to_gf();

