package HTTP::Tiny::Error;

#A placeholder base class so that all error objects are
#of the same base class.

sub create {
    my ($type, @args) = @_;

    $type = __PACKAGE__ . "::$type";

    #“local $@” doesn’t always work in older perls.
    my $err = $@;

    eval "require $type" or die;

    $@ = $err;

    return $type->new(@args);
}

sub type {
    my $ref = ref $_[0];

    return substr( $ref, 1 + rindex( $ref, ':' ) );
}

1;
