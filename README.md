# Statement Reader

[![CircleCI](https://circleci.com/gh/Accounts-Analyser/statement-reader.svg?style=svg)](https://circleci.com/gh/Accounts-Analyser/statement-reader)

This is a simple perl program that reads files containing statement transactions and stores them in a MySQL database

## Statement file format

Statements are copy pasted directly from the Nationwide website and are tab separated values

`Date→Transaction Type→Description→Paid Out→Paid In→Balance`

## Testing

From the root of the repo run `prove -lr`