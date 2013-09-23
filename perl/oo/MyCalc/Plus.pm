package MyCalc;

sub plus{
    my $self = shift;
    $self->{value} += shift;
    return $self;
}

1;
