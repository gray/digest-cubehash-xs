use strict;
use warnings;
use Test::More tests => 68;
use Digest::CubeHash::XS qw(cubehash_224 cubehash_224_hex);

my $len = 0;

while (my $line = <DATA>) {
    chomp $line;
    my ($msg, $digest) = split '\|', $line, 2;
    my $data = pack 'H*', $msg;
    $digest = lc $digest;

    if ($len and not $len % 8) {
        my $md = Digest::CubeHash::XS->new(224)->add($data)->hexdigest;
        is($md, $digest, "new/add/hexdigest: $len bits of $msg");
        is(
            cubehash_224_hex($data), $digest,
            "cubehash_224_hex: $len bits of $msg"
        );
        ok(
            cubehash_224($data) eq pack('H*', $digest),
            "cubehash_224: $len bits of $msg"
        );
    }

    my $md = Digest::CubeHash::XS->new(224)->add_bits($data, $len)->hexdigest;
    is($md, $digest, "new/add_bits/hexdigest: $len bits of $msg");
}
continue { $len++ }

__DATA__
00|F9802AA6955F4B7CF3B0F5A378FA0C9F138E0809D250966879C873AB
00|BA87946124E457A0A7B99E90275C4DD284A2611107F94F07950821ED
C0|E9204754614A1FDA8C80E81616F502A323CDA8464DF6C2A4F304C62C
C0|C9AA78591FAD56691EF3F5D600CCA0F55E35A0CF3649A0ADF1C8F70B
80|D04703AEADC4D1F737FB5D99F61EE0D4FD3CD0B0FA36332C4CB72B1C
48|F327614E9EEA33A7A30ACA95EFA166BEADB5F0EA87ADA856A0B50C11
50|90FE59A358FC810E83BE347A230F2EE634B07AA5D540B491D9764B05
98|A41EB28B261F13C67946981FD0D0888F77BFE3598543641B78AB00D9
CC|905DE883A8E50854514E928CC0F9990AA051AE0AFB32E5971A1C2945
9800|2E717951D3CC023037185BB4AE81A1BCEA70E79DD7162ADF60C41E2A
9D40|D42A253674B5672B795D7A7F96C7BF8CC4938B5175BA2447E47D0304
AA80|22C1B615C1023C289FFC974B73737B3254402D788F907BAB9D0C7C54
9830|3D8C3D10C72DA9E163B7B6A24BA01798A9FD2BB030BA80C405D9A700
5030|2A201626425E9AA48E695859131B35DD4EAFE142726E8DBD9E3C1BCE
4D24|9F3B11EAB794E27D7AFF64B1CDD1349944F5C23B277696527A6693F5
CBDE|6DB3E888D475C8F41603DABBF4C5543D6EA232A504F42C9D127A6130
41FB|63687E93C6A512C9F2E9689BB0CD4F0196D45E4DE7CBE50C4402FA12
4FF400|78A42E6463EC57048D83504885517C08E1E5113A30B3BBFEF7AF878C
FD0440|B65F181711137AA2A899F77852CAD19C942D8FA2972C6D3459E8CB38
424D00|4A019172A4F43588B06EB10A85114B18A7CCA8BFA6601CD262F22588
3FDEE0|4891455B65E87074E0B20B77B0403E795057881858F848799B046723
335768|17E4CA69D6D9EB73A235286DBF16DE6A60E6B03F2EDB310CB18C7DCD
051E7C|4458C885B23AB6B27069C221523F5C1AF340596ADE421DBE844F2562
717F8C|52F2F40B7CF92B0E835107C2F81B0D6DB49D7D9ABF12B944568E6745
1F877C|3E3BD18DF0F02EF0198B311552F601B112634F368113FFDA1934AD35
EB35CF80|115EBF7AF7CCAB917D165258788D27F72E491715C638604350B1F55A
B406C480|49CBDD4875959E9FF6BC72BC72F84BFEC83E065827AEA107B160AE3F
CEE88040|91C880AB69482D3A6663CEEE64E7AB52DFA08B96B54C6C0062504F29
C584DB70|9F0E4B0F9FB37B23E4AF0086B2B1982E98319B9319FAD6219FC530B6
53587BC8|F8BDA9F4CC527DD634E4C4E74E9F445BB6FF03DB593F711774425276
69A305B0|CDC55420C737CBAA1CDD8A52CEEF179E047872D70A50B3FF1D9ED9DA
C9375ECE|EACB470F967E2C7CFEBA2DE317F8DB9D07DE353347DCE529E0458CA0
C1ECFDFC|1ED5349DDFBC6FD246239F004E1460FC7B904FAFBA1E70199DB25D07
8D73E8A280|6B2A2858DD88AD916C6703C3C47D35B3378ACFF4C0CBFBCFB82B8B0B
06F2522080|E4E1819A0D1EB25B142F509A01CA601CE4326EC7886D8495C9289E21
3EF6C36F20|96D91D6225B94B4E5CC8878D0752381D86D75BDDCE99228C9E5A786A
0127A1D340|0BEA3564B125FF5C9C88E42C47A5B8DBC4004A4674BE537D9EC3BE46
6A6AB6C210|720359903188B267DFAC56E62E238C51CFCE53AB36D4FB9CDF0D8A29
AF3175E160|315D72567C29E7EE9BF30A726B156B8C5C1C1ED00CCDC713E67782F3
B66609ED86|47ED9DD60359097B15063800197A8725E7CEDA7C1CA007EABF393DFD
21F134AC57|360C98FC1BA7EC1C5F8486D420F80D38F6E9E767A3BBCA3971D3E2C5
3DC2AADFFC80|3C17207559742EE72BA46A4A1F3C85CEAEBEC2C5487F95E63A529A3F
9202736D2240|5D88B51A50C340AD8239C99FAF39C9BCA7E780CA8AB31BABA2354B73
F219BD629820|CABF41B77D216282C416E20E4958A10297C9652B7256CBA915C5DF8D
F3511EE2C4B0|A67AE4F14AEA93B80AC8A697183816A92112840553439886501B1C86
3ECAB6BF7720|CBE4F13B504F426F62E9CB51D637F9390E2DB75F61D36FE74C0BC11F
CD62F688F498|600E104F3BF14674B7D9DEC84FABA16D57B2A724743444FE00E97CD1
C2CBAA33A9F8|F07BE87598C7CB51F74E0480FBA8ACFC5CE9A713A8B885311D66BABB
C6F50BB74E29|3C18E3DE8FA4EB5D4CE84B77201278764493FDFFA61184A80CDF561E
79F1B4CCC62A00|3C46CF9C190DDF98372B180094E6F8834B7ED91F50BA24E330E060DF
