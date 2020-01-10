#!/usr/bin/perl -w

require 5.001;
use Date::Manip;
@Date::Manip::TestArgs=();
$runtests=shift(@ARGV);
if ( -f "t/test.pl" ) {
  require "t/test.pl";
} elsif ( -f "test.pl" ) {
  require "test.pl";
} else {
  die "ERROR: cannot find test.pl\n";
}
$ntest=2;

print "1..$ntest\n"  if (! $runtests);
Date_Init(@Date::Manip::TestArgs);

$dates="
# Tests YYMMDD time
1996061800:00:00
    1996-06-18_00:00:00

# Tests YYMMDDHHMNSS
19960618000000
    1996-06-18_00:00:00
";

print "Date (English,Internal=2)...\n";
Date_Init("Internal=2");
test_Func($ntest,\&ParseDate,$dates,$runtests);

1;
# Local Variables:
# mode: cperl
# indent-tabs-mode: nil
# cperl-indent-level: 3
# cperl-continued-statement-offset: 2
# cperl-continued-brace-offset: 0
# cperl-brace-offset: 0
# cperl-brace-imaginary-offset: 0
# cperl-label-offset: -2
# End:

