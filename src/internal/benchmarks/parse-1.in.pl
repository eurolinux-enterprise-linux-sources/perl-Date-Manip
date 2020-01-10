#!/usr/bin/perl

use Date::Manip::Base;
$dmb = new Date::Manip::Base;
%m = qw(1  January
        2  February
        3  March
        4  APRIL
        5  MAY
        6  JUNE
        7  Jul
        8  Aug
        9  Sep
        10 oct
        11 nov
        12 dec);

$h  = 0;
$mn = 0;
foreach $y (1970..2000) {
   foreach $m (1..12) {
      $mmm = $m{$m};
      foreach $d (1..$dmb->days_in_month($y,$m)) {
         $h  = "0$h"   if (length($h) < 2);
         $mn = "0$mn"  if (length($mn) < 2);
         print "$mmm $d, $y $h:$mn:00\n";
         $h  += 1;
         $h   = 0  if ($h > 23);
         $mn += 5;
         $mn  = 0  if ($mn > 59);
      }
   }
}

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
