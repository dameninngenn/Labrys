package Labrys;
use strict;
use warnings;
use utf8;
use parent qw/Amon2/;
our $VERSION='0.01';
use 5.008001;
use Labrys::DB;
use Plack::Util;

__PACKAGE__->load_plugin(qw/DBI/);

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

sub model {
    my($self, $name) = @_;
    unless ($self->{__model}) {
        $self->{__model} = +{};
    }
    if (! $self->{__model}->{$name}) {
        $self->{__model}->{$name} =
            Plack::Util::load_class($name, 'Labrys::Model')->new($self);
    }
    return $self->{__model}->{$name};
}

1;
