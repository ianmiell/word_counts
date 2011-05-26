#!/usr/bin/perl -W

# by Zwischenzug

# Input:
#   stream of ordinary text
# Output:
#   all words, sorted with:
#       numbers removed
#       possessives removed
#       "'d"s replaced with "ed", eg regard'd -> regarded

use strict;
use warnings;

my @all_words;
my $word;
while (<>) {
	my @words = split(/\s/,$_);
	foreach (@words) {
		# while we match, strip off any dodge chars.
		# to upper case
		$word = lc($_);
		# Get rid of all characters except a-z and apostrophes - ie no numbers etc
		if ($word =~ /[^a-z']*'*([a-z']*).*/) {
			$word = $1;
			# Get rid of final apostrophes
			if ($word =~ /(.*)'$/) {
				$word = $1;
			}
			# get rid of possessives
			if ($word =~ /(.*)'s$/) {
				$word = $1;
			}
			# replace 'd's with ed - there's some false positives here but not many
			if ($word =~ /(.*)'d$/) {
				$word = "$1ed";
			}
		}
		if ($word =~ /[a-z']/) {
			push (@all_words,$word);
		}
	}
}


# Determine word stems, and then remove redundant words.

# Sort the words.
@all_words = sort @all_words;

# So we have all the "words" in a list now, duplicates and all
foreach (@all_words) {
	print "$_\n";
}
