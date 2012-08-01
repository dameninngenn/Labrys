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

sub table_name {
    my $self = shift;
    my $class = ref($self) || $self;
    my($table) = $class =~ /::(\w+)$/;
    return unless $table;
    $table =~ s/(?:(^[A-Z])|([A-Z]))/$1 ? lc($1) : '_' . lc($2)/eg;
    return $table;
}

sub count {
    my $self = shift;
    my $args = shift;
    return $self->db->count($self->table_name,'*',$args);
}

sub insert {
    my $self = shift;
    my $args = shift;
    return $self->db->insert($self->table_name,$args);
}

1;
