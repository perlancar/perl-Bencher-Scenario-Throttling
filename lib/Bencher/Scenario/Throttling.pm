package Bencher::Scenario::Throttling;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark modules that do throttling',
    participants => [
        {
            name => 'Data::Throttler (Memory backend)',
            module => 'Data::Throttler',
            code_template => 'my $t = Data::Throttler->new(max_items=><max_items>, interval=><interval>); for (1..<inserts>) { $t->try_push }',
        },
        # XXX Data::Valve currently not installable from CPAN
        {
            name => 'Data::Throttler_CHI (Memory backend)',
            module => 'Data::Throttler_CHI',
            code_template => 'require CHI; my $t = Data::Throttler_CHI->new(max_items=><max_items>, interval=><interval>, cache=>CHI->new(driver=>"Memory", datastore=>{})); for (1..<inserts>) { $t->try_push }',
        },
    ],
    datasets => [
        {name=>'max_items=1000, interval=3600, inserts/checks=1000', args=>{max_items=>1000, interval=>3600, inserts=>1000}},
        {name=>'max_items=100, interval=3600, inserts/checks=100', args=>{max_items=>100, interval=>3600, inserts=>100}},
        {name=>'max_items=10, interval=3600, inserts/checks=10', args=>{max_items=>10, interval=>3600, inserts=>10}},
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO
