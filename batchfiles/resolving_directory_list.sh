#!/bin/bash

PATHTOPROJECT=source
OUTPUTPATH=/out
FILENAME=details.xml
DITAMAPNAME=collection.ditamap
DIRECTORYLISTNAME=directory_list.txt

cd ../

cp depend/details.xml $PATHTOPROJECT/details.xml

WORKINGDIR=$PWD

echo $WORKINGDIR

cd $WORKINGDIR/$PATHTOPROJECT

#REM Set the folder path (you can change this to the desired folder)
folderPath=$WORKINGDIR/$PATHTOPROJECT

#REM Output file
outputFile=$DIRECTORYLISTNAME

#REM Clear the output file if it exists
if [ $outputFile ]
then
 rm -fr $outputFile
fi 

#REM List directories and write to the output file
find $folderPath/* -type d > $outputFile

rm -fr $WORKINGDIR/out

mkdir $WORKINGDIR/out

cd $WORKINGDIR/batchfiles

echo Path: $PWD
cd $WORKINGDIR


java -cp 'lib/saxon9he.jar:lib/resolver.jar' net.sf.saxon.Transform -s:$WORKINGDIR/$PATHTOPROJECT/$FILENAME -xsl:$WORKINGDIR/depend/xslt/generate_ditamap.xsl -o:$WORKINGDIR/out/$DITAMAPNAME -catalog:$WORKINGDIR/depend/tools/Saxon9/RWS-DTD/catalog.xml STARTING-DIR="$WORKINGDIR/$PATHTOPROJECT/" OUTPUT-DIR="$WORKINGDIR$OUTPUTPATH/" DIRECTORYLISTNAME="$DIRECTORYLISTNAME" 

rm -f $WORKINGDIR/$PATHTOPROJECT/details.xml
rm -f $WORKINGDIR$/$PATHTOPROJECT/$DIRECTORYLISTNAME

cd $WORKINGDIR/batchfiles
