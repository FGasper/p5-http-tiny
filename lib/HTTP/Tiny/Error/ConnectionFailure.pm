package HTTP::Tiny::Error::ConnectionFailure;

use strict;

use parent 'HTTP::Tiny::Error';

sub new {
    my ($class, $host, $port, $why) = @_;

    return bless [ $host, $port, $why ], $class;
}

sub host   { return $_[0][0] }
sub port   { return $_[0][1] }
sub reason { return $_[0][2] }

sub to_string { return "Yo! Could not connect to '$_[0][0]:$_[0][1]': $_[0][2]"; }

1;
