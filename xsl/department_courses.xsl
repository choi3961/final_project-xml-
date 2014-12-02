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
    
    <xsl:param name="dept_list" />
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
            <xsl:value-of select="$dept_list"/>
        </div>
        <br/>
        <!-- Shows the department name -->
        <xsl:value-of select="$dept_list"/><br/><br/>
        
        <!-- Internal navigation to course groups --> 
        <div class="internal">
            <xsl:if test="count(distinct-values(course[department/dept_short_name=$dept_list]/course_group))=1">
            </xsl:if>
            <xsl:if test="count(distinct-values(course[department/dept_short_name=$dept_list]/course_group))!=1">
                <xsl:for-each-group select="course[department/dept_short_name=$dept_list]" group-by="course_group">
                    <a href="#{course_group/@code}"><xsl:value-of select="course_group"/></a>
                    <xsl:if test="not(position()=last())"><xsl:text> | </xsl:text></xsl:if>
                </xsl:for-each-group><br/><br/>
            </xsl:if>
        </div>
        
        <div class="clear_both"></div>
        <!-- Presents the tables of courses of in course groups. -->
        <xsl:for-each-group select="course[department/dept_short_name=$dept_list]" group-by="course_group">
            <xsl:sort select="course_group"/>
            
            <div class="course_group_title">         
                <a id="{course_group/@code}"><xsl:value-of select="course_group"/></a>
            </div> 
            
            <br/><br/>

            <!-- Table for course group -->
            <table>
                <tr>
                    <th>Number</th>
                    <th>Term</th>
                    <th>Title</th>
                </tr>
            
            <!-- Shows the course names -->
            <xsl:for-each select="current-group()">
                <xsl:sort order="ascending" select="course_number/num_int" data-type="number"></xsl:sort>
                <xsl:sort order="ascending" select="course_number/num_char"></xsl:sort>
                <xsl:sort order="ascending" select="title"></xsl:sort>
                <tr>
                    <td>
                        <xsl:if test="@offered = 'N'">
                            <xsl:value-of select="course_group"/>
                            <xsl:value-of select="course_number/num_int"/>
                        </xsl:if>
                        <xsl:if test="@offered = 'Y'">
                            <a href="../courses/course.html?cat_num={@cat_num}">
                                <xsl:value-of select="course_group"/>
                                <xsl:value-of select="course_number/num_int"/>
                            </a>
                        </xsl:if>
                    </td>
                    <td><xsl:value-of select="term"/></td>
                    <td>
                        <xsl:if test="@offered = 'N'">
                            <xsl:text>[</xsl:text>
                            <xsl:if test="instructor_approval_required='Y'">
                                <xsl:text>*</xsl:text>
                            </xsl:if>
                            <xsl:value-of select="title"/>
                            <xsl:text>]</xsl:text>
                        </xsl:if>
                        
                        <xsl:if test="@offered = 'Y'">
                            <a href="../courses/course.html?cat_num={@cat_num}">
                                <xsl:if test="instructor_approval_required='Y'">*</xsl:if>
                                <xsl:value-of select="title"/>
                            </a>
                        </xsl:if>
                    </td>
                </tr>
            </xsl:for-each>
            </table>
            <br/>
            
            <!-- Internal navigation to course groups -->
            <div class="internal">
                <xsl:if test="count(distinct-values(../course[department/dept_short_name=$dept_list]/course_group))!=1">
                    <xsl:for-each-group select="../course[department/dept_short_name=$dept_list]" group-by="course_group">
                        <a href="#{course_group/@code}"><xsl:value-of select="course_group"/></a>
                        <xsl:if test="not(position()=last())"><xsl:text> | </xsl:text></xsl:if>
                    </xsl:for-each-group><br/><br/>
                </xsl:if>
            </div>
            
            <br/>
        </xsl:for-each-group>
        <div class="clear_both"></div>
    </xsl:template>

    <xsl:template match="text()"/>
 </xsl:stylesheet>