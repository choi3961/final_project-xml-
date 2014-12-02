<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the list of departments of the courses -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="common.xsl"/>
    
    <xsl:output method="html"
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
        omit-xml-declaration="yes"
        encoding="UTF-8"
        indent="yes" />
    
    <xsl:param name="relativepath"/>
    <xsl:param name="term"></xsl:param>
    <xsl:param name="format"></xsl:param>
    <xsl:param name="vehicle"></xsl:param>
    <xsl:param name="department"></xsl:param>
    <xsl:param name="day"></xsl:param>
    <xsl:param name="time"></xsl:param>
    
    
    <!-- Override the basic frame of presentation for HTML title -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Search Result</title>
                <link rel="stylesheet" type="text/css" href="{$relativepath}css/site.css"/>
            </head>
            
            <body>
                <xsl:call-template name="container"/>
                
            </body>
        </html>
    </xsl:template>
    
    <!-- Shows the list of course departments -->     
    <xsl:template match="courses">
        <h1>Search Result</h1>
        <div>
            <xsl:value-of select="$term"/><br/>
            <xsl:value-of select="$vehicle"/>
        </div>
        <table>
            <tr>
                <th>Title</th><th>Term</th><th>Day-Time</th>
            </tr>
            
            <xsl:for-each select="
                for $a in(
                (
                for $b in(
                    for $c in(
                        for $d in(course)
                        return 
                        if($day)
                        then($d[schedule/meeting/@day = '1'])
                        else()
                    
                    )
                    return 
                    if($time)
                    then($c[schedule/meeting/@begin_time = '1800'])
                    else()
                )
                return 
                if($department)
                then($b[department/dept_short_name=$department])
                else($b)
                
                )
                ) 
                return 
                if($vehicle)
                then($a)
                else($a)">
                
                <tr>
                    <td><xsl:value-of select="title"/></td>
                    <td><xsl:value-of select="term"/></td>
                    <td><xsl:value-of select="schedule/meeting/@day"/><xsl:value-of select="schedule/meeting/@begin_time"/></td>
                </tr>
            </xsl:for-each>
        </table>
        
        
        
        
    </xsl:template>
   
</xsl:stylesheet>