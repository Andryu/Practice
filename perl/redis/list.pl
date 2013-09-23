#!/usr/bin/perl
use strict;
use warnings;
use Redis;
use Data::Dumper;

my $redis = Redis->new;

my $name = $redis->get('name');

warn Dumper $name;

