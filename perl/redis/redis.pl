use Redis;
use strict;
use warnings;
use Data::Dumper;

my $redis = Redis->new(server => '192.168.56.101:6379');

#$redis->set('hoge' => 'foo');
$redis->ping || die "no server?";

my $hoge = $redis->get('hoge');

print "hoge : $hoge\n";

my @values = $redis->mget('hoge','name');

warn Dumper @values;

$redis->del('hoge') || warn "key doesn`t";

my $exist = $redis->exists('hoge');

print "exist hoge : $hoge\n";

warn Dumper "hoge : @values";
