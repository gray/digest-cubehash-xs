use strict;
use warnings;
use Test::More tests => 11;
use Digest::CubeHash;

new_ok('Digest::CubeHash' => [$_], "algorithm $_") for qw(224 256 384 512);

is(eval { Digest::CubeHash->new },     undef, 'no algorithm specified');
is(eval { Digest::CubeHash->new(10) }, undef, 'invalid algorithm specified');

can_ok('Digest::CubeHash',
    qw(clone algorithm hashsize add digest hexdigest b64digest)
);

for my $alg (qw(224 256 384 512)) {
    my $d1 = Digest::CubeHash->new($alg);
    is(
        $d1->add('foobar')->hexdigest, $d1->clone->hexdigest,
        "clone of $alg"
    );
}
