package Comparable;
use Moose::Role;

requires 'compare';

sub equal_to{
    my ($self,$other) = @_;
    $self->compare($other) == 0;
}

1;
