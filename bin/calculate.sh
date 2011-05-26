#!/bin/bash

# by Zwischenzugs
# You're free to reproduce and re-use this code for non-commercial use
# as long as attribution to "Zwischenzugs" is made clear.

CORPUS_FILE=$1

if [ x$CORPUS_FILE = "x" ]
	then 
		echo "Filename required"
		exit
fi

echo "Number of words in writer's corpus file"

wc -w $CORPUS_FILE
./analyse.pl $CORPUS_FILE > ${1}_words_all_lc
echo "Number of words with removals of non-words and non-word characters"
wc -w ${1}_words_all_lc

sort ${1}_words_all_lc | uniq > ${1}_words_all_lc_uniq
echo "Number of unique words with removals of non-words and non-word characters"
wc -w ${1}_words_all_lc_uniq

sort ${1}_words_all_lc | ./stemmer.pl | sort | uniq > ${1}_stemmed_uniq
echo "Number of unique words after stemming"
wc -l ${1}_stemmed_uniq





