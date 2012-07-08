use inc::Module::Install;
name 'ShipIt-Step-Copy';
all_from 'lib/ShipIt/Step/Copy.pm';
readme_from 'lib/ShipIt/Step/Copy.pm';
readme_markdown_from 'lib/ShipIt/Step/Copy.pm';
readme_pod_from 'lib/ShipIt/Step/Copy.pm';
githubmeta;

requires 'ShipIt';
requires 'parent';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
