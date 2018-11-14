<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name=”threshold” select=”threshold”/>   
<xsl:template match=”/”>
	<html>
		<head></head>
		<body>
			<h1>Users with scores higher than <xsl:value-of select=”$threshold”></h1>
			<table>
				<tr>
					<th><strong>Name</strong></th>
					<th><strong>Description</strong></th>
					<th><strong>Location</strong></th>
					<th><strong>Reputation</strong></th>
					<th><strong>UpVotes</strong></th>
					<th><strong>DownVotes</strong></th>
					<th><strong>Badges</strong></th>
					<th><strong>TopPost</strong></th>
				</tr>
				<xsl:for-each select=”./user”>  
					<tr>
						<td><xsl:value-of select=”./name”></td>
						<td><xsl:value-of select=”./description”></td>
						<td><xsl:value-of select=”./location”></td>
						<td><xsl:value-of select=”./reputation”></td>
						<td><xsl:value-of select=”./upvotes”></td>
						<td><xsl:value-of select=”./downvotes”></td>
						<td><xsl:value-of select=”./badges”></td>
						<td><xsl:value-of select=”./top_post”></td>
					</tr>
				</xsl:for-each>
			</table>
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>
