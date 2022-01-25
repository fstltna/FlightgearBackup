#!/usr/bin/perl

# Set these for your situation
my $MTDIR = "/home/flightgear/fgms-0-x /home/flightgear/local";
my $BACKUPDIR = "/home/flightgear/backups";
my $TARCMD = "/bin/tar czf";

#-------------------
# No changes below here...
#-------------------
my $VERSION = "1.0";

print "FlightgearBackup.pl version $VERSION\n";
print "=================================\n";
if (! -d $BACKUPDIR)
{
	print "Backup dir $BACKUPDIR not found, creating...\n";
	system("mkdir -p $BACKUPDIR");
}
print "Moving existing backups: ";

if (-f "$BACKUPDIR/flightgearbackup-5.tgz")
{
	unlink("$BACKUPDIR/flightgearbackup-5.tgz")  or warn "Could not unlink $BACKUPDIR/flightgearbackup-5.tgz: $!";
}
if (-f "$BACKUPDIR/flightgearbackup-4.tgz")
{
	rename("$BACKUPDIR/flightgearbackup-4.tgz", "$BACKUPDIR/flightgearbackup-5.tgz");
}
if (-f "$BACKUPDIR/flightgearbackup-3.tgz")
{
	rename("$BACKUPDIR/flightgearbackup-3.tgz", "$BACKUPDIR/flightgearbackup-4.tgz");
}
if (-f "$BACKUPDIR/flightgearbackup-2.tgz")
{
	rename("$BACKUPDIR/flightgearbackup-2.tgz", "$BACKUPDIR/flightgearbackup-3.tgz");
}
if (-f "$BACKUPDIR/flightgearbackup-1.tgz")
{
	rename("$BACKUPDIR/flightgearbackup-1.tgz", "$BACKUPDIR/flightgearbackup-2.tgz");
}
print "Done\nCreating New Backup: ";
system("$TARCMD $BACKUPDIR/flightgearbackup-1.tgz $MTDIR");
print("Done!\n");
exit 0;
