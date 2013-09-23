#!/usr/bin/perl
use strict;
use warnings;
use MooseRole;

my $other1 = MooseRole->new(amount => 10);
my $other2 = MooseRole->new(amount => 20);
my $other3 = MooseRole->new(amount => 10);

warn $other1->compare($other2);
warn $other2->compare($other1);
warn $other1->equal_to($other3);
