#!/usr/bin/perl -I./lib -I../lib
#
#	$Id$
#	$Author$
#

use XMLRPC::Transport::HTTP;
use Data::Dumper;

my $version = "0.1";
my $protocolversion = 0.1;
my $quiet = 0;
my $port = 12345;
my $path = '/root/FMSF/remitt';

# Place where we keep the global configuration
#my $config = { };
my $debug = 1;

my $plugin_types = [
	'Render',
	'Translation',
	'Transport'
];

if (!$quiet) {
	print "REMITT (XMLRPC Server) v$version\n";
}

$daemon = XMLRPC::Transport::HTTP::Daemon
	-> new ( 
		LocalPort => $port,
		Reuse => 1
	 )
	-> dispatch_to('Remitt::Interface')
	-> options({ compress_threshold => 10000 });
if (!$quiet) {
	print " * Running at ", $daemon->url, "\n";
	print " * Starting daemon ... \n";
}
$daemon->handle;

