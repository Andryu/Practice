# Auhtor : None
# Nmae   : thread_sample
# Update : 2013/09/01

use strict;
use threads;
use threads::shared; 
use Thread::Semaphore;

my $semaphore = Thread::Semaphore->new(1);

my $data : shared;
my @threads;

print "Create threads\n";
foreach (1 .. 5){
    my $thread = threads->new(\&my_thread, $_ , $semaphore);
    push(@threads, $thread);
}

print "Join threads \n";

foreach(@threads){
    my ($return) = $_->join;
    print "$return closed\n";
}

# スレッドの処理
sub my_thread {
    my $i = shift;
    my $semaphore = shift;
    foreach(1 .. 20){
        $semaphore->down;
        $data++;
        print "Thread $i b($data)\n";
        sleep 1; 
        print "Thread $i a($data)\n";
        $semaphore->up;
        threads->yield();
        sleep(1);
    }
    return ($i);
}


