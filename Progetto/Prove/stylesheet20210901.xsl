<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
                xmlns="http://ww.3w.org/1999/xhtml" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"> 
                <!-- xmlns:html="http://ww.3w.org/1999/xhtml" -->

<xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/"> <!-- match su tutto il documento -->

        <html> <!-- struttura HTML -->
            <head>
               
                <!-- titolo della pagina HTML -->
                <title>
                    <xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/title" />
                </title>
                
                <!-- collegamento foglio di stile CSS -->
                <link rel="stylesheet" type="text/css" href="./20210830.css" /> <!-- collegare foglio CSS con nome giusto -->
                
                <!-- collegamento javascript -->
                <script type="text/javascript" src="./progetto.js" /> <!-- collegare file .js con nome giusto -->

            </head>

            <body>
                <header>
                    <!-- intestazione con loghi università linkati -->
                    <div id="intestazione" class="split">
                        <a target="_blank" alt="Logo UNiversità di Pisa" href="https://www.unipi.it/">
                            <img class="logo-left" src="./immagini/logo-unipi.svg"/>
                        </a>
                        <a target="_blank" alt="Logo Informatica Umanistica" href="https://infouma.fileli.unipi.it/">
                            <img class="logo-right" src="./immagini/logo-infouma.svg"/>
                        </a>
                    </div>

                    <!-- titolo della pagina: autore e titolo -->
                    <h2>
                        <xsl:value-of select="//tei:author"/>
                    </h2>
                    
                    <h1>
                        <xsl:value-of select="//tei:title"/>
                    </h1>
                    
                    <!-- menù navigazione della pagina -->
				    <nav id="menu">
                        <span class="scelta-menu">
			    			<a href="#saussure">
				    			<img class="img-menu" src="./immagini/saussure.jpg"/>
					    		<div class="etichetta">
						    		<p class="textp"><xsl:text>F. de Saussure</xsl:text></p>
							    </div>
    						</a>
	    				</span>

    					<span class="scelta-menu">
	    					<a href="#info-codifica">
		        				<img class="img-menu" src="./immagini/codifica.jpg" style="width:100%"/>
				    			<div class="etichetta">
					    			<p class="textp"><xsl:text>La codifica</xsl:text></p>
						    	</div>
    						</a>
	    				</span>

		    			<span class="scelta-menu">
			    			<a href="#info-metadati">
				    			<img class="img-menu" src="./immagini/metadati.jpg"/>
					    		<div class="etichetta">
						    		<p class="textp"><xsl:text>Metadati</xsl:text></p>
							    </div>
    						</a>
	    				</span>

                        <span class="scelta-menu">
			    			<a href="#paragrafo-primo">
				    			<img class="img-menu" src="./immagini/paragrafo-primo.jpg"/>
					    		<div class="etichetta">
						    		<p class="textp"><xsl:text>Morfologie, p. 1</xsl:text></p>
							    </div>
    						</a>
	    				</span>

		    			<span class="scelta-menu">
			    			<a href="#fonte-primaria.html">
				    			<img class="img-menu" src="./immagini/fonte-primaria.jpg"/>
					    		<div class="etichetta">
						    		<p class="textp"><xsl:text>La fonte primaria</xsl:text></p>
							    </div>
    						</a>
	    				</span>

                        <span class="scelta-menu">
			    			<a href="#traduzione">
				    			<img class="img-menu" src="./immagini/traduzione.jpg"/>
					    		<div class="etichetta">
						    		<p class="textp"><xsl:text>Traduzione</xsl:text></p>
							    </div>
    						</a>
	    				</span>

		    		</nav>


                </header>

                <div id="saussure" class="box">
                    <h2><xsl:text>Ferdinand de Saussure</xsl:text></h2>
                    <xsl:for-each select="//tei:note[@n!='3']/text()">
                    <p class="small">
                        <xsl:value-of select="."/>
                    </p>
                    </xsl:for-each>
                    <p  class="small">
                        <xsl:apply-templates select="//tei:note[@n='3']" />
                    </p>
                </div>

                <div id="info-codifica" class="box">
                    <h2><xsl:text>La codifica</xsl:text></h2>
                    <xsl:for-each select="//tei:respStmt/*">
                        <p class="small">
                            <xsl:value-of select="."/>
                        </p>
                    </xsl:for-each>
                </div>

                <div>
                    <xsl:apply-templates select="/tei:TEI/tei:text/tei:group/tei:text/tei:body/tei:div[@n='011']" />
        
                    <xsl:copy-of select="."/>
                </div>

            </body>

        </html>
    </xsl:template>

    <xsl:template match="//tei:ref[@target]">
       
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:value-of select="./text()"/>
        </xsl:element>

    </xsl:template>

    <!--
    <xsl:template match="//div[@n='011']">

        <p>
            <xsl:copy-of select="."/>
        </p>

    </xsl:template>
    -->

</xsl:stylesheet>