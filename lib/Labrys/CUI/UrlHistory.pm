package Labrys::CUI::UrlHistory;

use strict;
use warnings;
use Labrys;
use Labrys::GrowthForecastClient;
use Labrys::Constants qw( :url_history_type );
use DateTime;

sub new {
    my $class = shift;
    my $self = bless +{}, $class;
    $self->_init();
    if (@_ && ref($_[0]) eq 'HASH') {
        my $args = shift;
        for my $method (keys %$args) {
            $self->$method($args->{$method});
        }
    }
    return $self;
}

sub _init {
    my $self = shift;
    $self->{c} ||= Labrys->new;
}

sub c { shift->{c} }
sub db { shift->{c}->db }

sub send_count_to_gf {
    my $self = shift;

    my $data = +{
        '自宅Chrome(mac)' => $self->count_recent30min_by_type({ type => URL_HISTORY_TYPE_HOME_CHROME_MAC }),
        '自宅Chrome(win)' => $self->count_recent30min_by_type({ type => URL_HISTORY_TYPE_HOME_CHROME_WIN }),
        '会社Chrome(mac)' => $self->count_recent30min_by_type({ type => URL_HISTORY_TYPE_OFFICE_CHROME_MAC }),
    };
    Labrys::GrowthForecastClient->send('Webページ開いた回数', $data);
}

# XXX modelの使いたい
sub count_recent30min_by_type {
    my $self = shift;
    my $args = shift;

    my $target_date = DateTime->now(time_zone => 'local')->add(minutes => -30)->strftime('%Y-%m-%d %H:%M:%S');
    return $self->db->count('url_history', '*', +{
        url_history_type => $args->{type},
        created_at       => +{ '>' => $target_date },
    });
}

1;
