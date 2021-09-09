use v6.*;

module List::SomeUtils:ver<0.0.8>:auth<zef:lizmat> {
    use List::MoreUtils:ver<0.0.9>:auth<zef:lizmat>;

    BEGIN {
        trait_mod:<is>(
          (List::SomeUtils::{.key} = .value),   # make it available externally
          :SYMBOL(.key),                        # use this name, not its own
          :export(:all)                         # make it export with :all
        ) for List::MoreUtils::EXPORT::all::.grep(*.key.starts-with("&"))
    }
}

sub EXPORT(*@args, *%_) {
    if @args {
        my $imports := Map.new( |(EXPORT::all::{ @args.map: '&' ~ * }:p) );
        if $imports != @args {
            die "List::MoreUtils doesn't know how to export: "
              ~ @args.grep( { !$imports{$_} } ).join(', ')
        }
        $imports
    }
    else {
        Map.new
    }
}

=begin pod

=head1 NAME

Raku port of Perl's List::SomeUtils module 0.56

=head1 SYNOPSIS

    # import specific functions
    use List::SomeUtils <any uniq>;

    if any { /foo/ }, uniq @has_duplicates {
        # do stuff
    }

    # import everything
    use List::SomeUtils ':all';

=head1 DESCRIPTION

This module tries to mimic the behaviour of Perl's C<List::SomeUtils> module
as closely as possible in the Raku Programming Language.

List::SomeUtils is a functional copy of L<List::MoreUtils>.  As for the
reasons of its existence, please check the documentation of the Perl version.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/List-SomeUtils . Comments
and Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018, 2019, 2020, 2021 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
