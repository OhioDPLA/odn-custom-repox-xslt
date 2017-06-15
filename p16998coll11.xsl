<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
  xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:oai-pmh="http://www.openarchives.org/OAI/2.0/"
  xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/" xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:edm="http://www.europeana.eu/schemas/edm/"
  xsi:schemaLocation="http://worldcat.org/xmlschemas/qdc-1.0/
  http://worldcat.org/xmlschemas/qdc/1.0/qdc-1.0.xsd
  http://purl.org/net/oclcterms
  http://worldcat.org/xmlschemas/oclcterms/1.4/oclcterms-1.4.xsd"
  exclude-result-prefixes="xs" version="2.0" xmlns="http://www.loc.gov/mods/v3">
  <xsl:output omit-xml-declaration="yes" indent="yes"/>
  
  <!-- we just want records, repox will wrap the records in OAI containers -->
  <xsl:output omit-xml-declaration="yes" indent="yes"/>
  <!-- pull in our common template file -->
  <xsl:include href="odn_templates.xsl"/>
  
  <xsl:template match="text()|@*"/>
    <xsl:template match="//oai_qdc:qualifieddc">
      <oai_qdc:qualifieddc xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://worldcat.org/xmlschemas/qdc-1.0/ http://worldcat.org/xmlschemas/qdc/1.0/qdc-1.0.xsd http://purl.org/net/oclcterms http://worldcat.org/xmlschemas/oclcterms/1.4/oclcterms-1.4.xsd">
        <xsl:apply-templates select="dcterms:alternative" mode="odn"/>
        <xsl:apply-templates select="dc:relation" mode="odn"/>
        <xsl:element name="edm:dataProvider" namespace="http://www.europeana.eu/schemas/edm/">Public Library of Cincinnati</xsl:element>
        <xsl:apply-templates select="dc:contributor" mode="p16998coll11"/>
        <xsl:apply-templates select="dc:identifier" mode="odn"/>
        <xsl:apply-templates select="dc:creator" mode="odn"/>
        <xsl:copy-of select="dc:date" copy-namespaces="no"/>
        <xsl:apply-templates select="dc:description" mode="odn"/>
        <xsl:copy-of select="dcterms:extent" copy-namespaces="no"/>
        <xsl:apply-templates select="dc:subject" mode="odn"/>
        <xsl:apply-templates select="dc:format" mode="p16998coll11"/>
        <xsl:apply-templates select="dc:type" mode="p16998coll11"/>
        <xsl:copy-of select="dcterms:spatial" copy-namespaces="no"/>
        <xsl:apply-templates select="dc:publisher" mode="odn"/>
        <xsl:apply-templates select="dc:rights" mode="odn"/>
        <xsl:copy-of select="dcterms:rightsholder" copy-namespaces="no"/>
        <xsl:apply-templates select="dc:title" mode="odn"/>
      </oai_qdc:qualifieddc>
    </xsl:template>
  
  <xsl:template match="dc:contributor" mode="p16998coll11">
    <xsl:element name="dcterms:contributor" namespace="http://purl.org/dc/terms/">
      <xsl:value-of select="normalize-space(.)"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dc:format" mode="p16998coll11">
    <xsl:element name="dc:format" namespace="http://purl.org/dc/elements/1.1/">
      <xsl:choose>
        <xsl:when test="contains(lower-case(.), 'jpg')">image/jpeg</xsl:when>
        <xsl:otherwise/>
      </xsl:choose>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dc:type" mode="p16998coll11">
    <xsl:element name="edm:hasType" namespace="http://www.europeana.eu/schemas/edm/">
      <xsl:value-of select="normalize-space(.)"/>
    </xsl:element>
  </xsl:template>
  
</xsl:stylesheet>