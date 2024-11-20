<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:db="http://docbook.org/ns/docbook"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xi="http://www.w3.org/2001/XInclude"
  xmlns:opentopic-i18n="http://www.idiominc.com/opentopic/i18n"
  xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
  xmlns:opentopic="http://www.idiominc.com/opentopic"
  xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
  xmlns:date="http://exslt.org/dates-and-times"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/"
  xmlns:fn="http://www.w3.org/2005/xpath-functions">


  <!-- <xsl:output method="xml" media-type="text/xml" indent="yes" encoding="UTF-8"
    doctype-public="-//OASIS//DTD DITA Map//EN" doctype-system="map.dtd"/>-->

 <xsl:output method="xml" media-type="text/xml" indent="yes" encoding="UTF-8"
    doctype-public="-//Atmel//DTD DITA Map//EN" doctype-system="map.dtd"/> 
  
  <xsl:param name="STARTING-DIR"/>
  <xsl:param name="OUTPUT-DIR"/>
  <xsl:param name="DIRECTORYLISTNAME"/>

  <xsl:param name="directories"
    select="fn:unparsed-text(translate(concat('file:///', $STARTING-DIR, $DIRECTORYLISTNAME), '\', '/'))"/>

  <xsl:param name="list" select="tokenize($directories, '&#xD;')"/>

  <xsl:template match="/">
    <xsl:element name="map">
      <xsl:attribute name="id" select="generate-id()"/>
      <xsl:element name="title">TITLE</xsl:element>
      <xsl:for-each select="$list[string-length(.) &gt; 5]">
        <xsl:message>processing: <xsl:value-of select="."/></xsl:message>
        <xsl:variable name="current-file"
          select="concat('file:///', translate(translate(normalize-space(.), '\', '/'), ' ', ''), '/')"/>
        <xsl:message>NEXT: <xsl:value-of select="$current-file"/></xsl:message>
        <xsl:for-each select="fn:collection($current-file)">
          <xsl:if test="contains(base-uri(), '.ditamap')">
            <xsl:element name="topicref">
              <xsl:attribute name="href">
                <xsl:value-of
                  select="substring-after(base-uri(), translate($STARTING-DIR, '\', '/'))"/>
              </xsl:attribute>
              <xsl:attribute name="format">ditamap</xsl:attribute>
            </xsl:element>
          </xsl:if>
        </xsl:for-each>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
