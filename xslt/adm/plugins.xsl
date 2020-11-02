<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="plugins">
        <h2>
            <xsl:value-of select="$locale/adm/plugins/title"/>
        </h2>
        <xsl:choose>
            <xsl:when test="plugins/*">
                <table>
                    <colgroup>
                        <col style="width:35px"/>
                        <col/>
                        <col/>
                        <col/>
                        <col style="width:80px"/>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th style="width:0"/>
                            <th style="width:10%">
                                <xsl:value-of select="$locale/adm/plugins/name"/>
                            </th>
                            <th style="width:40%">
                                <xsl:value-of select="$locale/adm/plugins/description"/>
                            </th>
                            <th style="width:25%">
                                <xsl:value-of select="$locale/adm/plugins/provides"/>
                            </th>
                            <th style="width:25%">
                                <xsl:value-of select="$locale/adm/plugins/requires"/>
                            </th>
                            <th style="width:0">
                                <xsl:value-of select="$locale/adm/plugins/version"/>
                            </th>
                        </tr>
                        <xsl:for-each select="plugins/*">
                            <xsl:sort select="name()"/>
                            <xsl:variable name="name" select="name()"/>
                            <tr>
                                <td>
                                    <input type="checkbox" name="{$name}"
                                           class="plugins-toggle">
                                        <xsl:choose>
                                            <xsl:when
                                                test="@missingReq=1 or @disabled=1">
                                                <xsl:attribute
                                                    name="disabled">
                                                    <xsl:text>disabled</xsl:text>
                                                </xsl:attribute>
                                            </xsl:when>
                                            <xsl:when
                                                test="@enabled=1 and not(@disabled=1)">
                                                <xsl:attribute
                                                    name="checked">
                                                    <xsl:text>checked</xsl:text>
                                                </xsl:attribute>
                                            </xsl:when>
                                        </xsl:choose>
                                    </input>
                                </td>
                                <td>
                                    <xsl:value-of select="$name"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@description"/>
                                </td>
                                <td>
                                    <xsl:for-each select="provides/*">
                                        <xsl:sort select="name()"/>
                                        <xsl:if test="position()>1">
                                            <xsl:text>, </xsl:text>
                                        </xsl:if>
                                        <xsl:value-of select="name()"/>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:for-each select="require/*">
                                        <xsl:sort select="name()"/>
                                        <xsl:variable name="reqName"
                                                      select="name()"/>
                                        <xsl:if test="position()>1">
                                            <xsl:text>, </xsl:text>
                                        </xsl:if>
                                        <xsl:choose>
                                            <xsl:when
                                                test="../../missingReq/*[name()=$reqName]">
                                                <xsl:variable name="url"
                                                              select="../../../../provisions/*[name()=$reqName]/@url"/>
                                                <xsl:choose>
                                                    <xsl:when
                                                        test="$url">
                                                        <a href="{$url}"
                                                           class="dashed error">
                                                            <xsl:value-of
                                                                select="name()"/>
                                                        </a>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <span class="error">
                                                            <xsl:value-of
                                                                select="name()"/>
                                                        </span>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of
                                                    select="name()"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="@old">
                                            <span class="error">
                                                <xsl:value-of
                                                    select="@version"/>
                                            </span>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of
                                                select="@version"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$locale/adm/plugins/no-plugins"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
