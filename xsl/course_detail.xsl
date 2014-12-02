<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the detail of a course -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                
  <xsl:import href="common.xsl"/>
  <xsl:output method="html"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="yes"
    encoding="UTF-8"
    indent="yes" />
  <xsl:param name="cat_num" />
  <xsl:param name="relativepath"/>
  
  <!-- Override the basic frame of presentation for HTML title -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Courses_detail</title>
        <link rel="stylesheet" type="text/css" href="{$relativepath}css/site.css"/>
      </head>
      
      <body>
        <xsl:call-template name="container"/>
      </body>
    </html>
  </xsl:template>
  
  <!-- Shows the detail of a course -->
  <xsl:template match="courses">
    <xsl:apply-templates select="course[@cat_num=$cat_num]"/>
  </xsl:template>
  
  <!-- Shows the detail -->
  <xsl:template match="course">
    <br/>
    
    <!--breadcrumb navigation -->
    <div id="breadcrumb">
      <a href="../index.html"> Departments&#160;</a>
      <img src="../images/arrow.gif" alt="arrow"/>
      <a href="../departments/courses.html?dept_list={department/dept_short_name}">
        &#160;<xsl:value-of select="department/dept_short_name"/>&#160;
      </a>
      <img src="../images/arrow.gif" alt="arrow"/>
      &#160;<xsl:value-of select="course_group"/>
      <xsl:value-of select="course_number/num_int"/>
    </div>
    <br/>
    
    <h2><xsl:value-of select="title"/></h2>
    <div>
    <strong>
      <xsl:value-of select="course_group"/>  
      <xsl:value-of select="course_number/num_int"/>.
      <xsl:value-of select="title"/>
    </strong>
    </div><br/>
    <div>
      <xsl:text>Catalog Number : </xsl:text>
      <xsl:value-of select="@cat_num"/>
    </div><br/>
    <div class="italic">
      <xsl:value-of select="faculty_list/faculty/name/first"/>&#160;
      <xsl:value-of select="faculty_list/faculty/name/middle"/>
      <xsl:value-of select="faculty_list/faculty/name/last"/>
    </div><br/>
    <div>
      <xsl:value-of select="credit"/>
      <xsl:text>(</xsl:text>
      <xsl:value-of select="term"/>
      <xsl:text>)</xsl:text>
      <xsl:value-of select="meeting_text"/>
    </div><br/>
    <div>
      <xsl:value-of select="course_level"/>/
      <xsl:value-of select="course_type"/>
    </div><br/>
    <div class="indent">
      <xsl:value-of select="description"/>
    </div><br/>
    <div class="indent">
    <xsl:if test="./notes/text()">
      <span class="italic"><xsl:text>Note : </xsl:text></span>
      <xsl:value-of select="notes"/><br/><br/><br/>
    </xsl:if>
    </div>
  </xsl:template>
</xsl:stylesheet>
