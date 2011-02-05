package ObjectModel::Alphanumeric;

use strict;
use warnings;

# Perl5 は，そもそもネイティブなオブジェクト指向言語ではないので
# autobox を使って，スカラにメソッドを刺せるようにする
sub to_alphanumeric {
    ($_ = shift) =~ s/[^\w\s]//g;
    $_;
}

1;
