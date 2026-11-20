<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/releve">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Relevé bancaire</title>
                <style>
                    table { border-collapse: collapse; }
                    th, td { border: 1px solid #333; padding: 6px 12px; }
                    th { background: #ddd; }
                </style>
            </head>
            <body>
                <h1>Relevé bancaire</h1>
                <p><b>RIB :</b> <xsl:value-of select="@RIB"/></p>
                <p><b>Date du relevé :</b> <xsl:value-of select="dateReleve"/></p>
                <p><b>Solde :</b> <xsl:value-of select="solde"/></p>
                <p><b>Période :</b> du <xsl:value-of select="operations/@dateDebut"/>
                    au <xsl:value-of select="operations/@dateFin"/></p>

                <table>
                    <tr>
                        <th>Type</th><th>Date</th><th>Montant</th><th>Description</th>
                    </tr>
                    <xsl:for-each select="operations/operation">
                        <tr>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                </table>

                <h3>Total des opérations de crédit :
                    <xsl:value-of select="sum(operations/operation[@type='CREDIT']/@montant)"/></h3>
                <h3>Total des opérations de débit :
                    <xsl:value-of select="sum(operations/operation[@type='DEBIT']/@montant)"/></h3>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
