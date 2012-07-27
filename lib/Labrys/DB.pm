package Labrys::DB;
use strict;
use warnings;
use utf8;
use parent qw(Teng);
use DateTime;

__PACKAGE__->load_plugin('Count');

sub _before_insert {
    my $self = shift;
    my($table, $args) = @_;
    return if $args->{created_at};
    my $table_obj = $self->schema->get_table($table);
    my $has_created_at = 0;
    for my $name (@{$table_obj->columns}) {
        if ($name eq 'created_at') {
            $has_created_at = 1;
            last;
        }
    }
    return unless $has_created_at;
    $args->{created_at} = DateTime->now(time_zone => 'local');
}

sub insert {
    my $self = shift;
    $self->_before_insert(@_);
    return $self->SUPER::insert(@_);
}

1;
