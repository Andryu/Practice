package MooseRole;

use Moose;
with 'Comparable';

has amount => (is => 'rw', isa => 'Num', default => 0);

sub compare{
    my ($self,$other) = @_;
    $self->amount <=> $other->amount;
}

1;

