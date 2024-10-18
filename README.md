# document_version_control
This is a Perl implementation of a document version control for files in a directory.
Mostly useful when working with non-text-based documents (xls, ppt, docx) on a Windows OS.

# usage
 ```
 perl .\00_rename_file_currentdate_time_Stamp_log_dir.pl
You chose: C:/Perl_computing/rename_file_currentdateStamp/F2
[1] .
[2] ..
[3] plasmids.docx
Which file to make a time-stamped copy? (nber; 0 = exit)
3
Commit text: My first comment
```
which produces a log file "log_versions.txt" in the target directory with the commit messages.
```
plasmids_2024-10-18_11h10.docx --> My first comment
```
Repeating the operation later produces the following

```
plasmids_2024-10-18_11h14.docx --> My second comment!
plasmids_2024-10-18_11h10.docx --> My first comment
```

