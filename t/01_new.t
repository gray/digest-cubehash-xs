use strict;
use warnings;
use Test::More tests => 15;
use Digest::CubeHash;

new_ok('Digest::CubeHash' => [$_], "algorithm $_") for qw(224 256 384 512);

is(eval { Digest::CubeHash->new },     undef, 'no algorithm specified');
is(eval { Digest::CubeHash->new(10) }, undef, 'invalid algorithm specified');

can_ok('Digest::CubeHash',
    qw(clone reset algorithm hashsize add digest hexdigest b64digest)
);

for my $alg (qw(224 256 384 512)) {
    my $d1 = Digest::CubeHash->new($alg);
    $d1->add('foo bar')->reset;
    is($d1->hexdigest, Digest::CubeHash->new($alg)->hexdigest, 'reset');

    $d1->add('foobar');
    my $d2 = $d1->clone;
    is($d1->hexdigest, $d2->hexdigest, "clone of $alg");
}
