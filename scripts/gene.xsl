<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text"/>

<xsl:template match="/">
<xsl:apply-templates select="//GBFeature[GBFeature_key='gene']/GBFeature_intervals/GBInterval"/>
</xsl:template>


<xsl:template match="GBInterval">
<xsl:value-of select="GBInterval_from"/>
<xsl:text> </xsl:text>
<xsl:value-of select="GBInterval_to"/>
<xsl:text> </xsl:text>
<xsl:apply-templates select="../../GBFeature_quals/GBQualifier"/>
<xsl:text>
</xsl:text>
</xsl:template>

<xsl:template match="GBQualifier">
<xsl:value-of select="GBQualifier_name"/>
<xsl:text>:</xsl:text>
<xsl:value-of select="GBQualifier_value"/>
<xsl:text> </xsl:text>
</xsl:template>

</xsl:stylesheet>
