package pe5;
use strict;

our $MAX_CANDIDATE = 1000000000;

sub smallestDivisibleFrom1ToN{
	my ($class, $N) = @_;
	my $candidate=$N;
	for($candidate; $candidate <= $MAX_CANDIDATE; $candidate=$candidate+$N){
		my $divisible = 1;
		for(my $i=1; $i<=$N; $i++){
			if($candidate % $i != 0){
				$divisible = 0;
				last;
			}
		}
		if($divisible){ last; }
	}
	return $candidate;
}

1;
