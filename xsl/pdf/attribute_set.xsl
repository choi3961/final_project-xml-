<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
  
    <xsl:attribute-set name="course_group">
        <xsl:attribute name="font-size">17px</xsl:attribute>
        <xsl:attribute name="color">#0000ff</xsl:attribute>
    </xsl:attribute-set> 
    <xsl:attribute-set name="region-before-after">
        <xsl:attribute name="line-height">14pt</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="title">
        <xsl:attribute name="line-height">29pt</xsl:attribute>
        <xsl:attribute name="font-size">25pt</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="description">
        <xsl:attribute name="margin-left">20pt</xsl:attribute>
        <xsl:attribute name="margin-right">20pt</xsl:attribute>
        <xsl:attribute name="font-size">11px</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="italic">
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="course-group-title">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">15px</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="line-break">
        <xsl:attribute name="color">#ffffff</xsl:attribute>
        <xsl:attribute name="font-size">15px</xsl:attribute>
    </xsl:attribute-set>
</xsl:stylesheet>