<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the detail of a course -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:include href="attribute_set.xsl"/>
  
  <xsl:template name="course">
    <fo:block xsl:use-attribute-sets="course-group-title">
      <xsl:value-of select="course_group"/>
      <xsl:value-of select="course_number/num_int"/>.
      <xsl:value-of select="title"/>
    </fo:block>
    
    <fo:block>
      <xsl:text>Catalog Number : </xsl:text>
      <xsl:value-of select="@cat_num"/>
    </fo:block>
    
    <fo:block xsl:use-attribute-sets="italic">
      <xsl:value-of select="faculty_list/faculty/name/first"/>&#160;
      <xsl:value-of select="faculty_list/faculty/name/middle"/>
      <xsl:value-of select="faculty_list/faculty/name/last"/>
    </fo:block>
    
    <fo:block xsl:use-attribute-sets="italic">
      <xsl:value-of select="credit"/>
      <xsl:text>(</xsl:text>
      <xsl:value-of select="term"/>
      <xsl:text>).&#160;</xsl:text><xsl:value-of select="meeting_text"/>
    </fo:block>
    
    <fo:block>
      <xsl:value-of select="course_level"/>/
      <xsl:value-of select="course_type"/>
    </fo:block>
    
    <fo:block xsl:use-attribute-sets="line-break"><fo:inline>x</fo:inline></fo:block>
    <fo:block xsl:use-attribute-sets="description">
      <xsl:value-of select="description"/>
    </fo:block>
    
    
    <fo:block xsl:use-attribute-sets="description">
      <xsl:if test="./notes/text()">
        <fo:block xsl:use-attribute-sets="line-break"><fo:inline>x</fo:inline></fo:block>
        <fo:inline xsl:use-attribute-sets="italic"><xsl:text>Note : </xsl:text></fo:inline>
        <xsl:value-of select="notes"/>
      </xsl:if>
    </fo:block>
    
    <fo:block xsl:use-attribute-sets="description">
      <xsl:if test="./prerequisites/text()">
        <fo:inline xsl:use-attribute-sets="italic"><xsl:text>prerequisites : </xsl:text></fo:inline>
        <xsl:value-of select="prerequisites"/>
      </xsl:if>
    </fo:block>
    
    <fo:block xsl:use-attribute-sets="line-break"><fo:inline>x</fo:inline></fo:block>
  </xsl:template>
</xsl:stylesheet>
