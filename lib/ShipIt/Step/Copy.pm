package ShipIt::Step::Copy;
use parent qw(ShipIt::Step);
use strict;
use warnings;
use File::Spec;
use File::Basename qw();
use File::Copy qw();
use Carp qw();

our $VERSION = '0.01';

sub init {
    my ($self, $conf) = @_;
    $self->{copy_dir} = $conf->value('copy.dir');
}

sub run {
    my ($self, $state) = @_;
    my $copy_dest_dir = $self->{copy_dir};
    $copy_dest_dir =~ s/^~/$ENV{HOME}/;
    if ( !-d $copy_dest_dir ) {
        mkdir $copy_dest_dir or Carp::croak("can't create directory $copy_dest_dir : $!");
    }
    my $new_dist_file = File::Spec->catfile($copy_dest_dir, File::Basename::basename($state->distfile));
    File::Copy::copy($state->distfile, $new_dist_file) or Carp::croak("copy failed : $!");
}

1;
__END__

=head1 NAME

ShipIt::Step::Copy - provide simple copy step for module distribution to ShipIt.

=head1 SYNOPSIS

  # in your .shipit
  steps = ..., Copy
  copy.dir = ~/Dropbox/Public/My-Module

=head1 DESCRIPTION

ShipIt::Step::Copy provides simple copy step to ShipIt. This is useful for backup to another disk or ship to public using DropBox(this usage is shown in SYNOPSIS).
It is useful for modules you don't want to upload CPAN.

=head1 AUTHOR

Takuya Tsuchida E<lt>tsucchi {at} cpan.orgE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
