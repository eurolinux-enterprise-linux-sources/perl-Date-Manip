#!/usr/bin/perl -w

use Test::Inter;
$t = new Test::Inter 'set';
$testdir = '';
$testdir = $t->testdir();

use Date::Manip;
if (DateManipVersion() >= 6.00) {
   $t->feature("DM6",1);
}

$t->skip_all('Date::Manip 6.xx required','DM6');


sub test {
  (@test)=@_;
  $err = $obj->set(@test);
  if ($err) {
     return $obj->err();
  } else {
     $val = $obj->value();
     return $val;
  }
}

$obj = new Date::Manip::Delta;
$obj->config("forcedate","now,America/New_York");

$tests="

delta    [ 0 0 0 0 10 20 30 ]           => +0:0:+0:0:10:20:30

delta    [ 10 20 30 ]                   => +0:0:+0:0:10:20:30

delta    [ 10 ]                         => +0:0:+0:0:0:0:10

delta    [ -10 ]                        => +0:0:-0:0:0:0:10

delta    [ 10 70 ]                      => +0:0:+0:0:0:11:10

delta    [ 10 -70 -130 +90 ]            => +0:0:+0:6:23:51:30

delta    [ 1 13 2 10 -70 -130 90 ]      => +2:1:+2:6:23:51:30

delta    [ -1 -13 -2 -10 70 -130 -90 ]  => -2:1:-3:0:4:11:30

business [ 10 ]                         => +0:0:+0:+0:0:0:10

business [ 10 70 ]                      => +0:0:+0:+0:0:11:10

business [ 10 -25 -130 +90 ]            => +0:0:+0:+6:8:51:30

business [ 1 13 2 10 -25 -130 +90 ]     => +2:1:+2:+6:8:51:30

business [ -1 -13 -2 -10 +25 -130 -90 ] => -2:1:-2:-7:4:11:30

";

$t->tests(func  => \&test,
          tests => $tests);
$t->done_testing();

#Local Variables:
#mode: cperl
#indent-tabs-mode: nil
#cperl-indent-level: 3
#cperl-continued-statement-offset: 2
#cperl-continued-brace-offset: 0
#cperl-brace-offset: 0
#cperl-brace-imaginary-offset: 0
#cperl-label-offset: -2
#End:
