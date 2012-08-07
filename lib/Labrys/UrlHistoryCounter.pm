package Labrys::UrlHistoryCounter;

use strict;
use warnings;
use Labrys;
use Labrys::GrowthForecastClient;
use Labrys::Constants qw( :url_history_type );
use Labrys::Model::UrlHistory;

sub new {
    my $class = shift;
    my $self = bless +{}, $class;
    return $self;
}

sub send_to_gf {
    my $self = shift;
    my $model = Labrys::Model::UrlHistory->new();
    my $data = +{
        '自宅Chrome(mac)' => $model->count_recent30min_by_type({ type => URL_HISTORY_TYPE_HOME_CHROME_MAC }),
        '自宅Chrome(win)' => $model->count_recent30min_by_type({ type => URL_HISTORY_TYPE_HOME_CHROME_WIN }),
        '会社Chrome(mac)' => $model->count_recent30min_by_type({ type => URL_HISTORY_TYPE_OFFICE_CHROME_MAC }),
    };
    Labrys::GrowthForecastClient->send('Webページ開いた回数', $data);
}


1;
