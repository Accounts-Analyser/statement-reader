#!/usr/bin/perl

use strict;
use warnings;

use lib '../lib';

use StatementReader::Transaction;

my $data_dir = '../data/statements';

opendir my ($dh), $data_dir;

while (my $elem = readdir $dh) {
	if ($elem =~ /(.+)[.]statement$/) {
		open(my $fh, "<", $data_dir.'/'.$elem) or die "Can't open ".$data_dir.'/'.$elem.": $!";

		while (my $line = <$fh>) {
			chomp($line);

			my $transaction = StatementReader::Transaction::parse_line($line);
		}
	}
}
