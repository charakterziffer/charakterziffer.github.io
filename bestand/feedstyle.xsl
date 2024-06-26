<?xml version="1.0" encoding="utf-8"?>
<!-- inspiriert von Pretty Feed (https://github.com/genmon/aboutfeeds) -->
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/">
<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html lang="de">
<head>
	<meta charset="utf-8"/>
	<title><xsl:value-of select="/rss/channel/title"/></title>
	<link href='bestand/style.css' rel='stylesheet'/>
	<link href="bestand/czSlab.woff2" rel="preload" as="font" type="font/woff2" crossorigin="anonymous"/>

	<link rel="icon" href="/bestand/favicon.png"/>
	<link rel="apple-touch-icon" href="/bestand/touchicon.png"/>
	<meta name="theme-color" content="#228811"/>
	<meta name="color-scheme" content="light dark"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
</head>
<body>
	<main>
	<p class="hinterlegt">Das ist ein Webfeed, auch als RSS-Feed bekannt. Um ihn zu abonnieren, kopiere die URL aus der Adressleiste in deinen Feedreader.<br/>
	Ein sehr ausführlicher Artikel, wie man RSS nutzen kann, steht auf <a href="https://u-labs.de/portal/rss-einfach-erklaert-funktion-und-rss-feeds-die-bessere-alternative-zu-sozialen-netzwerken-um-web-inhalten-zu-folgen/">U-Labs</a>.</p>
	<h1 class="icon-rss">Webfeed-Vorschau</h1>
		<h2><xsl:value-of select="/rss/channel/title"/></h2>
		<p><xsl:value-of select="/rss/channel/description"/><br />
		<a target="_blank">
			<xsl:attribute name="href">
				<xsl:value-of select="/rss/channel/link"/>
			</xsl:attribute>
			Website besuchen →</a></p>

	<h2>Aktuelle Einträge</h2>
		<xsl:for-each select="/rss/channel/item">
			<h3>
				<a target="_blank">
				<xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
				<xsl:value-of select="title"/></a>
			</h3>
			<p>Veröffentlicht am <xsl:value-of select="pubDate" /></p>
		</xsl:for-each>
	</main>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>
