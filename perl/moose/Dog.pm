package Dog;
use Moose;

has name => ( is => 'rw' ,isa => 'Str');
has gender => ( is => 'ro' , isa => 'Str');
has age => ( is => 'rw', isa => 'Int');

sub bark{
    my $self = shift;
    print "Wan Wan!\n";
}
1;
