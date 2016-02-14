use strict;
use Test::More;
use Test::Exception;

BEGIN {
    use_ok('pe5');
}

is(pe5->smallestDivisibleFrom1ToN(1), 1);
is(pe5->smallestDivisibleFrom1ToN(2), 2);
is(pe5->smallestDivisibleFrom1ToN(3), 6);
is(pe5->smallestDivisibleFrom1ToN(10), 2520);
is(pe5->smallestDivisibleFrom1ToN(20), 232792560);

done_testing();
