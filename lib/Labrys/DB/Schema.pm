package Labrys::DB::Schema;                                                                                              
use strict;
use warnings;

use Teng::Schema::Declare;
use DateTime::Format::MySQL;

table {
    name 'url_history';
    pk 'url_history_id';
    columns qw(url_history_id url_history_type url remote_addr created_at);

    inflate qr/_at$/ => sub {
        DateTime::Format::MySQL->parse_datetime(shift);
    };
    deflate qr/_at$/ => sub {
        DateTime::Format::MySQL->format_datetime(shift);
    };
};

1;
