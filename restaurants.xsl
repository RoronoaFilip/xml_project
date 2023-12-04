<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="page" page-width="21cm" page-height="29.7cm" margin="2cm">
                    <fo:region-body margin="2cm" />
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <!--Project title page -->
            <fo:page-sequence master-reference="page" font-family="DejaVuSans">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block position="absolute" text-align="right" font-size="40pt" margin-bottom="30mm" padding-before="30mm"> Тема №26:
                        <fo:block /> 
                        КАТАЛОГ НА Ресторанти - 1 </fo:block>
                    <fo:block position="absolute">
                        <fo:block margin-bottom="5mm" text-align="center" font-size="24pt" font-style="italic">Курсов проект</fo:block>
                        <fo:block text-align="center" font-size="16pt">XML технологии за семантичен уеб, зимен семестър 2022/2023 г.</fo:block>
                        <fo:block text-align="justify" padding-before="30mm" font-size="14pt">
                            <fo:table>
                                <fo:table-column column-width="35mm" />
                                <fo:table-column column-width="150mm" />
                                <fo:table-body>
                                    <fo:table-row>
                                        <fo:table-cell>
                                            <fo:block font-style="italic">Изготвен от:</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block>Филип Красимиров Филчев, ФН: 0MI0600041</fo:block>
                                            <fo:block margin-bottom="10mm">Александър Стоянов Стоянов, ФН: 3MI0600088</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell>
                                            <fo:block font-style="italic">Проверен от:</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block margin-bottom="30mm">гл. ас. д-р Явор Данков</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </fo:table-body>
                            </fo:table>
                        </fo:block>
                        <fo:block text-align="center"> януари 2023 г.
                            <fo:block /> гр. София </fo:block>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
            <!--Each Region on a new Page-->
            <xsl:for-each select="//region">
                <fo:page-sequence master-reference="page"  font-family="DejaVuSans">
                    <fo:flow flow-name="xsl-region-body">
                        <fo:block font-size="24pt" font-weight="bold" text-align="center" space-after="12pt" color="#0066cc">
                            <xsl:value-of select="name" />
                        </fo:block>
                        <fo:block space-after="18pt" />
                        <!--Each Restaurant in the current Region-->
                        <xsl:for-each select="/catalogue/restaurants/restaurant[@regionRef = current()/@regionId]">
                            <fo:block space-after="18pt" border="1pt solid #CCCCCC" padding="16pt">
                                <fo:table table-layout="fixed" width="100%">
                                    <fo:table-column column-width="70%" />
                                    <fo:table-column column-width="30%" />
                                    <fo:table-body>
                                        <fo:table-row>
                                            <!--Restaurant Info to the Left.-->
                                            <fo:table-cell>
                                                <!--Restaurant Name-->
                                                <fo:block font-size="18pt" font-weight="bold" space-after="8pt" color="#333333">
                                                    <xsl:value-of select="name" />
                                                </fo:block>
                                                <!--Restaurant Chain, if present-->
                                                <fo:block font-size="10pt" space-after="6pt" color="#666666">
                                                    <xsl:choose>
                                                        <xsl:when test="@chainRef"> Restaurant Chain:
                                                            <xsl:value-of select="@chainRef" />
                                                        </xsl:when>
                                                        <xsl:otherwise> Restaurant Chain: UNKNOWN </xsl:otherwise>
                                                    </xsl:choose>
                                                </fo:block>
                                                <!--Restaurant Type-->
                                                <fo:block font-size="10pt" space-after="6pt" color="#666666"> Type:
                                                    <xsl:value-of select="type" />
                                                </fo:block>
                                                <!--Restaurant Rating-->
                                                <fo:block font-size="10pt" space-after="6pt" color="#666666"> Rating:
                                                    <xsl:value-of select="rating" />
                                                </fo:block>
                                                <!--Restaurant Description-->
                                                <fo:block font-size="10pt" space-after="6pt" color="#666666"> Description:
                                                    <xsl:value-of select="description" />
                                                </fo:block>
                                            </fo:table-cell>
                                            <!--Image to the right-->
                                            <fo:table-cell>
                                                <!--Image Block-->
                                                <fo:block>
                                                    <fo:external-graphic>
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="concat('url(images/', current()/image/@href, ')')" />
                                                        </xsl:attribute>
                                                        <xsl:attribute name="content-width">70mm</xsl:attribute>
                                                        <xsl:attribute name="content-height">50mm</xsl:attribute>
                                                    </fo:external-graphic>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                            </fo:block>
                        </xsl:for-each>
                    </fo:flow>
                </fo:page-sequence>
            </xsl:for-each>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>