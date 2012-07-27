package Labrys::Constants;
use strict;
use warnings;
use parent qw(Exporter);
our @EXPORT_OK = ();
our %EXPORT_TAGS = (
    url_history_type => [qw(URL_HISTORY_TYPE_HOME_CHROME_MAC URL_HISTORY_TYPE_HOME_CHROME_WIN URL_HISTORY_TYPE_OFFICE_CHROME_MAC)],
);

our $DATA = {};
__PACKAGE__->build_export_ok();
__PACKAGE__->make_hash_ref();

use constant URL_HISTORY_TYPE_HOME_CHROME_MAC => 0;
use constant URL_HISTORY_TYPE_HOME_CHROME_WIN => 1;
use constant URL_HISTORY_TYPE_OFFICE_CHROME_MAC => 2;

sub build_export_ok {
    for my $tag  (keys %EXPORT_TAGS ){
        for my $key (@{$EXPORT_TAGS{$tag}}){
            push @EXPORT_OK,$key;
        }
    }
}

sub make_hash_ref {
    no strict 'refs';
    for my $key(@EXPORT_OK) {
        $DATA->{$key} = $key->();
    }
    1;
}

sub as_hashref {
    return $DATA;
}


1;
