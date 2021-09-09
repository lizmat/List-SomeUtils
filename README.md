[![Actions Status](https://github.com/lizmat/List-SomeUtils/workflows/test/badge.svg)](https://github.com/lizmat/List-SomeUtils/actions)

NAME
====

Raku port of Perl's List::SomeUtils module 0.56

SYNOPSIS
========

    # import specific functions
    use List::SomeUtils <any uniq>;

    if any { /foo/ }, uniq @has_duplicates {
        # do stuff
    }

    # import everything
    use List::SomeUtils ':all';

DESCRIPTION
===========

This module tries to mimic the behaviour of Perl's `List::SomeUtils` module as closely as possible in the Raku Programming Language.

List::SomeUtils is a functional copy of [List::MoreUtils](List::MoreUtils). As for the reasons of its existence, please check the documentation of the Perl version.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/List-SomeUtils . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2018, 2019, 2020, 2021 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

