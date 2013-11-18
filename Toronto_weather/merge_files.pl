#!/usr/bin/perl

# Concatenate all Environment Canada csv files in this directory
my @file_names;
my $outfile_name = "toronto_1978-2002.csv";

open(OUTFILE, '>', $outfile_name) or die $!;

# Get file names
opendir(DIR, ".") or die $!;
while (my $file = readdir(DIR)) {
	if($file =~ m/^eng.*\.csv$/) {
		push @file_names, $file;
		}
	}
closedir DIR;

foreach my $file (@file_names) {
	open FILE, $file or die $!;
	my $past_header = 0;
	while (my $line = <FILE>) {
		if ($line =~ m|^"Date/Time",|) {
			$past_header = 1;
			next;
			}
		if ($past_header) {
			print OUTFILE $line;
			}
		}
	close FILE;
	}

