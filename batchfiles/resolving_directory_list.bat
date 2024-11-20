set PATHTOPROJECT=Source
set OUTPUTPATH=\out
set FILENAME=details.xml
set DITAMAPNAME=collection.ditamap
set DIRECTORYLISTNAME=directory_list.txt

cd ..\

copy depend\details.xml %PATHTOPROJECT%\details.xml

set WORKINGDIR=%CD%

cd %WORKINGDIR%\%PATHTOPROJECT%

:: Set the folder path (you can change this to the desired folder)
set "folderPath=%WORKINGDIR%\%PATHTOPROJECT%"

:: Output file
set "outputFile=%DIRECTORYLISTNAME%"

:: Clear the output file if it exists
if exist "%outputFile%" del "%outputFile%"

:: List directories and write to the output file
for /d %%D in ("%folderPath%\*") do (
    echo %%D >> "%outputFile%"
)

rd /s /q %WORKINGDIR%\out\

mkdir %WORKINGDIR%\out\

cd %WORKINGDIR%\batchfiles

java -cp %WORKINGDIR%/depend/tools/saxon9/saxon9he.jar;%WORKINGDIR%\depend\tools\Saxon9\xml-commons-resolver-1.2\resolver.jar ^
-Dxml.catalog.files=..\depend\tools\Saxon9\RWS-DTD\catalog.xml ^
net.sf.saxon.Transform ^
-r:org.apache.xml.resolver.tools.CatalogResolver ^
-x:org.apache.xml.resolver.tools.ResolvingXMLReader ^
-y:org.apache.xml.resolver.tools.ResolvingXMLReader ^
-o:%WORKINGDIR%\out\%DITAMAPNAME% ^
-s:%WORKINGDIR%\%PATHTOPROJECT%\%FILENAME% ^
-xsl:%WORKINGDIR%\depend\xslt\generate_ditamap.xsl ^
STARTING-DIR="%WORKINGDIR%/%PATHTOPROJECT%/" OUTPUT-DIR="%WORKINGDIR%%OUTPUTPATH%/" DIRECTORYLISTNAME="%DIRECTORYLISTNAME%" 

del %WORKINGDIR%\%PATHTOPROJECT%\details.xml
del %WORKINGDIR%\%PATHTOPROJECT%\%DIRECTORYLISTNAME%

cd %WORKINGDIR%\batchfiles

