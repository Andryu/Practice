#!/usr/bin/perl

package main;

use MyCalc;
use MyCalc::Plus;
use MyCalc::Multiply;

my $calc = MyCalc->new;

$calc->plus(10)->multiply(2);

warn $calc->result;
