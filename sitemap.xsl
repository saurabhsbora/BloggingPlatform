<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <head>
    <link rel="stylesheet" type="text/css" href="style.css" />
  </head>	
  <body>
  <h2 style="text-align:center;">Sitemap</h2>
  <table align = "center">
    <tr>
      <th>Url-location</th>
      <th>Last-modified-date</th>
      <th>Change-frequency</th>
      <th>Page-priority</th>
    </tr>
    <xsl:for-each select="url-set/url">
    <tr>
      <td><a href = "{loc}"><xsl:value-of select="loc"/></a></td>
      <td><xsl:value-of select="lastmod"/></td>
      <td><xsl:value-of select="changefreq"/></td>
      <td><xsl:value-of select="priority"/></td>
    </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>