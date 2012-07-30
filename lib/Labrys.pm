package Labrys;
use strict;
use warnings;
use utf8;
use parent qw/Amon2/;
our $VERSION='0.01';
use 5.008001;

__PACKAGE__->load_plugin(qw/DBI/);

use Labrys::DB;
sub db {
    my ($self) = @_;
    if (! defined $self->{db}) {
        my $conf = $self->config->{DBI} or die "missing configuration for 'DBI'";
        my $dbh = DBI->connect(@{$conf});
        $self->{db} = Labrys::DB->new(
            dbh => $dbh,
        );
    }
    return $self->{db};
}

1;
