#!/usr/bin/env perl;
# Auhtor : Shunsuke Andoh
# Name   : thread.pl
# Update : 2013/09/01

use strict;
use warnings;
use utf8;
use Config;
$Config{useithreads} or die('Recompile Perl with threads to run this program.');
use threads;
use threads::shared;
use Data::Dumper;
use Thread::Semaphore;
#use Thread::Queue;

my @array : shared=();
my $semaphore = Thread::Semaphore->new();

main();

sub main{
    initialize();

    my @threads;
    for my $i(1..3){
        my $thread = threads->new(\&update,$i);
        push @threads,$thread;
    }

    for my $thread(@threads){
        $thread->join;
    }
}

sub initialize{
    print "initialize\n";
    for my $index(0..10){
        push(@array,$index);    
    }
}

sub update{
    my $i = shift;
    print "Thread $i update\n";
    my $random = int(rand(10));
    
    #$semaphore->down();
    {
        lock(@array);
        #my @dummy = @array;
        my $length = scalar(@array);
        for my $data(0..($length-1)){
            if(defined $array[$data] and $array[$data] eq $random){
                print "radom : $random\n";
                print "Thread[$i] delete $random\n";
                delete($array[$data]);
                #splice(@dummy,$data,1);
                last;
            }
        }
        #@array = @dummy; 
        warn "Thread [$i] ";#print
        warn Dumper @array;
        sleep(5);
    }

    #$semaphore->up;
    threads->yield;
    sleep(1);
    return $i;
}


