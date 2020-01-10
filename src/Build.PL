use Module::Build;
use strict;
use warnings;

my %requires = (
                 'perl'                     => '5.006',
                 'Carp'                     => '0',
                 'Encode'                   => '0',
                 'Exporter'                 => '0',
                 'IO::File'                 => '0',
                 'Storable'                 => '0',
                 'YAML::Syck'               => '0',
               );
my %build_mods = (
                 'Test::Inter'              => '0',
               );

my %IsWin32 = map { $_ => 1 } qw( MSWin32 NetWare symbian );
if ($IsWin32{ $^O }) {
   $requires{'Win32::TieRegistry'} = 0;
}

my $build = Module::Build->new(
        license            => 'perl',
        dist_version       => '6.24',
        dist_author        => 'Sullivan Beck <sbeck@cpan.org>',
        module_name        => 'Date::Manip',
        dist_abstract      => 'Date manipulation routines',
        requires           => \%requires,
        build_requires     => \%build_mods,
        sign               => 1,
);

$build->create_build_script;
