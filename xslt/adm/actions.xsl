<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:variable name="actionSpacer"/>

	<xsl:template name="actionContent">
		<xsl:param name="link"/>
		<a href="{$link}" class="action content">
			<xsl:value-of select="$locale/adm/actions/content"/>
		</a>
		<xsl:value-of select="$actionSpacer"/>
	</xsl:template>

	<xsl:template name="actionEdit">
		<xsl:param name="link"/>
		<a href="{$link}" class="action edit"/>
		<xsl:value-of select="$actionSpacer"/>
	</xsl:template>

	<xsl:template name="actionDelete">
		<xsl:param name="link"/>
		<a href="{$link}" class="action delete ajaxer"/>
		<xsl:value-of select="$actionSpacer"/>
	</xsl:template>

	<xsl:template name="actionUp">
		<xsl:param name="link"/>
		<xsl:param name="idPrefix"/>
		<a>
			<xsl:choose>
				<xsl:when test="position()=1">
					<xsl:attribute name="href">#</xsl:attribute>
					<xsl:attribute name="class">action up disabled ajaxer</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="href">
						<xsl:value-of select="$link"/>
					</xsl:attribute>
					<xsl:attribute name="class">action up ajaxer</xsl:attribute>
					<xsl:attribute name="onmouseover">
						<xsl:text>$('#</xsl:text>
						<xsl:value-of select="$idPrefix"/>
						<xsl:value-of select="position()-1"/>
						<xsl:text>').addClass('moveUpHighlight')</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="onmouseout">
						<xsl:text>$('#</xsl:text>
						<xsl:value-of select="$idPrefix"/>
						<xsl:value-of select="position()-1"/>
						<xsl:text>').removeClass('moveUpHighlight')</xsl:text>
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</a>
		<xsl:value-of select="$actionSpacer"/>
	</xsl:template>

	<xsl:template name="actionDown">
		<xsl:param name="link"/>
		<xsl:param name="idPrefix"/>
		<a>
			<xsl:choose>
				<xsl:when test="position()=last()">
					<xsl:attribute name="href">#</xsl:attribute>
					<xsl:attribute name="class">action down disabled ajaxer</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="href">
						<xsl:value-of select="$link"/>
					</xsl:attribute>
					<xsl:attribute name="class">action down ajaxer</xsl:attribute>
					<xsl:attribute name="onmouseover">
						<xsl:text>$('#</xsl:text>
						<xsl:value-of select="$idPrefix"/>
						<xsl:value-of select="position()+1"/>
						<xsl:text>').addClass('moveDownHighlight')</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="onmouseout">
						<xsl:text>$('#</xsl:text>
						<xsl:value-of select="$idPrefix"/>
						<xsl:value-of select="position()+1"/>
						<xsl:text>').removeClass('moveDownHighlight')</xsl:text>
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</a>
		<xsl:value-of select="$actionSpacer"/>
	</xsl:template>

	<xsl:template name="actionLeft">
		<xsl:param name="link"/>
		<a>
			<xsl:choose>
				<xsl:when test="position()=1">
					<xsl:attribute name="href">#</xsl:attribute>
					<xsl:attribute name="class">action left disabled ajaxer</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="href">
						<xsl:value-of select="$link"/>
					</xsl:attribute>
					<xsl:attribute name="class">action left ajaxer</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</a>
		<xsl:value-of select="$actionSpacer"/>
	</xsl:template>

	<xsl:template name="actionRight">
		<xsl:param name="link"/>
		<a>
			<xsl:choose>
				<xsl:when test="position()=last()">
					<xsl:attribute name="href">#</xsl:attribute>
					<xsl:attribute name="class">action right disabled ajaxer</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="href">
						<xsl:value-of select="$link"/>
					</xsl:attribute>
					<xsl:attribute name="class">action right ajaxer</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</a>
		<xsl:value-of select="$actionSpacer"/>
	</xsl:template>
</xsl:stylesheet>