package Labrys::GrowthForecastClient;
use strict;
use warnings;

use LWP::UserAgent;

my $UA = LWP::UserAgent->new(
    agent   => 'Labrys::GrowthForecastClient/0.1',
    timeout => 1,
);

sub send {
    my($class, $type, $data) = @_;
    my $conf = Labrys->config->{gf} or die "missing configuration for 'gf'";
    foreach my $key ( keys %$data ) {
        $UA->post( sprintf('%s%s/%s', $conf->{base_url}, $type, $key) , {
            number => $data->{$key},
        });
    }
}

1;
