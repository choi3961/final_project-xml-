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
                <title>Course Search</title>
                <link rel="stylesheet" type="text/css" href="{$relativepath}css/site.css"/>
            </head>
            
            <body>
                <xsl:call-template name="container"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="courses">
        <h1>Course Search</h1>
        <form action="search" method="get">
            <div>
                <h2>Departments</h2>
                <select name="department">
                    <xsl:for-each-group select="course/department" group-by="dept_short_name">
                        <xsl:sort select="dept_short_name" order="ascending"/>
                        <xsl:call-template name="dept"/>
                    </xsl:for-each-group>
                </select>
            </div>
            
            <div>
                <h2>Day and Time</h2>
                Meeting day <select name="day">
                    <option value="1">Any day</option>
                    <option value="monday">Monday</option>
                    <option value="tuesday">Tuesday</option>
                    <option value="wednesday">Wednesday</option>
                    <option value="thursday">Thursday</option>
                    <option value="friday">Friday</option>
                    <option value="saturday">Saturday</option>
                </select> <br/><br/>
                
                Start time <select name="time">
                    <option value="anytime">Any Time</option>
                    <option value="am">9-11 am</option>
                    <option value="430pm">noon-4:30 pm</option>
                    <option value="530pm">5:30 pm</option>
                    <option value="6pm">6 pm</option>
                    <option value="740and745pm">7:40 and 7:45 pm</option>
                    
                </select>
                
            </div>
            
            <div>
                <h2>Term</h2>
                <input type="checkbox" name="term" value="Fall"/>Fall 2014<br/>
                <input type="checkbox" name="term" value="Spring"/>Spring 2015<br/>
                <input type="checkbox" name="term" value="January"/>January session 2015<br/>
                
            </div>
            <div>
                <h2>Format</h2>
                <input type="checkbox" name="format" value="Fall"/>Fall 2014<br/>
                <input type="checkbox" name="format" value="Spring"/>Spring 2015<br/>
                <input type="checkbox" name="format" value="January"/>January session 2015<br/>
            </div>

            <div>
                <h2>Credit status</h2>
                <input type="checkbox" name="vehicle" value="Bike"/>I have a bike<br/>
                <input type="checkbox" name="vehicle" value="Car"/>I have a car<br/>
            </div>
            <div>
                <h2>Course description keyword</h2>
                Keyword : <input type="text" name="keyword"/>
            </div>
            <div>
                <h2>Subject number</h2>
                Subject number E- <input type="text" name="subject_number"/>
            </div>
            <div>
                <h2>Instructor</h2>
                Instructor last name : <input type="text" name="last_name"/>
            </div>
            <br/>
            <div>
                <input type="submit" />Submit
            </div>
            <br/>
            
        </form>
        
    </xsl:template>
    
    <!-- Shows the departments list -->
    <xsl:template name="dept">
        <option value="{dept_short_name}"><a href="departments/courses.html?dept_list={dept_short_name}">
            <xsl:value-of select="dept_short_name"/>
        </a>
        </option>
    </xsl:template>
 
</xsl:stylesheet>