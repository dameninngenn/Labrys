package Labrys::Model::UrlHistory;
use strict;
use warnings;
use Amon2::Declare;
use Smart::Args;
use DateTime;

sub add {
    args my $self,
         my $url         => 'Str',
         my $type        => 'Int',
         my $remote_addr => 'Str',
    ;

    return c->db->insert('url_history', +{
        url              => $url,
        url_history_type => $type,
        remote_addr      => $remote_addr,
    });
}

sub count_recent30min_by_type {
    args my $self,
         my $type        => 'Int',
    ;

    my $target_date = DateTime->now(time_zone => 'local')->add(minutes => -30)->strftime('%Y-%m-%d %H:%M:%S');
    return c->db->count('url_history', '*', +{
        url_history_type => $type,
        created_at       => +{ '>' => $target_date },
    });
}

1;

