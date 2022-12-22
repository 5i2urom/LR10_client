<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <h1>Result</h1>
    <div id="result">
        <xsl:for-each select="hash">
            <table>
                <tr>
                    <td> <h3>All-seqs: <xsl:value-of select="all-seqs"/></h3></td>
                </tr>
                <tr>
                    <td> <h3>Count: <xsl:value-of select="count"/></h3></td>
                </tr>
                <tr>
                    <td> <h3> Longest: <xsl:value-of select="longest"/></h3></td>
                </tr>
            </table>
        </xsl:for-each>
    </div>
</xsl:template>
</xsl:stylesheet>
