package Labrys::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::Lite;
use Labrys::Model::UrlHistory;

any '/' => sub {
    my ($c) = @_;
    $c->render('index.tt');
};

post '/api/url_history/add' => sub {
    my ($c) = @_;
    my $url = defined $c->req->param('url') ? $c->req->param('url') : return $c->json_error;
    my $type = defined $c->req->param('type') ? $c->req->param('type') : return $c->json_error;
    my $remote_addr = $c->req->env->{REMOTE_ADDR} || 'unknown';
    my $obj = Labrys::Model::UrlHistory->new()->add({
        url         => $url,
        type        => $type,
        remote_addr => $remote_addr,
    });
    return $c->render_json(+{error => 0});
};

1;
