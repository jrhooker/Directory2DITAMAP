<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions">
    
    <xsl:template match="/">
        
        <xsl:variable name="directories" select="fn:unparsed-text('file:///C:/Projects/Directory2DITAMAP/dita_conversion/directory_list.txt')"/>
        
        <xsl:variable name="list" select="tokenize($directories, '&#xD;')"/>
        
        <html>
            <body>
                <h1>Property Images</h1>
                <!--<xsl:for-each select="fn:collection('file:///C:/Projects/Directory2DITAMAP/dita_conversion/')">-->
                <xsl:for-each select="$list">
                    <div>
                            <xsl:value-of select="normalize-space(.)" />
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>