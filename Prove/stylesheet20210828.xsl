<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
                xmlns="http://ww.3w.org/1999/xhtml" 
                xmlns:html="http://ww.3w.org/1999/xhtml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"> 
                <!-- togliere ns:html se non viene usato -->

<xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/"> <!-- match su tutto il documento -->
        <html> <!-- struttura HTML -->
            <head>
               
                <!-- titolo della pagina HTML -->
                <title>
                    <xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/title" />
                </title>
                
                <!-- collegamento foglio di stile CSS -->
                <link rel="stylesheet" type="text/css" href="./20210829.css" /> <!-- collegare foglio CSS con nome giusto -->
                
                <!-- collegamento javascript -->
                <script type="text/javascript" src="./progetto.js" /> <!-- collegare file .js con nome giusto -->
                
            </head>

            <body>
                <header>
                    <div class="split">
                        <img class="logo-left" src="./immagini/logo-unipi.svg"/>
                        <img class="logo-right" src="./immagini/logo-infouma.svg"/>
                    </div>

                    <h2>
                        <xsl:value-of select="//tei:author"/>
                    </h2>
                    
                    <h1>
                        <xsl:value-of select="//tei:title"/>
                    </h1>
                    
                <!--
                    <div id="box">
                        <ul>
                            <xsl:for-each select="//tei:respStmt/*">
                                <li>
                                   <xsl:value-of select="."/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                -->
                    <div id="box">
                        <xsl:for-each select="//tei:respStmt/*">
                            <p class="small">
                                <xsl:value-of select="."/>
                            </p>
                        </xsl:for-each>
                    </div>

                </header>

                <!--
                <div class="prova">
                    
                    <p>
                        <i>
                        <xsl:apply-templates select="//div[@n='011']" mode="index" />
                        </i>
                    </p>
                </div>
                <div>
                    <xsl:apply-templates select="child::node()" />
                </div>
                -->

            </body>

        </html>
    </xsl:template>
                
    <xsl:template match="div" mode="index">
        <ul>
            <xsl:for-each select=".">
                <li>
                    <xsl:value-of select="p" />
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    
    <xsl:template match="titleStmt/title">
        <h2>
            <xsl:value-of select="." />
        </h2>
    </xsl:template>
    
    <xsl:template match="div/p">
        <h3>
            <xsl:value-of select="." />
        </h3>
    </xsl:template>


</xsl:stylesheet>