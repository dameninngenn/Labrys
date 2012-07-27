package Labrys::Model::UrlHistory;
use strict;
use warnings;
use Amon2::Declare;
use Smart::Args;

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

1;

