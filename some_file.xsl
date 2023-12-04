<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
        <fo:layout-master-set>
            <fo:simple-page-master master-name="A4" page-width="8.27in" page-height="11.69in">
                <fo:region-body margin="1in"/>
            </fo:simple-page-master>
        </fo:layout-master-set>
        <fo:page-sequence master-reference="A4">
            <fo:flow flow-name="xsl-region-body">
                <fo:block font-family="DejaVuSans" font-size="12pt">
                    <!-- Your content goes here -->
                    <fo:block>Тhis is a sample text with Cyrillic characters: Т, е, м, а, №, К, А, Л</fo:block>
                    <fo:block>Additional text in the DejaVuSans font.</fo:block>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </fo:root>
</xsl:stylesheet>