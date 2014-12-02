<?xml version="1.0" encoding="utf-8"?>
<!-- This is the basic frame for presentation -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="relativepath"/>
    
    <!-- Basic presentation form. This could be overridden by following documents -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Courses</title>
                <link rel="stylesheet" type="text/css" href="{$relativepath}css/site.css"/>
            </head>
            <body>
                <xsl:call-template name="container"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Body part of HTML document -->
    <xsl:template name="container">
        <div class="container">
            <xsl:call-template name="header"/>
            <xsl:call-template name="navigation"/>
            <xsl:call-template name="body"/>
            <xsl:call-template name="footer"/>
        </div>
    </xsl:template> 
    
    <!-- Header part of HTML body -->
    <xsl:template name="header">
        <div id="header">
            <div id = "image"><img src="{$relativepath}images/harvard_shield.png" alt="harvard_shield"/></div>
            <div id="title">
                Harvard University, Faculty of Arts &amp; Sciences Course Catalog
            </div>
        </div>
        
    </xsl:template>
    
    <!-- navigation part of HTML body -->
    <xsl:template name="navigation">
        <div id="navigation">
            <a href="departments">Departments</a><br/>
            <a href="coursegroup">Course group</a><br/>
            <a href="course_search">Course search</a><br/>
        </div>
    </xsl:template>
    
    <!-- Body part of HTML body -->
    <xsl:template name="body">
        <div id="body">
            <xsl:apply-templates select="courses">
            </xsl:apply-templates>
        </div>
    </xsl:template>
    
    <!-- Footer part of HTML body -->
    <xsl:template name="footer">
        <div id="footer">Harvard University, Faculty of Arts &amp; Sciences Course Catalog
        </div>
        <hr/>
    </xsl:template>
</xsl:stylesheet>