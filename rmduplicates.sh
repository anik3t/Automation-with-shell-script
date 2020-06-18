#!/bin/bash
#remove duplicate occurrences of the file
ls -lS --time-style=long-iso | awk 'BEGIN {
getline; getline;
name1=$8; size=$5
}
{
	name2=$8;
	if (size==$5)
		{
			"md5sum "name1 | getline; csum1=$1;
			"md5sum "name2 | getline; csum2=$1;
			if ( csum1==csum2 )
				{
					print name1; print name2
				}
		};
	size=$5; name1=name2;
}' | sort -u > duplicate_files #sorted list of files are fed to comm and first 32 characters of file contains the hash which is used by md5sum
cat duplicate_files | xargs -I {} md5sum {} | sort | uniq -w 32 |
	awk '{ print "^"$2"$" }' | sort -u > duplicate_sample
	echo Removing..
	comm duplicate_files duplicate_sample -2 -3 | tee /dev/stderr |
		xargs rm
			rm duplicate_sample
			#duplicate files to be removed are kept in duplicate_files and the original copy to be preserved is kept in duplicates_samples
			echo Removed duplicates files successfully

