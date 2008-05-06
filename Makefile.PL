# generate Makefile for building Pod::Html
#
# Copyright (C) 2008 David Landgren

use strict;
use ExtUtils::MakeMaker;

eval "use ExtUtils::MakeMaker::Coverage";
$@ or print "Adding testcover target\n";

my @license =
    do {
        my $version = $ExtUtils::MakeMaker::VERSION;
        $version =~ tr/_//d;
        $version
    } > 6.30
    ? qw(LICENSE perl)
    : ();

WriteMakefile(
    NAME          => 'Pod::Html',
    VERSION_FROM  => 'Html.pm',
    ABSTRACT_FROM => 'Html.pm',
    AUTHOR        => 'David Landgren',
    INSTALLDIRS   => ($] >= 5.008001 ? 'perl' : 'site'),
    clean => {
        FILES => 'cover_db t/*.html-t t/*.out
			t/subdir/pod2htm?.tmp pod2htm?.tmp t/die-end.html',
    },
    PREREQ_PM => {
        'Carp'             => 0,
        'Config'           => 0,
        'Cwd'              => 0,
        'File::Spec'       => 0,
        'File::Spec::Unix' => 0,
        'Getopt::Long'     => 0,
    },
    @license,
);

