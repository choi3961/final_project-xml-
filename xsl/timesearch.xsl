<?xml version="1.0" encoding="utf-8"?>
<!-- Presents the tables of courses of in course groups. -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:import href="common.xsl"/>
    <xsl:include href="courses_selected.xsl"/>
    
    <xsl:output method="html"
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
        omit-xml-declaration="yes"
        encoding="UTF-8"
        indent="yes" />
    
    <xsl:param name="relativepath"/>
    <xsl:param name="day" />
    <xsl:param name="time"/>
    
    
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
       <table>
           <tr>
               <th>Number</th>
               <th>Term</th>
               <th>Title</th>
           </tr>
           
           <xsl:for-each select="course[schedule/meeting/@begin_time=$time]">
               <xsl:call-template name="selected_courses"></xsl:call-template>
           </xsl:for-each>
       </table>
    </xsl:template>
    
    <xsl:template match="text()"/>
</xsl:stylesheet>





