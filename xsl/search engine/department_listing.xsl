<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the list of departments of the courses -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="../common.xsl"/>
    
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
                <title>Department_listing</title>
                <link rel="stylesheet" type="text/css" href="{$relativepath}css/site.css"/>
            </head>
            
            <body>
                <xsl:call-template name="container"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Shows the list of course departments -->     
    <xsl:template match="courses">
        <table>
            <tr>
                <th>Department</th><th>PDF</th>
            </tr>
            <xsl:for-each-group select="course/department" group-by="dept_short_name">
                <xsl:sort select="dept_short_name" order="ascending"/>
                <xsl:call-template name="dept"/>
            </xsl:for-each-group>
        </table>
    </xsl:template>
    
    <!-- Shows the departments list -->
    <xsl:template name="dept">
        <tr>
            <td>
                <a href="course/searchbydepartment?dept_list={dept_short_name}">
                    <xsl:value-of select="dept_short_name"/>
                </a>
            </td>
            
            <td>
                <a href="course/searchbydepartment.pdf?dept_list={dept_short_name}">PDF</a>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>