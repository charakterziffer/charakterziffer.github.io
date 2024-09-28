<?xml version="1.0" encoding="utf-8"?>
<!-- inspiriert von Pretty Feed (https://github.com/genmon/aboutfeeds/blob/main/tools/pretty-feed-v3.xsl) -->
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/">
<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html lang="de">
<head>
	<title>RSS-Feed // @cz+</title>
	<link href='bestand/style.css' rel='stylesheet'/>
	<link rel="icon" href="/bestand/favicon.png"/>
	<meta name="theme-color" content="#228811"/>
	<meta name="color-scheme" content="light dark"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
</head>
<body>
	<main>
	<p class="hinterlegt no-hyphens">Das ist ein RSS-Feed, der auto­matisch die neus­ten Ein­träge meines Blogs auf­listet. Um die­sen Feed zu abon­nieren, ko­piere die URL <code style="hyphenate: auto; hyphenate-character:''">https://charakterziffer.github.io/rss.xml</code> in dei­nen Feed­reader. Ein aus­führ­licher Arti­kel, wie man RSS nutzt, steht bei <a href="https://u-labs.de/portal/rss-einfach-erklaert-funktion-und-rss-feeds-die-bessere-alternative-zu-sozialen-netzwerken-um-web-inhalten-zu-folgen/">U-Labs</a>.</p>

	<h1 class="icon-rss">Webfeed-Vorschau</h1>
	<h2><xsl:value-of select="/rss/channel/title"/></h2>
	<p><xsl:value-of select="/rss/channel/description"/>
	<a target="_blank"><xsl:attribute name="href">
		<xsl:value-of select="/rss/channel/link"/></xsl:attribute>
		Website besuchen →</a></p>

	<h2>Die fünf neusten Einträge</h2>
	<xsl:for-each select="/rss/channel/item">
		<h3><a target="_blank"><xsl:attribute name="href">
		<xsl:value-of select="link"/></xsl:attribute>
			<xsl:value-of select="title"/></a></h3>
		<p>Veröffentlicht am <xsl:value-of select="pubDate"/></p>
		<xsl:variable name="datum" select="pubDate"/>
		<p>Test: <xsl:value-of select="format-date($datum, "[FNn,*-2], [D]. [MNn] [Y]", "de", (), ())"/></p>
	</xsl:for-each>
	</main>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
