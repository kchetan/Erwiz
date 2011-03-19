use Test::More;
use Data::Dump;
BEGIN {use_ok 'Erviz::Parser'};

my $text = q/[Area] { mark: "<ext.>"; color: green }

[Order]
*Order ID
 Customer ID*
 Order Date

[Bar]
Customer ID*
Order Date

[Biz]
[  Foo]
*Quux ID
 Bar ID*

[Quux  ]

[Department]
*Quux ID
 Bar ID*


[Employee] *--? [Department] <-foo>
[Foo  ] 1--* [  Bar] <quux for bar->
/;

my $parser = new_ok('Erviz::Parser');

ok(my $tree = $parser->parse($text), 'parsed ok');

warn dd $tree;

my $text = q/
  [Area {mark: "<ext.>"; color: green}
/;

ok(!$parser->parse($text), 'worng!!1');
done_testing;
