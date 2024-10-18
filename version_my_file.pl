#! perl
# Author: A. Ramette, Bern, Switzerland
# Date: 2024-10-18
use strict;
use warnings;
use feature qw(say);
use File::Copy;
use Win32::GUI;
my $dos = Win32::GUI::GetPerlWindow();
Win32::GUI::Hide($dos);
# Rename the selected fiels with date and time, and logs the commit message
# The program must be copied in the right DIR!!!


my ($sec,$min,$hour,$day,$month,$yr19,@rest) =   localtime(time);#####
my $Month=$month+1;
my $Year=$yr19+1900;
if($Month<10){$Month="0".$Month};
if($day<10){$day="0".$day};
##To get the localtime of your system
my $currentDate=$Year."-".$Month."-".$day."_".$hour."h".$min; #### 2021-02-19

# my $Fileprefix=".docx";
# my $Fileprefix="*";

# choose directory
use Tk;

my $mw = MainWindow->new;


my $dir = $mw->chooseDirectory(
    -initialdir => '/home',  # Set the starting directory
    -title      => 'Please select a directory'
);

if (defined $dir) {
    print "You chose: $dir\n";
} else {
    print "No directory selected.\n";
}

MainLoop;
# storing file names in that directory
opendir(DIR, $dir) or die "cannot open the current dir";
my @files = readdir(DIR);	# all files in the DIR selected
# @files = grep(!/^\.+$/, @files);#to avoid also capturing . and ..
# my @F = grep(/$Fileprefix$/,@files) or die "cannot find file with  $Fileprefix prefix!";	#@files contains all dta files
my @F=@files; #selecting all files
closedir(DIR);

my $Nfiles=scalar @F;
for my $i (0..($Nfiles-1)){
	my $J=$i+1;
 say "[$J] $F[$i]";
}


say "Which file to make a time-stamped copy? (nber; 0 = exit)";
my $ANS=<STDIN>; chomp $ANS;
if ($ANS == 0) {exit} else{
	#say $F[$ANS-1];
	if(-e $F[$ANS-1]){#say "file exits!"
	my $NFile=$F[$ANS-1];
	my @Parts=split(/\./,$NFile);
	if (scalar(@Parts)>2){say "The filename must contain only one dot before the prefix. Exiting";exit}
	my $stub=$Parts[0];
	# say $stub;
	my $Fileprefix=$Parts[1];
	# say length($Fileprefix);
	if ( length($Fileprefix)>4){say "error with the fileprefix (too long). Exiting";exit}
	# say $Fileprefix; 
	# $NFile=~s/$Fileprefix/_$currentDate$Fileprefix/;
	 my $NFile1=$stub."_".$currentDate.".".$Fileprefix;
		copy($F[$ANS-1],$NFile1);
		#log the info in the fist line
		print "Commit text: ";
		my $CommitText=<>;
		my  $newline= "$NFile1 --> $CommitText";
		my $filename="$dir/log_versions.txt";
		unless(-e $filename) {open my $fh, '>', $filename}
		# ------------------------
		open my $fh, '<', $filename or die "Could not open file log_versions.txt!";
		my @lines = <$fh>;
		close $fh;
		# Add the new line to the beginning of the array
		unshift @lines, $newline;

		# Write the modified array back to the file
		open $fh, '>', $filename or die "Could not open file '$filename': $!";
		print $fh @lines;
		close $fh;
		
	}
}


