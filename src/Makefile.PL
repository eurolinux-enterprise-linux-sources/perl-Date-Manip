
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME             => 'Date::Manip',
	VERSION	         => '5.54',
	($] >= 5.005
	? (ABSTRACT=>'date manipulation routines',
	   AUTHOR  =>'Sullivan Beck (sbeck@cpan.org)')
	: ()),
	'dist' => {COMPRESS=>'gzip',SUFFIX=>'gz'},
        PL_FILES  => {},
	PREREQ_PM => {
		'Carp'                => '0',
		'IO::File'            => '0',
		'Test::More'          => '0',
		'Test::Pod'           => '0',
		'Test::Pod::Coverage' => '0',
	},
);
