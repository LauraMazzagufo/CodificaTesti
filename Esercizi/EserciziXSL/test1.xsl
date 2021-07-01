<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
                xmlns="http://ww.3w.org/1999/xhtml" 
                xmlns:html="http://ww.3w.org/1999/xhtml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

    <xsl:output 
        method="html"
        indent="yes" /> <!-- oppure @method="text" per plain text -->

    <xsl:template match="/"> <!-- indica che la regola di template va applicata all'intero documento sorgente
                                il primo match si attiva semplicemente quando abbiamo un documento XML in input
                             -->
        <xsl:apply-templates select="/test/msg"/> <!-- naviga l'albero a partire dal nodo msg, figlio del nodo test -->
    </xsl:template>
    
</xsl:stylesheet>
