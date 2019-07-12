<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de">
    <head>
        <title>Sun Coding Style Violations</title>
        <style type="text/css">
            html {
                color: #000000;
                background: #FFFFFF;
            }
            html * {
                font-family: Verdana, Arial, Helvetica, sans-serif;
                font-size: 10px;
            }
            .filetable {
                width: 100%;
                border: 1px solid #999999;
                background: #c9c9c9;
                padding: 1px 1px 1px 1px;
                margin: 1px 1px 1px 1px;
            }
            .filetable tbody tr td {
                border: 1px solid #999999;
            }
            .info {
                background: #b4c8ff;
            }
            .warning {
                background: #f7ff9e;
            }
            .error {
                background: #ffb0b1;
            }
        </style>
    </head>
    <body>
        <h1>Coding Style Check Results</h1>
        <table>
            <tr>
                <th colspan="2"><strong>Summary</strong></th>
            </tr>
            <tr>
                <td>Total files checked</td>
                <td><xsl:number level="any" value="count(descendant::file)"/></td>
            </tr>
            <tr>
                <td>Files with errors</td>
                <td><xsl:number level="any" value="count(descendant::file[error])"/></td>
            </tr>
            <tr>
                <td>Total errors</td>
                <td><xsl:number level="any" value="count(descendant::error[@severity='error'])"/></td>
            </tr>
            <tr>
                <td>Total warnings</td>
                <td><xsl:number level="any" value="count(descendant::error[@severity='warning'])"/></td>
            </tr>
            <tr>
                <td>Errors per file</td>
                <td><xsl:number level="any" value="count(descendant::error) div count(descendant::file)"/></td>
            </tr>
        </table>
        <hr/>
        <p>The following are violations of the Sun Coding-Style Standards:</p>
        <p/>
        <xsl:apply-templates/>
    </body>
</html>
</xsl:template>

<xsl:template match="file[error]">
    <table class="filetable">
        <colgroup>
            <col width="65"/>
            <col width="*"/>
        </colgroup>
        <thead>
            <tr>
                <th>File</th>
                <td>
                    <xsl:value-of select="@name"/>
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>Line Number</th>
                <th>Error Message</th>
            </tr>
        </tbody>
        <xsl:apply-templates select="error"/>
    </table>
    <p/>
</xsl:template>

<xsl:template match="error">
    <xsl:variable name="style">
        <xsl:choose>
            <xsl:when test="@severity='info'">info</xsl:when>
            <xsl:when test="@severity='warning'">warning</xsl:when>
            <xsl:otherwise>error</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <tr class="{$style}">
        <td><xsl:value-of select="@line"/></td>
        <td><xsl:value-of select="@message"/></td>
    </tr>
</xsl:template>

</xsl:stylesheet>
