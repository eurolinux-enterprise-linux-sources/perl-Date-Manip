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
$ntest=1;

print "1..$ntest\n"  if (! $runtests);
Date_Init(@Date::Manip::TestArgs);

$tests="

+0:0:0:0:9:9:1
   +0:0:0:0:9:9:1

";

print "Normalize After Business Day...\n";
test_Func($ntest,\&Test_Normalize,$tests,$runtests);

sub Test_Normalize {
  my(@args)=@_;
  my($tmp,$err);
  $tmp=ParseDateDelta(@args);
  $tmp=DateCalc("today","+ 1 business days",\$err);
  $tmp=ParseDateDelta(@args);
  return $tmp;
}

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

