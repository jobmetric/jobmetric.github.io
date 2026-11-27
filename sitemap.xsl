<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sm="http://www.sitemaps.org/schemas/sitemap/0.9" exclude-result-prefixes="sm">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/">
    <xsl:variable name="entries" select="sm:sitemapindex/sm:sitemap | sm:urlset/sm:url"/>
    <html lang="en">
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>JobMetric XML Sitemap</title>
        <link rel="stylesheet" href="sitemap.css"/>
      </head>
      <body>
        <main>
          <a class="brand" href="./">JobMetric</a>
          <header>
            <h1><xsl:choose>
              <xsl:when test="sm:sitemapindex">Sitemap index</xsl:when>
              <xsl:otherwise>URL sitemap</xsl:otherwise>
            </xsl:choose></h1>
            <p><xsl:value-of select="count($entries)"/>
              <xsl:choose>
                <xsl:when test="sm:sitemapindex"><xsl:text> category sitemaps. Follow a link to view its URLs.</xsl:text></xsl:when>
                <xsl:otherwise><xsl:text> URLs in this sitemap.</xsl:text></xsl:otherwise>
              </xsl:choose>
            </p>
          </header>
          <p><a href="sitemap/">Browse the HTML sitemap</a>
            <xsl:if test="sm:urlset"><xsl:text> · </xsl:text><a href="sitemap_index.xml">Back to sitemap index</a></xsl:if>
          </p>
          <div class="search" hidden="hidden">
            <label for="sitemap-filter">Filter by URL</label>
            <input id="sitemap-filter" type="search" placeholder="Enter part of an address"/>
          </div>
          <ul id="sitemap-entries">
            <xsl:for-each select="$entries">
              <li>
                <a href="{sm:loc}"><xsl:value-of select="sm:loc"/></a>
                <xsl:if test="sm:lastmod"><time datetime="{sm:lastmod}"><xsl:value-of select="sm:lastmod"/></time></xsl:if>
              </li>
            </xsl:for-each>
          </ul>
          <p id="no-results" role="status" hidden="hidden">No URLs match your filter.</p>
        </main>
        <script src="sitemap-filter.js"><xsl:text> </xsl:text></script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
