#!/usr/bin/env perl

use 5.008;
use strict;
use warnings;
use Getopt::Long qw(:config posix_default no_ignore_case gnu_compat);

GetOptions(
    \my %opts,
    'copyright-holders|c=s',
    'organization|o=s',
    'year|y=s',
);

while (my ($k, $v) = each %opts) {
    delete $opts{$k};
    $k =~ s/-/ /g;
    $opts{$k} = $v if defined $v;
}

while (<>) {
    for my $k (keys %opts) {
        s/<$k>/$opts{$k}/g;
    }
    print;
}
