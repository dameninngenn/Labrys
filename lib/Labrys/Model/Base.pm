package Labrys::Model::Base;

use strict;
use warnings;
use Labrys;

sub new {
    my($class, $c) = @_;
    $c ||= Labrys->new;
    my $self = bless +{ _c => $c }, $class;
    return $self;
}

sub c   { return shift->{_c} }
sub db  { shift->c->db }

sub count {
    my $self = shift;
    my $name = shift;
    my $args = shift;
    return $self->db->count($name,$args);
}

sub insert {
    my $self = shift;
    my $name = shift;
    my $args = shift;
    return $self->db->insert($name,$args);
}

1;
