#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

use_ok 'StatementReader::Transaction';

subtest 'parse_line' => sub {
	subtest 'money in - hash of values' => sub {
		my $line = '30 Sep 2019	Interest added	Interest added		£1.00	£7754.65';

		my $result = StatementReader::Transaction::parse_line($line);

		my $expected_result = {
			date => '30 Sep 2019',
			transaction_type => 'Interest added',
			description => 'Interest added',
			paid_out => undef,
			paid_in => '1.00',
			balance => '7754.65',
		};

		is_deeply($result, $expected_result, '... result returned');
	};

	subtest 'money out - hash of values' => sub {
		my $line = '30 Sep 2019	PAYPAL PAYMENT	PAYPAL PAYMENT	£6.95		£7754.65';

		my $result = StatementReader::Transaction::parse_line($line);

		my $expected_result = {
			date => '30 Sep 2019',
			transaction_type => 'PAYPAL PAYMENT',
			description => 'PAYPAL PAYMENT',
			paid_out => '6.95',
			paid_in => undef,
			balance => '7754.65',
		};

		is_deeply($result, $expected_result, '... result returned');
	};
};

done_testing();
