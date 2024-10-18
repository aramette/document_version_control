# version_my_file.pl
This is a Perl implementation for a version control for files in a directory.
Mostly useful when working with non-text-based documents (xls, ppt, docx) on a Windows OS in a local environment, for which version control is not well developped.
The script adds a date and time stamps to the file name and log the commit message to the same directory (newest commits on top of the log file).

# Usage
 ```
 perl .\version_my_file.pl
 ```

A Tk window appears to make you select the target directory 

You chose: C:/rename_file_currentdateStamp/F2
then the program lists all the files in the target directory: 
```
[1] .
[2] ..
[3] plasmids.docx
Which file to make a time-stamped copy? (nber; 0 = exit)
3
Commit text: My first comment
```
which produces a log file "log_versions.txt" in the target directory with the associated commit message for file "plasmids.docx" listed in the [3] position.
```
plasmids_2024-10-18_11h10.docx --> My first comment
```
A copy is made in the target directory and a date (YYYY-MM-DD_Hhm) is appended to the new file name.

Repeating the operation later produces the following text in the "log_versions.txt".

```
plasmids_2024-10-18_11h14.docx --> My second comment!
plasmids_2024-10-18_11h10.docx --> My first comment
```

# Installation
 ```
>cpan install File::Copy
>cpan install Win32::GUI
 ```
Tested with: perl 5, version 26, subversion 1 (v5.26.1) built for MSWin32-x64-multi-thread
