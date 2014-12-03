<?xml version="1.0" encoding="utf-8"?>
<!-- Presents the tables of courses of in course groups. -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template name="selected_courses">
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
    </xsl:template>
</xsl:stylesheet>