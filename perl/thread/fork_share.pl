#!usr/bin/perl

# Author : Shunsuke Andoh
# Name   : fork.pl
# Update : 2013/09/05
# Desc   : プロセス間で変数を共有できない例
my $count = 10;
sub forked_process {
    print "I'm a child. My pid is $$";
    $count--;
    print "count : $count\n";
    sleep 5;
}

my $num_fork = 5;
while ($num_fork--) { # $num_fork で指定された回数だけループ
    my $pid = fork; # 子プロセスを生成する
    if (!defined $pid) {
        die "fork failed"; # 生成に失敗した
    }
    elsif (!$pid) {
        &forked_process; # 子プロセスの本体(関数)
        print "$$ exit";
        exit; # 子プロセスを終了する
    }
    # 親プロセスなのでループを継続する
}
