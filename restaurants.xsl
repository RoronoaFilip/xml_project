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
                    <fo:block position="absolute" text-align="right" font-size="40pt" margin-bottom="30mm" padding-before="15mm"> Тема №26:
                        <fo:block /> 
                        КАТАЛОГ НА Ресторанти - 1 </fo:block>
                    <fo:block position="absolute">
                        <fo:block margin-bottom="5mm" text-align="center" font-size="24pt" font-style="italic">Курсов проект</fo:block>
                        <fo:block text-align="center" font-size="16pt">XML технологии за семантичен уеб, зимен семестър 2022/2023 г.</fo:block>
                        <fo:block text-align="justify" padding-before="15mm" font-size="14pt">
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
                <fo:page-sequence master-reference="page" font-family="DejaVuSans">
                    <fo:flow flow-name="xsl-region-body">
                        <fo:block font-size="24pt" font-weight="bold" text-align="center" space-after="12pt" color="#000000">
                            <xsl:value-of select="name" />
                        </fo:block>
                        <fo:block space-after="18pt" />
                        <!--Each Restaurant in the current Region-->
                        <xsl:for-each select="/catalogue/restaurants/restaurant[@regionRef = current()/@regionId]">
                            <xsl:variable name="position" select="position()" />
                            <fo:block space-after="18pt" border="2pt solid #336699" padding="16pt" background-color="#F0F0F0">
                                <xsl:if test="$position > 1">
                                    <xsl:attribute name="page-break-before">always</xsl:attribute>
                                </xsl:if>
                                <fo:table width="100%">
                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <!-- Restaurant Name -->
                                                <fo:block text-align="center" font-size="18pt" font-weight="bold" space-after="8pt" color="#333333">
                                                    <xsl:value-of select="name" />
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <!-- Restaurant Info -->
                                                <fo:block padding-before="8pt">
                                                    <!-- Restaurant Chain, if present -->
                                                    <fo:block font-size="10pt" space-after="6pt" color="#666666">
                                                        <xsl:choose>
                                                            <xsl:when test="@chainRef">Верига Ресторанти:
                                                                <xsl:value-of select="/catalogue/restaurant-chains/chain[@chainId = current()/@chainRef]/name" />
                                                            </xsl:when>
                                                            <xsl:otherwise>Верига Ресторанти: UNKNOWN </xsl:otherwise>
                                                        </xsl:choose>
                                                    </fo:block>
                                                    <!-- Restaurant Type -->
                                                    <fo:block font-size="10pt" space-after="6pt" color="#666666"> Тип:
                                                        <xsl:value-of select="type" />
                                                    </fo:block>
                                                    <!-- Restaurant Rating -->
                                                    <fo:block font-size="10pt" space-after="6pt" color="#666666"> Рейтинг:
                                                        <xsl:value-of select="rating" />
                                                    </fo:block>
                                                    <!-- Restaurant Description -->
                                                    <fo:block font-size="10pt" space-after="6pt" color="#666666"> Описание:
                                                        <xsl:value-of select="description" />
                                                    </fo:block>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                                <fo:table width="100%">
                                    <fo:table-body>
                                        <fo:table-row>
                                            <xsl:for-each select="current()/images/image">
                                                <fo:table-cell padding-before="8pt">
                                                    <!-- Image Block with space between each image -->
                                                    <fo:block text-align="center" space-after="5mm">
                                                        <fo:external-graphic>
                                                            <xsl:attribute name="src">
                                                                <xsl:value-of select="concat('url(images/', ., ')')" />
                                                            </xsl:attribute>
                                                            <xsl:attribute name="content-width">70mm</xsl:attribute>
                                                            <xsl:attribute name="content-height">50mm</xsl:attribute>
                                                        </fo:external-graphic>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </xsl:for-each>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                            </fo:block>
                        </xsl:for-each>
                    </fo:flow>
                </fo:page-sequence>
            </xsl:for-each>
            <fo:page-sequence master-reference="page" font-family="DejaVuSans">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="24pt" font-weight="bold" text-align="left" space-after="4pt" color="#000000">
                Източници:
            </fo:block>
                    <fo:block space-after="18pt" />
                    <fo:block text-align="justify" font-size="14pt">
                        <fo:table>
                            <fo:table-column column-width="100%" />
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block>https://www.tripadvisor.com/</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block>https://chefs-bg.com/en/</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block>https://aylyakria.com/</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block>https://lepetitparis.bg/</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block>https://incanto.bg/</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block>https://www.elkapan.com/</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>