package MyCalc;

sub new {
    my $self = shift;
    bless{
        value => undef
    },$self;
}

sub clear{
    my $self = shift;
    $self->{value} = undef;
}

sub result{
    my $self = shift;
    return $self->{value};
}

1;
