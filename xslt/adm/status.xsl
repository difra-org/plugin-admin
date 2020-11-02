<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="status">
		<h1>
			<xsl:value-of select="$locale/adm/stats/h2"/>
		</h1>

		<h2>Difra</h2>
		<table class="summary">
			<colgroup>
				<col style="width:250px"/>
				<col/>
			</colgroup>
			<tbody>
				<tr>
					<th>
						<xsl:value-of select="$locale/adm/stats/summary/platform-version"/>
					</th>
					<td>
						<xsl:value-of select="@difra"/>
					</td>
				</tr>
				<tr>
					<th>
						<xsl:value-of select="$locale/adm/stats/summary/loaded-plugins"/>
					</th>
					<td>
						<xsl:choose>
							<xsl:when test="@enabledPlugins and not(@enabledPlugins='')">
								<xsl:value-of select="@enabledPlugins"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>—</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
				<tr>
					<th>
						<xsl:value-of select="$locale/adm/stats/summary/cache-type"/>
					</th>
					<td>
						<xsl:value-of select="@cache"/>
					</td>
				</tr>
			</tbody>
		</table>
		<h2>
			<xsl:value-of select="$locale/adm/stats/server/title"/>
		</h2>
		<table class="summary">
			<colgroup>
				<col style="width:250px"/>
				<col/>
			</colgroup>
			<tbody>
				<tr>
					<th>
						<xsl:value-of select="$locale/adm/stats/server/webserver"/>
					</th>
					<td>
						<xsl:value-of select="@webserver"/>
					</td>
				</tr>
				<tr>
					<th>
						<xsl:value-of select="$locale/adm/stats/server/phpversion"/>
					</th>
					<td>
						<xsl:value-of select="@phpversion"/>
					</td>
				</tr>
				<tr>
					<th>
						<xsl:value-of select="$locale/adm/stats/permissions"/>
					</th>
					<td>
						<xsl:choose>
							<xsl:when test="stats/permissions/@*">
								<xsl:for-each select="stats/permissions/@*">
									<div style="color:red">
										<xsl:value-of select="."/>
									</div>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="$locale/adm/stats/permissions-ok"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</tbody>
		</table>
		<h2>
			<xsl:value-of select="$locale/adm/stats/extensions/title"/>
		</h2>
		<table class="summary">
			<colgroup>
				<col style="width:250px"/>
				<col/>
			</colgroup>
			<tbody>
				<tr>
					<th>
						<xsl:value-of
							select="$locale/adm/stats/extensions/required-extensions"/>
					</th>
					<td>
						<xsl:choose>
							<xsl:when test="not(extensions/@ok='')">
								<xsl:value-of select="extensions/@ok"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>—</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
				<xsl:if test="not(extensions/@required='')">
					<tr>
						<th>
							<xsl:value-of
								select="$locale/adm/stats/extensions/missing-extensions"/>
						</th>
						<td style="color:red">
							<xsl:value-of select="extensions/@required"/>
						</td>
					</tr>
				</xsl:if>
				<tr>
					<th>
						<xsl:value-of select="$locale/adm/stats/extensions/extra-extensions"/>
					</th>
					<td>
						<xsl:choose>
							<xsl:when test="not(extensions/@extra='')">
								<xsl:value-of select="extensions/@extra"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>—</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
