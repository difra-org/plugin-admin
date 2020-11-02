<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="database">
        <xsl:if test="unify/*">
            <xsl:apply-templates select="unify" mode="develop-database"/>
        </xsl:if>
        <xsl:apply-templates select="mysql" mode="develop-database"/>
    </xsl:template>

    <xsl:template match="mysql" mode="develop-database">
        <h2>
            <xsl:value-of select="$locale/adm/stats/database/title"/>
        </h2>
        <xsl:choose>
            <xsl:when test="@error">
                <div class="alert alert-danger">
                    <xsl:value-of select="@error"/>
                </div>
            </xsl:when>
            <xsl:when test="count(table[@diff=1])=0 and count(table[@nodef=1])=0 and count(table[@nogoal=1])=0">
                <div class="alert alert-success">
                    <xsl:value-of select="$locale/adm/stats/database/status-ok"/>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="table" mode="diff"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="table" mode="diff">
        <xsl:choose>
            <xsl:when test="@diff=1">
                <table class="table table-striped">
                    <thead style="thead-dark">
                        <tr>
                            <th colspan="2">
                                <xsl:text>Table </xsl:text>
                                <strong>`<xsl:value-of select="@name"/>`
                                </strong>
                                <xsl:text> diff:</xsl:text>

                            </th>
                        </tr>
                    </thead>
                    <thead style="thead-light">
                        <tr>
                            <th style="width:50%">Current</th>
                            <th>Described</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="diff">
                            <xsl:choose>
                                <xsl:when test="@sign='='">
                                    <tr class="small bg-green">
                                        <td>
                                            <xsl:value-of select="@value"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@value"/>
                                        </td>
                                    </tr>
                                </xsl:when>
                                <xsl:when test="@sign='-'">
                                    <tr class="small bg-red">
                                        <td>
                                            <xsl:value-of select="@value"/>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </xsl:when>
                                <xsl:when test="@sign='+'">
                                    <tr class="small bg-red">
                                        <td>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@value"/>
                                        </td>
                                    </tr>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                    </tbody>
                </table>
            </xsl:when>
            <xsl:when test="@nogoal=1">
                <div class="alert alert-danger">
                    <xsl:text>Table `</xsl:text>
                    <xsl:value-of select="@name"/>
                    <xsl:text>` is not described.</xsl:text>
                </div>
            </xsl:when>
            <xsl:when test="@nodef=1">
                <div class="alert alert-danger">
                    <xsl:text>Table `</xsl:text>
                    <xsl:value-of select="@name"/>
                    <xsl:text>` does not exist.</xsl:text>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="alert alert-success">
                    <xsl:text>Table `</xsl:text>
                    <xsl:value-of select="@name"/>
                    <xsl:text>` is ok.</xsl:text>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="unify" mode="develop-database">
        <h2>
            <xsl:value-of select="$locale/adm/stats/unify/title"/>
        </h2>
        <table class="unify">
            <colgroup>
                <col style="width:250px"/>
                <col/>
            </colgroup>
            <xsl:for-each select="*">
                <tr>
                    <td>
                        <xsl:value-of select="name()"/>
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="@status='ok'">ok</xsl:when>
                            <xsl:when test="@status='missing'">
                                <a href="/adm/status/unify/create/{name()}"
                                   class="ajaxer">create
                                </a>
                            </xsl:when>
                            <xsl:when test="@status='alter'">
                                <a href="/adm/status/unify/alter/{name()}"
                                   class="ajaxer">
                                    <xsl:text>alter table (</xsl:text>
                                    <xsl:value-of select="@action"/>
                                    <xsl:text>): </xsl:text>
                                    <xsl:value-of select="@sql"/>
                                </a>
                            </xsl:when>
                            <xsl:otherwise>?</xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>
