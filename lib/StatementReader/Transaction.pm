package StatementReader::Transaction;

sub parse_line {
	my $line = shift;

	my $transaction_data = {};

	my ($date, $transaction_type, $description, $paid_out, $paid_in, $balance) = split(/\t/, $line);

	$transaction_data->{'date'} = $date;
	$transaction_data->{'transaction_type'} = $transaction_type;
	$transaction_data->{'description'} = $description;
	$transaction_data->{'paid_out'} = $paid_out ? strip_currency_symbol($paid_out) : undef;
	$transaction_data->{'paid_in'} = $paid_in ? strip_currency_symbol($paid_in) : undef;
	$transaction_data->{'balance'} = strip_currency_symbol($balance);

	return $transaction_data;
}

sub strip_currency_symbol {
	my $amount = shift;

	$amount =~ s/^\£//;

	return $amount;
}

1;
