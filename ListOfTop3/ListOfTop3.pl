#!/usr/bin/perl -w

use strict;
use warnings;

my %hash = ();

while (<>) {
    chomp $_;
    $hash{$_}++;
}

my $top3 = 0;
foreach my $key (sort{$b<=>$a} keys %hash) {
    $top3++;
    print $key ."\n";
    last if $top3 == 3;
}
