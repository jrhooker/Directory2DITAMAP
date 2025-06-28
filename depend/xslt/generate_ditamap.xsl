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

  <xsl:param name="directories"  select="fn:unparsed-text(translate(concat('file:///', $STARTING-DIR, $DIRECTORYLISTNAME), '\', '/'))"/>

  <xsl:param name="list" select="tokenize($directories, '&#xD;')"/>
  
 
  
  <xsl:variable name="DDR_CONTROLLER" select="$list[contains(., 'DDR_CONTROLLER')]"/>
  <xsl:variable name="DESTINATION_NODE_REGMAP" select="$list[contains(., 'DESTINATION_NODE_REGMAP')]"/>
  <xsl:variable name="EMPCS_" select="$list[contains(., 'EMPCS_')]"/>
  <xsl:variable name="GPIO_" select="$list[contains(., 'GPIO_')]"/>
  <xsl:variable name="GPLL_" select="$list[contains(., 'GPLL_')]"/>
  <xsl:variable name="HSIO_" select="$list[contains(., 'HSIO_')]"/> 
  <xsl:variable name="INT_CONTROL_REGS_" select="$list[contains(., 'INT_CONTROL_REGS_')]"/>
  <xsl:variable name="IOG_" select="$list[contains(., 'IOG_')]"/>
  <xsl:variable name="LANE_CONTROL_" select="$list[contains(., 'LANE_CONTROL')]"/>
  <xsl:variable name="LSRAM_REGMAP" select="$list[contains(., 'LSRAM_REGMAP')]"/>
  <xsl:variable name="RESERVED" select="$list[contains(., 'RESERVED_')]"/>
  <xsl:variable name="TGLNE_CSCB_" select="$list[contains(., 'TGLNE_CSCB_')]"/>
  <xsl:variable name="TGPLL" select="$list[contains(., 'TGPLL')]"/>
  <xsl:variable name="TSGP8" select="$list[contains(., 'TSGP8')]"/>
  <xsl:variable name="VSRAM_REGMAP_" select="$list[contains(., 'VSRAM_REGMAP_')]"/>
  <xsl:variable name="xr5axi_ipcore_x8_gen5_ep" select="$list[contains(., 'xr5axi_ipcore_x8_gen5_ep')]"/>
  <xsl:variable name="xr5axi_ipcore_x8_gen5_rp" select="$list[contains(., 'xr5axi_ipcore_x8_gen5_rp')]"/>
  
  
  <xsl:template match="/">
    
    <xsl:message>STARTING-DIR:<xsl:value-of select="$STARTING-DIR"/></xsl:message>
    <xsl:message>directories:<xsl:value-of select="$directories"/></xsl:message>
    
    
    <xsl:if test="count($GPIO_) &gt; 0">
    <xsl:message><xsl:value-of select="translate(concat('file:///', $OUTPUT-DIR), '\', '/')"/></xsl:message>
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}GPIO.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">GPIO</xsl:element>
        <xsl:for-each select="$GPIO_">
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
    </xsl:result-document>
    </xsl:if>
    
    <xsl:if test="count($HSIO_) &gt; 0">
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}CSCBREG_HSIO.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">HSIO_</xsl:element>
        <xsl:for-each select="$HSIO_">
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
    </xsl:result-document>
    </xsl:if>  
    
    <xsl:if test="count($DDR_CONTROLLER) &gt; 0">
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}DDRC.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">DDRC</xsl:element>
        <xsl:for-each select="$DDR_CONTROLLER">
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
    </xsl:result-document>
    </xsl:if>  
      
    <xsl:if test="count($DESTINATION_NODE_REGMAP) &gt; 0">  
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}DESTINATION_NODE_REGMAP.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">DESTINATION_NODE_REGMAP</xsl:element>
        <xsl:for-each select="$DESTINATION_NODE_REGMAP">
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
    </xsl:result-document>
    </xsl:if>  
      
    <xsl:if test="count($EMPCS_) &gt; 0">     
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}EMPCS.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">DEMPCS</xsl:element>
        <xsl:for-each select="$EMPCS_">
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
    </xsl:result-document>
    </xsl:if>  
      
    <xsl:if test="count($GPLL_) &gt; 0">   
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}GPLL_CSCB.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">GPLL_CSCB</xsl:element>
        <xsl:for-each select="$GPLL_">
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
    </xsl:result-document>
    </xsl:if>  
      
    <xsl:if test="count($INT_CONTROL_REGS_) &gt; 0">  
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}INT_CTRL_REGS.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">INT_CTRL_REGS</xsl:element>
        <xsl:for-each select="$INT_CONTROL_REGS_">
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
    </xsl:result-document>
    </xsl:if>  
      
      
    <xsl:if test="count($LANE_CONTROL_) &gt; 0">    
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}LANE_CONTROL.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">LANE CONTROL</xsl:element>
        <xsl:for-each select="$LANE_CONTROL_">
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
    </xsl:result-document>
    </xsl:if>  
      
    <xsl:if test="count($LSRAM_REGMAP) &gt; 0">     
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}LSRAM_REGMAP.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">LSRAM_REGMAP</xsl:element>
        <xsl:for-each select="$LSRAM_REGMAP">
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
    </xsl:result-document>
    </xsl:if>  
      
    <xsl:if test="count($RESERVED) &gt; 0">     
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}RESERVED.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">RESERVED</xsl:element>
        <xsl:for-each select="$RESERVED">
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
    </xsl:result-document>
    </xsl:if>  
      
    <xsl:if test="count($IOG_) &gt; 0">    
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}IOG.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">IOG</xsl:element>
        <xsl:for-each select="$IOG_">
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
    </xsl:result-document>
    </xsl:if>   
      
    <xsl:if test="count($TGLNE_CSCB_) &gt; 0">   
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}TGLNE_CSCB.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">TGLNE_CSCB</xsl:element>
        <xsl:for-each select="$TGLNE_CSCB_">
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
    </xsl:result-document>
    </xsl:if>  
      
    <xsl:if test="count($TGPLL) &gt; 0">     
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}TGPLL.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">TGPLL</xsl:element>
        <xsl:for-each select="$TGPLL">
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
    </xsl:result-document>
    </xsl:if>  
      
    <xsl:if test="count($TSGP8) &gt; 0">     
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}TSGP8.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">TSGP8</xsl:element>
        <xsl:for-each select="$TSGP8">
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
    </xsl:result-document>
    </xsl:if>
      
    <xsl:if test="count($VSRAM_REGMAP_) &gt; 0">  
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}VSRAM_REGMAP.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">VSRAM_REGMAP</xsl:element>
        <xsl:for-each select="$VSRAM_REGMAP_">
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
    </xsl:result-document>
    </xsl:if>
      
    <xsl:if test="count($xr5axi_ipcore_x8_gen5_ep) &gt; 0">  
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}xr5axi_ipcore_x8_gen5_ep.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">xr5axi_ipcore_x8_gen5</xsl:element>
        <xsl:for-each select="$xr5axi_ipcore_x8_gen5_ep">
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
    </xsl:result-document>
    </xsl:if>
      
    <xsl:if test="count($xr5axi_ipcore_x8_gen5_rp) &gt; 0">  
    <xsl:result-document href="{translate(concat('file:///', $OUTPUT-DIR), '\', '/')}xr5axi_ipcore_x8_gen5_rp.ditamap">
      <xsl:element name="map">
        <xsl:attribute name="id" select="generate-id()"/>
        <xsl:element name="title">xr5axi_ipcore_x8_gen5</xsl:element>
        <xsl:for-each select="$xr5axi_ipcore_x8_gen5_rp">
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
    </xsl:result-document>
    </xsl:if>
      
  </xsl:template>


  <!--   <xsl:element name="map">
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
  </xsl:template> -->

</xsl:stylesheet>
