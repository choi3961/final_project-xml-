<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the list of departments of the courses -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="../xsl/common.xsl"/>
    
    <xsl:output method="html"
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
        omit-xml-declaration="yes"
        encoding="UTF-8"
        indent="yes" />
    
    <xsl:param name="relativepath"/>
    
    <!-- Override the basic frame of presentation for HTML title -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Final Project</title>
                <link rel="stylesheet" type="text/css" href="{$relativepath}css/site.css"/>
                
                
                
            </head>
            
            <body>
                
  
                <xsl:call-template name="container"/>
                
            </body>
        </html>
    </xsl:template>
    
    <!-- Shows the list of course departments -->     
    <xsl:template match="courses">
        
        <h1 class="center" id="sub-title">Harvard Courses</h1>
        <h2>Department-Course group</h2>
        <ul>
            <xsl:for-each-group select="course" group-by="department/dept_short_name">
                <xsl:sort select="department/dept_short_name" order="ascending"/>
                <xsl:call-template name="dept"/>
            </xsl:for-each-group>
        </ul>
        
        <ul><h2>Day and Time</h2>
            <li><a href="{$relativepath}course/searchbyday?day={1}">Monday</a>
                <ul class="for-hover">
                    <a href="course/searchbytime?time={1200}"><li>morning</li></a>
                    <a href="course/searchbytime?time={1500}"><li>2:00</li></a>
                    <a href="course/searchbytime"><li>4:00</li></a>
                </ul>
            </li>
            <li><a href="{$relativepath}course/searchbyday?day={2}">Tuesday</a>
                <ul class="for-hover">
                    <a href="course/searchbytime"><li>morning</li></a>
                    <a href="course/searchbytime"><li>2:00</li></a>
                    <a href="course/searchbytime"><li>4:00</li></a>
                </ul></li>
            <li><a href="{$relativepath}course/searchbyday?day={3}">Wednesday</a>
                <ul class="for-hover">
                    <a href="course/searchbytime"><li>morning</li></a>
                    <a href="course/searchbytime"><li>2:00</li></a>
                    <a href="course/searchbytime"><li>4:00</li></a>
                </ul></li>
            <li><a href="{$relativepath}course/searchbyday?day={4}">Thursday</a>
                <ul class="for-hover">
                    <a href="course/searchbytime"><li>morning</li></a>
                    <a href="course/searchbytime"><li>2:00</li></a>
                    <a href="course/searchbytime"><li>4:00</li></a>
                </ul></li>
            <li><a href="{$relativepath}course/searchbyday?day={5}">Friday</a>
                <ul class="for-hover">
                    <a href="course/searchbytime"><li>morning</li></a>
                    <a href="course/searchbytime"><li>2:00</li></a>
                    <a href="course/searchbytime"><li>4:00</li></a>
                </ul></li>
            <li><a href="{$relativepath}course/searchbyday?day={6}">Saturday</a>
                <ul class="for-hover">
                    <a href="course/searchbytime"><li>morning</li></a>
                    <a href="course/searchbytime"><li>2:00</li></a>
                    <a href="course/searchbytime"><li>4:00</li></a>
                </ul></li>
        </ul>
    </xsl:template>
    
    <!-- Shows the departments list -->
    <xsl:template name="dept">
        <li>
            <a href="course/searchbydepartment?dept_list={department/dept_short_name}"></a><xsl:value-of select="department/dept_short_name"/><br/>
            <ul class="for-hover">
            <xsl:for-each-group select="current-group()" group-by="course_group">
                    
                <li ><a href="course/searchbycoursegroup?course_group={course_group}&amp;department={department/dept_short_name}"><xsl:value-of select="course_group"/></a></li>
            </xsl:for-each-group>
            </ul>
        </li><br/>
    </xsl:template>
</xsl:stylesheet>

































