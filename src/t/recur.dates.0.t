#!/usr/bin/perl -w

use Test::Inter;
$t = new Test::Inter 'dates';
$testdir = '';
$testdir = $t->testdir();

use Date::Manip;
if (DateManipVersion() >= 6.00) {
   $t->feature("DM6",1);
}

$t->skip_all('Date::Manip 6.xx required','DM6');


sub test {
  (@test)=@_;
  $err = $obj->parse(@test);
  if ($err) {
     return $obj->err();
  } else {
     @dates = $obj->dates();
     @ret   = ();
     foreach my $d (@dates) {
        $v = $d->value();
        push(@ret,$v);
     }
     return @ret;
  }
}

$obj = new Date::Manip::Recur;
$obj->config("forcedate","2000-01-21-00:00:00,America/New_York");
$obj->config("ConfigFile","$testdir/Manip.cnf");

$tests="

### All Y/M/W/D combos

# Y:M:W:D*

1:2:3:4*12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010512:30:00
   2001033012:30:00
   2002062412:30:00

1:2:3:0*12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010512:30:00
   2001032612:30:00
   2002061612:30:00

0:2:3:0*12:30:00
2000010500:00:00
2000010100:00:00
2000062100:00:00
   =>
   2000010512:30:00
   2000032612:30:00
   2000061612:30:00

1:0:3:0*12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010512:30:00
   2001012612:30:00
   2002021612:30:00

1:2:0:0*12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010512:30:00
   2001030512:30:00
   2002050512:30:00

1:0:0:0*12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010512:30:00
   2001010512:30:00
   2002010512:30:00

0:2:0:0*12:30:00
2000010500:00:00
2000010100:00:00
2000060100:00:00
   =>
   2000010512:30:00
   2000030512:30:00
   2000050512:30:00

0:0:3:0*12:30:00
2000010500:00:00
2000010100:00:00
2000030100:00:00
   =>
   2000010512:30:00
   2000012612:30:00
   2000021612:30:00

0:0:0:0*12:30:00
2000010500:00:00
2000010100:00:00
2000010320:00:00
   =>
   2000010112:30:00
   2000010212:30:00
   2000010312:30:00

# Y:M:W*D

1:2:3*4:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010612:30:00
   2001032212:30:00
   2002061312:30:00

0:2:3*4:12:30:00
2000010600:00:00
2000010100:00:00
2000070100:00:00
   =>
   2000010612:30:00
   2000032312:30:00
   2000061512:30:00

1:0:3*4:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010612:30:00
   2001012512:30:00
   2002021412:30:00

1:2:0*4:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010412:30:00
   2001030412:30:00
   2002050412:30:00

1:0:0*4:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010412:30:00
   2001010412:30:00
   2002010412:30:00

0:2:0*4:12:30:00
2000010600:00:00
2000010100:00:00
2000070100:00:00
   =>
   2000010412:30:00
   2000030412:30:00
   2000050412:30:00

0:0:3*4:12:30:00
2000010600:00:00
2000010100:00:00
2000030100:00:00
   =>
   2000010612:30:00
   2000012712:30:00
   2000021712:30:00

0:0:0*4:12:30:00
2000010500:00:00
2000010100:00:00
2000012100:00:00
   =>
   2000010612:30:00
   2000011312:30:00
   2000012012:30:00

# Y:M*W:D

1:2*3:4:12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000012012:30:00
   2001031512:30:00
   2002051612:30:00

0:2*3:4:12:30:00
2000010500:00:00
2000010100:00:00
2000060100:00:00
   =>
   2000012012:30:00
   2000031612:30:00
   2000051812:30:00

1:0*3:4:12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000012012:30:00
   2001011812:30:00
   2002011712:30:00

1:2*0:4:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010412:30:00
   2001030412:30:00
   2002050412:30:00

1:0*0:4:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010412:30:00
   2001010412:30:00
   2002010412:30:00

0:2*0:4:12:30:00
2000010600:00:00
2000010100:00:00
2000070100:00:00
   =>
   2000010412:30:00
   2000030412:30:00
   2000050412:30:00

0:0*3:4:12:30:00
2000010500:00:00
2000010100:00:00
2000040100:00:00
   =>
   2000012012:30:00
   2000021712:30:00
   2000031612:30:00

0:0*0:4:12:30:00
2000010600:00:00
2000010100:00:00
2000040100:00:00
   =>
   2000010412:30:00
   2000020412:30:00
   2000030412:30:00

# Y*M:W:D

1*2:3:4:12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000021712:30:00
   2001021512:30:00
   2002022112:30:00

0*2:3:4:12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000021712:30:00
   2001021512:30:00
   2002022112:30:00

1*0:3:4:12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000012012:30:00
   2001011812:30:00
   2002011712:30:00

1*2:0:4:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000020412:30:00
   2001020412:30:00
   2002020412:30:00

1*0:0:4:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010412:30:00
   2001010412:30:00
   2002010412:30:00

0*2:0:4:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000020412:30:00
   2001020412:30:00
   2002020412:30:00

0*0:3:4:12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000012012:30:00
   2001011812:30:00
   2002011712:30:00

0*0:0:4:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010412:30:00
   2001010412:30:00
   2002010412:30:00

# *Y:M:W:D

*1:2:3:4:12:30:00
   =>
   0001021512:30:00

*0:2:3:4:12:30:00
   =>
   2000021712:30:00

*1:0:3:4:12:30:00
   =>
   0001011812:30:00

*1:2:0:4:12:30:00
   =>
   0001020412:30:00

*1:0:0:4:12:30:00
   =>
   0001010412:30:00

*0:2:0:4:12:30:00
   =>
   2000020412:30:00

*0:0:3:4:12:30:00
   =>
   2000012012:30:00

*0:0:0:4:12:30:00
   =>
   2000010412:30:00

# Y:M:W*0

1:2:3*0:12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010312:30:00
   2001031912:30:00
   2002061012:30:00

0:2:3*0:12:30:00
2000010500:00:00
2000010100:00:00
2000070100:00:00
   =>
   2000010312:30:00
   2000032012:30:00
   2000061212:30:00

1:0:3*0:12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010312:30:00
   2001012212:30:00
   2002021112:30:00

1:2:0*0:12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010112:30:00
   2001030112:30:00
   2002050112:30:00

1:0:0*0:12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010112:30:00
   2001010112:30:00
   2002010112:30:00

0:2:0*0:12:30:00
2000010500:00:00
2000010100:00:00
2000060100:00:00
   =>
   2000010112:30:00
   2000030112:30:00
   2000050112:30:00

0:0:3*0:12:30:00
2000010500:00:00
2000010100:00:00
2000030100:00:00
   =>
   2000010312:30:00
   2000012412:30:00
   2000021412:30:00

0:0:0*0:12:30:00
2000010500:00:00
2000010100:00:00
2000011900:00:00
   =>
   2000010312:30:00
   2000011012:30:00
   2000011712:30:00

# Y:M*W:0

1:2*3:0:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000011712:30:00
   2001031912:30:00
   2002052012:30:00

0:2*3:0:12:30:00
2000010600:00:00
2000010100:00:00
2000070100:00:00
   =>
   2000011712:30:00
   2000032012:30:00
   2000051512:30:00

1:0*3:0:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000011712:30:00
   2001011512:30:00
   2002011412:30:00

1:2*0:0:12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010112:30:00
   2001030112:30:00
   2002050112:30:00

1:0*0:0:12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010112:30:00
   2001010112:30:00
   2002010112:30:00

0:2*0:0:12:30:00
2000010500:00:00
2000010100:00:00
2000060100:00:00
   =>
   2000010112:30:00
   2000030112:30:00
   2000050112:30:00

0:0*3:0:12:30:00
2000010600:00:00
2000010100:00:00
2000040100:00:00
   =>
   2000011712:30:00
   2000022112:30:00
   2000032012:30:00

0:0*0:0:12:30:00
2000010600:00:00
2000010100:00:00
2000040100:00:00
   =>
   2000010112:30:00
   2000020112:30:00
   2000030112:30:00

# Y*M:W:0

1*2:3:0:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000022112:30:00
   2001021912:30:00
   2002021812:30:00

0*2:3:0:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000022112:30:00
   2001021912:30:00
   2002021812:30:00

1*0:3:0:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000011712:30:00
   2001011512:30:00
   2002011412:30:00

1*2:0:0:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000020112:30:00
   2001020112:30:00
   2002020112:30:00

1*0:0:0:12:30:00
2000010500:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010112:30:00
   2001010112:30:00
   2002010112:30:00

0*2:0:0:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000020112:30:00
   2001020112:30:00
   2002020112:30:00

0*0:3:0:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000011712:30:00
   2001011512:30:00
   2002011412:30:00

0*0:0:0:12:30:00
2000010600:00:00
2000010100:00:00
2003010100:00:00
   =>
   2000010112:30:00
   2001010112:30:00
   2002010112:30:00

# *Y:M:W:0

*1:2:3:0:12:30:00
   =>
   0001021912:30:00

*0:2:3:0:12:30:00
   =>
   2000022112:30:00

*1:0:3:0:12:30:00
   =>
   0001011512:30:00

*0:0:3:0:12:30:00
   =>
   2000011712:30:00

*1:2:0:0:12:30:00
   =>
   0001020112:30:00

*0:2:0:0:12:30:00
   =>
   2000020112:30:00

*9:0:0:0:12:30:00
   =>
   0009010112:30:00

*0:0:0:0:12:30:00
   =>
   2000010112:30:00

### English tests

'every Tuesday in June 1997'
   =>
   1997060300:00:00
   1997061000:00:00
   1997061700:00:00
   1997062400:00:00

'every Tuesday in June'
__undef__
2000010100:00:00
2000123100:00:00
   =>
   2000060600:00:00
   2000061300:00:00
   2000062000:00:00
   2000062700:00:00

'2nd Tuesday in June 1997'
   =>
   1997061000:00:00

'2nd Tuesday in June'
__undef__
2000010100:00:00
2000123100:00:00
   =>
   2000061300:00:00

'last Tuesday in June 1997'
   =>
   1997062400:00:00

'last Tuesday in June'
__undef__
2000010100:00:00
2000123100:00:00
   =>
   2000062700:00:00

'every Tuesday of every month in 1997'
__undef__
1997060100:00:00
1997063023:00:00
   =>
   1997060300:00:00
   1997061000:00:00
   1997061700:00:00
   1997062400:00:00

'every Tuesday of every month'
__undef__
2000060100:00:00
2000063023:00:00
   =>
   2000060600:00:00
   2000061300:00:00
   2000062000:00:00
   2000062700:00:00

'2nd Tuesday of every month in 1997'
__undef__
1997040100:00:00
1997063023:00:00
   =>
   1997040800:00:00
   1997051300:00:00
   1997061000:00:00

'2nd Tuesday of every month'
__undef__
2000040100:00:00
2000063023:00:00
   =>
   2000041100:00:00
   2000050900:00:00
   2000061300:00:00

'last Tuesday of every month in 1997'
__undef__
1997040100:00:00
1997063000:00:00
   =>
   1997042900:00:00
   1997052700:00:00
   1997062400:00:00

'last Tuesday of every month'
__undef__
2000040100:00:00
2000063000:00:00
   =>
   2000042500:00:00
   2000053000:00:00
   2000062700:00:00

'every day of every month in 1997'
__undef__
1997042900:00:00
1997050200:00:00
   =>
   1997042900:00:00
   1997043000:00:00
   1997050100:00:00
   1997050200:00:00

'every day of every month'
__undef__
2000042900:00:00
2000050200:00:00
   =>
   2000042900:00:00
   2000043000:00:00
   2000050100:00:00
   2000050200:00:00

'2nd day of every month in 1997'
__undef__
1997040100:00:00
1997070100:00:00
   =>
   1997040200:00:00
   1997050200:00:00
   1997060200:00:00

'2nd day of every month'
__undef__
2000040100:00:00
2000070100:00:00
   =>
   2000040200:00:00
   2000050200:00:00
   2000060200:00:00

'last day of every month in 1997'
__undef__
1997040100:00:00
1997070100:00:00
   =>
   1997043000:00:00
   1997053100:00:00
   1997063000:00:00

'last day of every month'
__undef__
2000040100:00:00
2000070100:00:00
   =>
   2000043000:00:00
   2000053100:00:00
   2000063000:00:00

'every day in 1997'
__undef__
1997042900:00:00
1997050200:00:00
   =>
   1997042900:00:00
   1997043000:00:00
   1997050100:00:00
   1997050200:00:00

'every day'
__undef__
2000042900:00:00
2000050200:00:00
   =>
   2000042900:00:00
   2000043000:00:00
   2000050100:00:00
   2000050200:00:00

'every 2nd day in 1997'
1997043000:00:00
1997042900:00:00
1997050200:00:00
   =>
   1997043000:00:00
   1997050200:00:00

'every 2nd day'
2000043000:00:00
2000042900:00:00
2000050200:00:00
   =>
   2000043000:00:00
   2000050200:00:00

'every 2 days in 1997'
1997043000:00:00
1997042900:00:00
1997050200:00:00
   =>
   1997043000:00:00
   1997050200:00:00

'every 2 days'
2000043000:00:00
2000042900:00:00
2000050200:00:00
   =>
   2000043000:00:00
   2000050200:00:00

### Base date outside range

'every 2 days'
1997053000:00:00
1997042900:00:00
1997050200:00:00
   =>
   1997043000:00:00
   1997050200:00:00

'every 2 days'
1997040200:00:00
1997042900:00:00
1997050200:00:00
   =>
   1997043000:00:00
   1997050200:00:00

### Ranges and negative values

0:0:0:2*12-13:0,30:0
1997053000:00:00
1997042900:00:00
1997050300:00:00
   =>
   1997043012:00:00
   1997043012:30:00
   1997043013:00:00
   1997043013:30:00
   1997050212:00:00
   1997050212:30:00
   1997050213:00:00
   1997050213:30:00

0:1*2--2:2:12:0:0
__undef__
2000010100:00:00
2000022923:59:59
   =>
   2000011112:00:00
   2000011812:00:00
   2000020812:00:00
   2000021512:00:00
   2000022212:00:00

1:2*-1:4:12:0:0
2000010100:00:00
2000010100:00:00
2002123100:00:00
   =>
   2000012712:00:00
   2001032912:00:00
   2002053012:00:00

1*2:-1:4:12:0:0
2000010100:00:00
2000010100:00:00
2002123100:00:00
   =>
   2000022412:00:00
   2001022212:00:00
   2002022812:00:00

1:0*-3:4:12:00:00
2000010100:00:00
2000010100:00:00
2002123100:00:00
   =>
   2000121412:00:00
   2001121312:00:00
   2002121212:00:00

1*1:0:-2:12:0:0
2000010100:00:00
2000010100:00:00
2002123100:00:00
   =>
   2000013012:00:00
   2001013012:00:00
   2002013012:00:00

1*0:0:-2:12:0:0
2000010100:00:00
2000010100:00:00
2002123100:00:00
   =>
   2000123012:00:00
   2001123012:00:00
   2002123012:00:00

### Modifiers

1*1:0:1:12:0:0
easter
__undef__
2000010100:00:00
2002123123:59:59
   =>
   2000042312:00:00
   2001041512:00:00
   2002033112:00:00

0:1*0:15:12:0:0
pd3
__undef__
2000010100:00:00
2000033123:59:59
   =>
   2000011212:00:00
   2000020912:00:00
   2000030812:00:00

0:1*0:15:12:0:0
pt3
__undef__
2000010100:00:00
2000033123:59:59
   =>
   2000011212:00:00
   2000020912:00:00
   2000031512:00:00

0:1*0:15:12:0:0
nd3
__undef__
2000010100:00:00
2000033123:59:59
   =>
   2000011912:00:00
   2000021612:00:00
   2000032212:00:00

0:1*0:15:12:0:0
nt3
__undef__
2000010100:00:00
2000033123:59:59
   =>
   2000011912:00:00
   2000021612:00:00
   2000031512:00:00

0:1*0:15:12:0:0
fd2
__undef__
2000010100:00:00
2000033123:59:59
   =>
   2000011712:00:00
   2000021712:00:00
   2000031712:00:00

0:1*0:15:12:0:0
bd2
__undef__
2000010100:00:00
2000033123:59:59
   =>
   2000011312:00:00
   2000021312:00:00
   2000031312:00:00

0:1*0:15:12:0:0
fw4
__undef__
2000010100:00:00
2000033123:59:59
   =>
   2000012412:00:00
   2000022212:00:00
   2000032112:00:00

0:1*0:15:12:0:0
bw4
__undef__
2000010100:00:00
2000033123:59:59
   =>
   2000011112:00:00
   2000020912:00:00
   2000030912:00:00

0:1*0:15:12:0:0
nwd
__undef__
2000010100:00:00
2000033123:59:59
   =>
   2000011812:00:00
   2000021512:00:00
   2000031512:00:00

0:1*0:15:12:0:0
pwd
__undef__
2000010100:00:00
2000033123:59:59
   =>
   2000011412:00:00
   2000021512:00:00
   2000031512:00:00

*2002:7:0:10:12:00:00
cwd
__undef__
__undef__
__undef__
   =>
   2002071112:00:00

*2002:7:0:10:12:00:00
cwn
__undef__
__undef__
__undef__
   =>
   2002071112:00:00

*2002:7:0:10:12:00:00
cwp
__undef__
__undef__
__undef__
   =>
   2002070912:00:00

*2002:7:0:20:12:00:00
cwd
__undef__
__undef__
__undef__
   =>
   2002071912:00:00

*2002:7:0:20:12:00:00
cwn
__undef__
__undef__
__undef__
   =>
   2002071912:00:00

*2002:7:0:20:12:00:00
cwp
__undef__
__undef__
__undef__
   =>
   2002071912:00:00

*2002:7:0:21:12:00:00
cwd
__undef__
__undef__
__undef__
   =>
   2002072212:00:00

*2002:7:0:21:12:00:00
cwn
__undef__
__undef__
__undef__
   =>
   2002072212:00:00

*2002:7:0:21:12:00:00
cwp
__undef__
__undef__
__undef__
   =>
   2002072212:00:00

*2002:7:0:5:12:00:00
cwd
__undef__
__undef__
__undef__
   =>
   2002070312:00:00

*2002:7:0:5:12:00:00
cwn
__undef__
__undef__
__undef__
   =>
   2002070312:00:00

*2002:7:0:5:12:00:00
cwp
__undef__
__undef__
__undef__
   =>
   2002070312:00:00

*2003:7:0:5:12:00:00
cwd
__undef__
__undef__
__undef__
   =>
   2003070712:00:00

*2003:7:0:5:12:00:00
cwn
__undef__
__undef__
__undef__
   =>
   2003070712:00:00

*2003:7:0:5:12:00:00
cwp
__undef__
__undef__
__undef__
   =>
   2003070312:00:00

*2002:7:0:10:12:00:00
nwd
__undef__
__undef__
__undef__
   =>
   2002071012:00:00

*2002:7:0:10:12:00:00
pwd
__undef__
__undef__
__undef__
   =>
   2002071012:00:00

*2002:7:0:10:12:00:00
dwd
__undef__
__undef__
__undef__
   =>
   2002071012:00:00

*2002:7:0:20:12:00:00
nwd
__undef__
__undef__
__undef__
   =>
   2002072212:00:00

*2002:7:0:20:12:00:00
pwd
__undef__
__undef__
__undef__
   =>
   2002071912:00:00

*2002:7:0:20:12:00:00
dwd
__undef__
__undef__
__undef__
   =>
   2002071912:00:00

*2002:7:0:21:12:00:00
nwd
__undef__
__undef__
__undef__
   =>
   2002072212:00:00

*2002:7:0:21:12:00:00
pwd
__undef__
__undef__
__undef__
   =>
   2002071912:00:00

*2002:7:0:21:12:00:00
dwd
__undef__
__undef__
__undef__
   =>
   2002072212:00:00

*2002:7:0:5:12:00:00
nwd
__undef__
__undef__
__undef__
   =>
   2002070512:00:00

*2002:7:0:5:12:00:00
pwd
__undef__
__undef__
__undef__
   =>
   2002070512:00:00

*2002:7:0:5:12:00:00
dwd
__undef__
__undef__
__undef__
   =>
   2002070512:00:00

*2003:7:0:5:12:00:00
nwd
__undef__
__undef__
__undef__
   =>
   2003070712:00:00

*2003:7:0:5:12:00:00
pwd
__undef__
__undef__
__undef__
   =>
   2003070312:00:00

*2003:7:0:5:12:00:00
dwd
__undef__
__undef__
__undef__
   =>
   2003070712:00:00

### Test dates that modifers/rtimes push outside the range
### and dates that started outside the range, but modifiers
### and rtimes pushed inside

0:0:0:3*0:0:0
bd2
1999020200:00:00
1999020100:00:00
1999020800:00:00
   =>
   1999020300:00:00
   1999020600:00:00

0:0:1:0:0:0:0
__undef__
2011-03-01
2011-03-10
   =>
   2011030100:00:00
   2011030800:00:00

### Test slow dates with base dates outside the range.

0:2*4--1:2:0:0:0
__undef__
2011020100:00:00
2011070100:00:00
2011110100:00:00
   =>
   2011082300:00:00
   2011083000:00:00
   2011102500:00:00

0:2*4--1:2:0:0:0
__undef__
2011120100:00:00
2011070100:00:00
2011110100:00:00
   =>
   2011082300:00:00
   2011083000:00:00
   2011102500:00:00

0:2*5--1:2:0:0:0
__undef__
2011010100:00:00
2011020100:00:00
2011110100:00:00
   =>
   2011032900:00:00
   2011053100:00:00

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
