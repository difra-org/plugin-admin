<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="html-body">
        <body>
            <xsl:apply-templates select="root/menu[@instance='adm']"/>
            <div class="container-fluid">
                <!--
                                        <div id="signature">
                                            <a href="http://www.difra.org/">
                                                <span id="signature_difra">
                                                    <xsl:value-of select="/root/@frameworkLong"/>
                                                </span>
                                            </a>
                                        </div>
                -->
                <xsl:call-template name="content-wrapper"/>
            </div>
        </body>
    </xsl:template>

    <xsl:template name="html-body-switcher">
        <body>
            <xsl:call-template name="content-wrapper"/>
            <xsl:apply-templates select="root/menu[@instance='adm']">
                <xsl:with-param name="auto" select="0"/>
            </xsl:apply-templates>
        </body>
    </xsl:template>
</xsl:stylesheet>
