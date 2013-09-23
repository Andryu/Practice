#!/usr/bin/perl
use strict;
use warnings;
use Dog;
use Data::Dumper;

my $dog = new Dog( {gender => 'male'});
$dog->name('Pochi');
$dog->age(3);

print $dog->name."\n";
print $dog->age."\n";

$dog->bark();
