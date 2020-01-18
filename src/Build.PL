use Module::Build;
use strict;
use warnings;

my %requires = (
                 'perl'                     => '5.006',
                 'Carp'                     => '0',
                 'Encode'                   => '0',
                 'IO::File'                 => '0',
                 'Storable'                 => '0',
                 'utf8'                     => '0',
               );
my %build_mods = (
                 'File::Basename'           => '0',
                 'Test::Inter'              => '0',
                 'Test::More'               => '0',
               );
my %config_mods = (
                 'Module::Build'            => '0.21',
               );

my %IsWin32 = map { $_ => 1 } qw( MSWin32 NetWare symbian );
if ($IsWin32{ $^O }) {
   $requires{'Win32::TieRegistry'} = 0;
}

my $class = Module::Build->subclass(
   class => "Module::Build::Custom",
   code  => q { sub ACTION_html { my $self = shift ; $self->SUPER::ACTION_html ( @_ ) if ( $ENV{ MAKE_HTML } ) ; } }
);

my $build = $class->new(
        license            => 'perl',
        dist_version       => '6.41',
        dist_author        => 'Sullivan Beck <sbeck@cpan.org>',
        module_name        => 'Date::Manip',
        dist_abstract      => 'Date manipulation routines',
        requires           => \%requires,
        build_requires     => \%build_mods,
        configure_requires => \%config_mods,
        sign               => 1,
        script_files => [
           'examples/dm_zdump',
           'examples/dm_date',
        ],
);

$build->create_build_script;
