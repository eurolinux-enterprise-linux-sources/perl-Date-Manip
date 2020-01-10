#!/usr/bin/perl -w

use Test::Inter;
$t = new Test::Inter 'Delta_Format';
$testdir = '';
$testdir = $t->testdir();

use Date::Manip;
if (DateManipVersion() >= 6.00) {
   $t->feature("DM6",1);
}

$t->skip_all('Date::Manip 6.xx required','DM6');


sub test {
  return Delta_Format(@_);
}

Date_Init("ForceDate=1997-03-08-12:30:00,America/New_York");

$tests="

1:2:3:4:5:6:7 4 '%yv %Mv %wv %dv %hv %mv %sv' => '1 2 3 4 5 6 7'

1:2:3:4:5:6:7 4 '%yd %Md %wd %dd %hd %md %sd' =>
  '1.1667 2.0000 3.6018 4.2126 5.1019 6.1167 7.0000'

1:2:3:4:5:6:7 0 '%yh %Mh %wh %dh %hh %mh %sh' =>
  '1 14 3 25 605 36306 2178367'

1:2:3:4:5:6:7 4 '%yt %Mt %wt %dt %ht %mt %st' =>
  '1.1667 14.0000 3.6018 25.2126 605.1019 36306.1167 2178367.0000'

1:2:3:4:5:6:7 approx 4 '%yv %Mv %wv %dv %hv %mv %sv' =>
  '1 2 3 4 5 6 7'

1:2:3:4:5:6:7 approx 4 '%yd %Md %wd %dd %hd %md %sd' =>
  '1.2357 2.8284 3.6018 4.2126 5.1019 6.1167 7.0000'

1:2:3:4:5:6:7 approx 3 '%yh %Mh %wh %dh %hh %mh %sh' =>
  '1.000 14.000 63.874 451.116 10831.790 649913.400 38994811.000'

1:2:3:4:5:6:7 approx 4 '%yt %Mt %wt %dt %ht %mt %st' =>
  '1.2357 14.8284 64.4755 451.3288 10831.8919 649913.5167 38994811.0000'

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
