
use ExtUtils::MakeMaker;
use 5.006;
use strict;
use warnings;
my %requires = (
                 'Carp'                     => '0',
                 'Encode'                   => '0',
                 'Exporter'                 => '0',
                 'IO::File'                 => '0',
                 'Storable'                 => '0',
                 'YAML::Syck'               => '0',
                 'Test::Inter'              => '0',
               );

my %IsWin32 = map { $_ => 1 } qw( MSWin32 NetWare symbian );
if ($IsWin32{ $^O }) {
   $requires{'Win32::TieRegistry'} = 0;
}

WriteMakefile(
        NAME             => 'Date::Manip',
        VERSION          => '6.24',
        ($] >= 5.006
        ? (ABSTRACT=>'Date manipulation routines',
           AUTHOR  =>'Sullivan Beck (sbeck@cpan.org)')
        : ()),
        'dist' => {COMPRESS=>'gzip',SUFFIX=>'gz'},
        PL_FILES  => {},
        PREREQ_PM => \%requires,
);
