<?xml version="1.0" encoding="utf-8"?>
<!-- Presents the tables of courses of in course groups. -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:import href="common.xsl"/>
    
    <xsl:output method="html"
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
        omit-xml-declaration="yes"
        encoding="UTF-8"
        indent="yes" />
    
    <xsl:param name="course_group" />
    <xsl:param name="relativepath"/>
    
    <!-- Override the basic frame of presentation for HTML title -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Department_courses</title>
                <link rel="stylesheet" type="text/css" href="{$relativepath}css/site.css"/>
            </head>
            
            <body>
                <xsl:call-template name="container"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Presents the tables of courses of in course groups. -->
    <xsl:template match="courses">
        <br/>
        <!--breadcrumb navigation -->
        <div id="breadcrumb">
            <a href="../index.html">Departments&#160;</a>
            <img src="../images/arrow.gif" alt="arrow"/>&#160;
            <xsl:value-of select="$course_group"/>
        </div>
        <br/>
        <!-- Shows the department name -->
        <xsl:value-of select="$course_group"/><br/><br/>
        
    
    
    <table>
        <tr>
            <th>Num</th><th>Term</th><th>Title</th>
        </tr>
        <xsl:for-each select="course[course_group=$course_group]">
            <tr>
                <td>How</td>
                <td>are</td>
                <td><a href="individual_course"><xsl:value-of select="title"></xsl:value-of></a></td>
            </tr>
        </xsl:for-each>
    </table>
    
    
    
    </xsl:template>
    
    <xsl:template match="text()"/>
</xsl:stylesheet>













