package MyCalc;

sub multiply{
    my $self = shift;
    $self->{value} *= shift;
    return $self;
}

1;

