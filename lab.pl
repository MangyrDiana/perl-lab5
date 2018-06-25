use 5.010;
use strict;
use warnings;
use utf8;

my $filename = 'C:\perl\access.log';
my %h = ();

open(my $fh, '<', $filename) or die "не могу открыть '$filename'$!";

while (my $line = <$fh>)
{
	if($line =~ /(\d+\.\d+.\d+.\d+)/)
	{
		if(exists($h{ $1 }))
		{
			$h{ $1 }++;
		}
		else
		{
			$h{ $1 } = 1;
		}
	}
}

my $x = 1;
foreach(sort {$h{$b} <=> $h{$a}} keys %h)
{
	print $_,' = ',$h{$_},"\n";
	$x++;
	if($x > 10)
	{
		last;
	}
}
