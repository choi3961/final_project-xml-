<?xml version="1.0" encoding="utf-8"?>
<!-- Presents the tables of courses of in course groups. -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
  
    <xsl:import href="course_detail.xsl"/>
    <xsl:include href="attribute_set.xsl"/>
    <xsl:output method="xml"
        encoding="UTF-8"
        indent="yes" />
    <xsl:param name="dept_list" />

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="right"
                    margin-right="2cm"
                    margin-left="2cm"
                    margin-bottom="1cm"
                    margin-top="1cm"
                    page-width="23cm"
                    page-height="29cm">
                    <fo:region-body margin-top="1cm" margin-bottom="1cm" margin-left="1cm"/>
                    <fo:region-before extent="1cm"/>
                    <fo:region-after   extent="1cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <fo:page-sequence master-reference="right" initial-page-number="1">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block xsl:use-attribute-sets="region-before-after" >
                        <xsl:value-of select="$dept_list"/>
                        Page <fo:page-number/> of <fo:page-number-citation ref-id="endpage"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block xsl:use-attribute-sets="region-before-after">
                        Page <fo:page-number/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body" >
                    <xsl:apply-templates select="courses" mode="TOC"/>
                    <fo:block break-before="page"></fo:block>
                    <xsl:apply-templates select="courses" mode="main"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <!-- Presents the tables of courses of in course groups. -->
    <xsl:template match="courses" mode="TOC">
        <fo:block xsl:use-attribute-sets="title" >
            Department of <xsl:value-of select="$dept_list"/>
        </fo:block>
        <fo:block xsl:use-attribute-sets="line-break"><fo:inline>x</fo:inline></fo:block>
        
        <!-- Presents the tables of courses of in course groups. -->
        <xsl:if test="count(distinct-values(course[department/dept_short_name=$dept_list]/course_group))=1">
            <xsl:for-each-group select="course[department/dept_short_name=$dept_list]" group-by="course_group">
                <xsl:sort select="course_group"/>
                                
                <!-- Shows the course names -->
                <xsl:for-each select="current-group()">
                    <xsl:sort order="ascending" select="course_number/num_int" data-type="number"></xsl:sort>
                    <xsl:sort order="ascending" select="course_number/num_char"></xsl:sort>
                    <xsl:sort order="ascending" select="title"></xsl:sort>
                    
                    <fo:block text-align-last="justify">
                        <fo:basic-link internal-destination="{generate-id()}">
                            <xsl:value-of select="course_group"/> &#160;
                            <xsl:value-of select="course_number/num_int"/>. &#160;
                            <xsl:value-of select="title"/>
                        </fo:basic-link>
                        <fo:leader leader-pattern="dots"/>
                        <fo:page-number-citation ref-id="{generate-id()}"/>
                    </fo:block> 
                </xsl:for-each>
                <fo:block xsl:use-attribute-sets="line-break"><fo:inline>x</fo:inline></fo:block>
            </xsl:for-each-group>
        </xsl:if>
        <xsl:if test="count(distinct-values(course[department/dept_short_name=$dept_list]/course_group))!=1">
            <xsl:for-each-group select="course[department/dept_short_name=$dept_list]" group-by="course_group">
                <xsl:sort select="course_group"/>
                
                <fo:block xsl:use-attribute-sets="course_group">
                    <fo:basic-link internal-destination="{generate-id()}">
                        <xsl:value-of select="course_group"/>
                    </fo:basic-link>
                </fo:block>
                <fo:block xsl:use-attribute-sets="line-break"><fo:inline>x</fo:inline></fo:block>
                <!-- Shows the course names -->
                <xsl:for-each select="current-group()">
                    <xsl:sort order="ascending" select="course_number/num_int" data-type="number"></xsl:sort>
                    <xsl:sort order="ascending" select="course_number/num_char"></xsl:sort>
                    <xsl:sort order="ascending" select="title"></xsl:sort>
                    
                    <xsl:if test="@offered = 'N'">
                        <fo:block text-align-last="justify">
                            <xsl:value-of select="course_group"/> &#160;
                            <xsl:value-of select="course_number/num_int"/>. &#160;
                            <xsl:text>[</xsl:text>
                            <xsl:if test="instructor_approval_required='Y'">
                                <xsl:text>*</xsl:text>
                            </xsl:if>
                            <xsl:value-of select="title"/>
                            <xsl:text>]</xsl:text>
                            <fo:leader leader-pattern="dots"/>
                            <fo:page-number-citation ref-id="{generate-id()}"/>
                        </fo:block>
                    </xsl:if>
                    
                    <xsl:if test="@offered = 'Y'">
                        <fo:block text-align-last="justify">
                            <fo:basic-link internal-destination="{generate-id()}">
                                <xsl:value-of select="course_group"/> &#160;
                                <xsl:value-of select="course_number/num_int"/>. &#160;
                                <xsl:if test="instructor_approval_required='Y'">*</xsl:if>
                                <xsl:value-of select="title"/>
                            </fo:basic-link>
                            <fo:leader leader-pattern="dots"/>
                            <fo:page-number-citation ref-id="{generate-id()}"/>
                        </fo:block>
                    </xsl:if>
                </xsl:for-each>
                <fo:block xsl:use-attribute-sets="line-break"><fo:inline>x</fo:inline></fo:block>
            </xsl:for-each-group>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="courses" mode="main">
        <!-- Presents the details of courses of in course groups. -->
        <xsl:if test="count(distinct-values(course[department/dept_short_name=$dept_list]/course_group))=1">
            <xsl:for-each-group select="course[department/dept_short_name=$dept_list]" group-by="course_group">
                <xsl:sort select="course_group"/>
  
                <xsl:for-each select="current-group()">
                    <xsl:sort order="ascending" select="course_number/num_int" data-type="number"></xsl:sort>
                    <xsl:sort order="ascending" select="course_number/num_char"></xsl:sort>
                    <xsl:sort order="ascending" select="title"></xsl:sort>
                    
                    <fo:block id="{generate-id()}">
                        <xsl:call-template name="course"></xsl:call-template>
                    </fo:block>
                </xsl:for-each>
            </xsl:for-each-group>
        </xsl:if>
        <xsl:if test="count(distinct-values(course[department/dept_short_name=$dept_list]/course_group))!=1">
            <xsl:for-each-group select="course[department/dept_short_name=$dept_list]" group-by="course_group">
                <xsl:sort select="course_group"/>
                
                <fo:block xsl:use-attribute-sets="line-break"><fo:inline>x</fo:inline></fo:block>
                <fo:block xsl:use-attribute-sets="course_group">
                    <xsl:value-of select="course_group"/>
                </fo:block>
                
                <xsl:for-each select="current-group()">
                    <xsl:sort order="ascending" select="course_number/num_int" data-type="number"></xsl:sort>
                    <xsl:sort order="ascending" select="course_number/num_char"></xsl:sort>
                    <xsl:sort order="ascending" select="title"></xsl:sort>
                    
                    <fo:block id="{generate-id()}">
                        <xsl:call-template name="course"></xsl:call-template>
                    </fo:block>
                </xsl:for-each>
            </xsl:for-each-group>
        </xsl:if>
        <fo:block id="endpage"></fo:block>
    </xsl:template>
</xsl:stylesheet>