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
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" />
                </title>
                
                <!-- collegamento foglio di stile CSS -->
                <link rel="stylesheet" type="text/css" href="./20210902.css" /> <!-- collegare foglio CSS con nome giusto -->
                
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
			    			<a href="#traduzione">
				    			<img class="img-menu" src="./immagini/traduzione.jpg"/>
					    		<div class="etichetta">
						    		<p class="textp"><xsl:text>Traduzione</xsl:text></p>
							    </div>
    						</a>
	    				</span>

		    			<span class="scelta-menu">
			    			<a href="#fonte-primaria">
				    			<img class="img-menu" src="./immagini/fonte-primaria.jpg"/>
					    		<div class="etichetta">
						    		<p class="textp"><xsl:text>La fonte primaria</xsl:text></p>
							    </div>
    						</a>
	    				</span>

                        <span class="scelta-menu">
			    			<a href="#bibliografia">
				    			<img class="img-menu" src="./immagini/bibliografia.jpg"/>
					    		<div class="etichetta">
						    		<p class="textp"><xsl:text>Bibliografia</xsl:text></p>
							    </div>
    						</a>
	    				</span>

		    		</nav>


                </header>

                <!-- primo box: Informazioni su Saussure -->
                <div id="saussure" class="box">
                    <h2><xsl:text>Ferdinand de Saussure</xsl:text></h2>
                    <xsl:for-each select="//tei:note[@n!='3']/text()">
                    <p>
                        <xsl:value-of select="."/>
                    </p>
                    </xsl:for-each>
                    <p> <!-- il terzo paragrafo ha un nodo figlio in più (non subito nodo testo), quindi metodo diverso -->
                        <xsl:apply-templates select="//tei:note[@n='3']" />
                    </p>
                    <img 
                    class="img-box"
                    alt="Disegno di Ferdinand de Saussure, creato da Edward Drantler." 
                    src="./immagini/saussure-by-drantler.jpg"/>
                    <p class="small">Disegno di Ferdinand de Saussure, creato da Edward Drantler 
                        [<a target="_blank" href="https://creativecommons.org/licenses/by/4.0/" >CC licensing</a>].</p>
                </div>
                <div id="torna-menu">
                    <a href="#menu"><xsl:text>Torna al menu</xsl:text></a>
                </div>


                <!-- secondo box: Informazioni sulla codifica -->
                <div id="info-codifica" class="box">
                    <h2><xsl:text>Informazioni sulla codifica</xsl:text></h2>
                    <h3><xsl:text>Responsabilità del testo: </xsl:text></h3>
                    <p> <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt" /> <br/></p>

                    <h3><xsl:text>Edizione del testo digitale: </xsl:text></h3>
                    <p> <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt" /> <br/></p>

                    <h3><xsl:text>Altre informazioni: </xsl:text></h3>
                    <p> <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:seriesStmt" /> </p>
                    <p> <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt" /> <br/></p>
                </div>
                <div id="torna-menu">
                    <a href="#menu"><xsl:text>Torna al menu</xsl:text></a>
                </div>


                 <!-- terzo box: metadati -->
                 <div id="info-metadati" class="box">
                    <h2><xsl:text>Morphologie, paragrafo 1: metadati</xsl:text></h2>
                    <h3><xsl:text>Il testo: </xsl:text></h3>
                    <p> <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listBibl/tei:bibl" /> </p>
                    <p> <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:extent" /> <br/></p>

                    <h3><xsl:text>Il manoscritto: </xsl:text></h3>
                    <p> <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc" /> <br/></p>
                    
                    <h3><xsl:text>Storia e datazione: </xsl:text></h3>
                    <p> <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:history" /> <br/></p>

                    <h3><xsl:text>Altre informazioni: </xsl:text></h3>
                    <p> <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents" /> </p>
                    <p> <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc" /> </p>
                    
                 </div>
                <div id="torna-menu">
                    <a href="#menu"><xsl:text>Torna al menu</xsl:text></a>
                </div>


                 <!-- terzo box: traduzione -->
                 <div id="traduzione" class="box-grande">
                    <h2><xsl:text>Morfologia, paragrafo 1: traduzione italiana</xsl:text></h2>
                    <div class="box-contenitore">
                    <span class="affiancato">
                        <h3><xsl:text>Il testo francese: </xsl:text></h3>
                        <p> <xsl:apply-templates select="/tei:TEI/tei:text/tei:group/tei:text[@xml:id='text_fr']/tei:body[@xml:id='text_fr_body']" /> </p>
                    </span>
                    <span class="affiancato">
                        <h3><xsl:text>La traduzione italiana: </xsl:text></h3>
                        <p> <xsl:apply-templates select="/tei:TEI/tei:text/tei:group/tei:text[@xml:id='text_it']/tei:body[@xml:id='text_it_body']" /> </p>
                    </span>
                    </div>
                </div>
                <div id="torna-menu">
                    <a href="#menu"><xsl:text>Torna al menu</xsl:text></a>
                </div>


                <!-- quinto box: La codifica della fonte primaria -->
                <div id="fonte-primaria" class="box">
                    <xsl:apply-templates select="/tei:TEI/tei:text/tei:group/tei:text/tei:body/tei:div[@n='011']" />
        
                    <xsl:copy-of select="."/>
                </div>
                <div id="torna-menu">
                    <a href="#menu"><xsl:text>Torna al menu</xsl:text></a>
                </div>

                <!-- footer -->
                <footer>
                    <p>Crediti:</p>
                    <p class="small">Caterina Farina e Laura Mazzagufo</p>
                    <p class="small">Corso di Codifica dei Testi, A.A. 2020/2021</p>
                    <p class="small">Corso di Laurea in Informatica Umanistica, Università di Pisa</p>
                </footer>

            </body>

        </html>
    </xsl:template>


    <!-- template per formattazione titolo -->
    <xsl:template match="//tei:title">
        <i><xsl:value-of select="."/></i>
    </xsl:template>

    <!-- template per i link nel testo -->
    <xsl:template match="//tei:ref[@target]">
       
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:attribute name="target">
                "_blank"
            </xsl:attribute>
            <xsl:value-of select="./text()"/>
        </xsl:element>

    </xsl:template>


    <!-- template per riempire "Informazioni sulla codifica: > Responsabilità del testo: "--> 
    <xsl:template match="tei:titleStmt">
        <xsl:value-of select="./tei:respStmt[1]"/><xsl:text>.</xsl:text><br/>
        <xsl:value-of select="./tei:respStmt[2]"/><xsl:text>.</xsl:text>
    </xsl:template>


    <!-- template per riempire "Informazioni sulla codifica: > Edizione del testo digitale: "--> 
    <xsl:template match="tei:editionStmt">
        <xsl:value-of select="./tei:edition"/><br/>

        <i><xsl:value-of select="./tei:respStmt[1]/tei:resp"/></i>
        <ul>    
            <xsl:for-each select="./tei:respStmt[1]/tei:name">
                <li>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>

        <p><i><xsl:value-of select="./tei:respStmt[2]/tei:resp"/></i></p>
        <ul>    
            <xsl:for-each select="./tei:respStmt[2]/tei:name">
                <li>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>

    </xsl:template>


    <!-- template per riempire "Informazioni sulla codifica: > Altre informazioni: "--> 
    <xsl:template match="tei:seriesStmt">
        <xsl:value-of select="./tei:respStmt"/>
        <xsl:text>.</xsl:text><br/>
    </xsl:template>
    <xsl:template match="tei:publicationStmt">
        <xsl:value-of select="./tei:authority"/><br/>
        <i><xsl:value-of select="./tei:availability/tei:p"/></i>
        <xsl:text>. </xsl:text>

        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="./tei:availability/tei:licence/@target"/>
            </xsl:attribute>
            <xsl:attribute name="target">
                "_blank"
            </xsl:attribute>
            <xsl:value-of select="./tei:availability/tei:licence"/>
        </xsl:element>
    </xsl:template>


    <!-- template per riempire "Morphologie, paragrafo 1: metadati: "--> 
    <!-- template per sezione "Il testo: "-->
    <xsl:template match="tei:listBibl/tei:bibl">
        <i><xsl:text>Autore: </xsl:text></i>
        <xsl:value-of select="./tei:author"/><br/>
        <i><xsl:text>Titolo: </xsl:text></i>
        <xsl:value-of select="./tei:title"/>
    </xsl:template>
    <xsl:template match="tei:extent">
        <i><xsl:text>Sezione: </xsl:text></i>
        <xsl:value-of select="./tei:measure[2]"/>
        <xsl:text>. </xsl:text>
        <xsl:value-of select="./tei:measure[1]"/>
        <xsl:text>.</xsl:text><br/>
    </xsl:template>
    <!-- template per sezione "Il manoscritto: "-->
    <xsl:template match="tei:msDesc">
        <i><xsl:text>Collocazione: </xsl:text></i>
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="./tei:msIdentifier/tei:repository/@ref"/>
            </xsl:attribute>
            <xsl:attribute name="target">
                "_blank"
            </xsl:attribute>
            <xsl:value-of select="./tei:msIdentifier/tei:repository"/>
        </xsl:element>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="./tei:msIdentifier/tei:settlement"/><xsl:text>, </xsl:text>
        <xsl:value-of select="./tei:msIdentifier/tei:country"/><xsl:text>)</xsl:text><br/>
        <i><xsl:text>Inventario: </xsl:text></i>
        <xsl:value-of select="./tei:msIdentifier/tei:collection"/><xsl:text>, </xsl:text>
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="./tei:msIdentifier/tei:idno/@ref"/>
            </xsl:attribute>
            <xsl:attribute name="target">
                "_blank"
            </xsl:attribute>
            <xsl:value-of select="./tei:msIdentifier/tei:idno"/>
        </xsl:element><br/>
        <i><xsl:text>Archival Resource Key: </xsl:text></i>
        <xsl:value-of select="./tei:msIdentifier/tei:altIdentifier/tei:idno"/><br/>
    </xsl:template>
    <!-- template per sezione "Storia e datazione: " -->
    <xsl:template match="tei:history">
        <i><xsl:text>Acquisizione: </xsl:text></i>
        <xsl:value-of select="./tei:acquisition/tei:p"/><br/>
        <i><xsl:text>Datazione: </xsl:text></i>
        <xsl:value-of select="./tei:origin/tei:p"/>
    </xsl:template>
    <!-- template per sezione "Altre informazioni: "-->
    <xsl:template match="tei:msContents">
        <i><xsl:text>Contenuto: </xsl:text></i>
        <xsl:value-of select="./tei:summary/tei:p"/><br/>
        <i><xsl:text>Lingua: </xsl:text></i>
        <xsl:value-of select="./tei:textLang"/>
    </xsl:template>
    <xsl:template match="tei:physDesc">
        <i><xsl:text>Descrizione fisica: </xsl:text></i>
        <xsl:text>Foliazione: </xsl:text>
        <xsl:value-of select="./tei:objectDesc/tei:supportDesc/tei:extent/tei:measure"/>
        <xsl:text>Dimensione: altezza </xsl:text>
        <xsl:value-of select="./tei:objectDesc/tei:supportDesc/tei:extent/tei:dimensions/tei:height"/>
        <xsl:text> mm, larghezza </xsl:text>
        <xsl:value-of select="./tei:objectDesc/tei:supportDesc/tei:extent/tei:dimensions/tei:width"/>
        <xsl:text> mm.</xsl:text><br/>
        <i><xsl:text>Supporto: </xsl:text></i>
        <xsl:value-of select="./tei:objectDesc/tei:supportDesc/tei:support/tei:material"/><xsl:text>. </xsl:text>
        <xsl:value-of select="./tei:objectDesc/tei:supportDesc/tei:support/tei:p"/><br/>
        <i><xsl:text>Descrizione del fascicolo: </xsl:text></i>
        <xsl:value-of select="./tei:objectDesc/tei:supportDesc/tei:collation/tei:p"/><br/>
        <i><xsl:text>Condizioni del fascicolo: </xsl:text></i>
        <xsl:value-of select="./tei:objectDesc/tei:supportDesc/tei:condition/tei:p"/><br/>
    </xsl:template>

    <!-- template per riempire "Morfologia, paragrafo 1: traduzione italiana" -->
    <!-- template per sezione "Il testo francese: " -->
    <xsl:template match="tei:body[@xml:id='text_fr_body']">
        <u><xsl:text>Pericope 011: </xsl:text></u>
        <xsl:value-of select="./tei:div[@n='011']/tei:div/tei:p[@n='1']"/><br/>
        <xsl:value-of select="./tei:div[@n='011']/tei:div/tei:p[@n='2']"/><br/>
        <xsl:value-of select="./tei:div[@n='011']/tei:div/tei:p[@n='3']"/><br/>
        <xsl:value-of select="./tei:div[@n='011']/tei:div/tei:p[@n='4']"/><br/>
        <xsl:value-of select="./tei:div[@n='011']/tei:div/tei:p[@n='5']"/><br/>
        <xsl:value-of select="./tei:div[@n='011']/tei:div/tei:p[@n='6']"/><br/>
        
        <u><xsl:text>Pericope 012: </xsl:text></u>
        <xsl:value-of select="./tei:div[@n='012']/tei:div/tei:p[@n='7']"/><br/>
        <xsl:value-of select="./tei:div[@n='012']/tei:div/tei:p[@n='8']"/><br/>
        <xsl:value-of select="./tei:div[@n='012']/tei:div/tei:p[@n='9']"/><br/>
        <xsl:value-of select="./tei:div[@n='012']/tei:div/tei:p[@n='10']"/><br/>
        <xsl:value-of select="./tei:div[@n='012']/tei:div/tei:p[@n='11']"/><br/>
        <xsl:value-of select="./tei:div[@n='012']/tei:div/tei:p[@n='12']"/><br/>
        <xsl:value-of select="./tei:div[@n='012']/tei:div/tei:p[@n='13']"/><br/>

        <u><xsl:text>Pericope 013: </xsl:text></u>
        <xsl:value-of select="./tei:div[@n='013']/tei:div/tei:p[@n='14']"/><br/>
        <xsl:value-of select="./tei:div[@n='013']/tei:div/tei:p[@n='15']"/><br/>
        <xsl:value-of select="./tei:div[@n='013']/tei:div/tei:p[@n='16']"/><br/>
        <xsl:value-of select="./tei:div[@n='013']/tei:div/tei:p[@n='17']"/><br/>
        <xsl:value-of select="./tei:div[@n='013']/tei:div/tei:p[@n='18']"/><br/>
    </xsl:template>
    <!-- template per sezione "La traduzione italiana: " -->
    <xsl:template match="tei:body[@xml:id='text_it_body']">
        <u><xsl:text>Pericope 011: </xsl:text></u>
        <xsl:value-of select="./tei:div[@n='011']/tei:div/tei:p[@n='1']"/><br/>
        <xsl:value-of select="./tei:div[@n='011']/tei:div/tei:p[@n='2']"/><br/>
        <xsl:value-of select="./tei:div[@n='011']/tei:div/tei:p[@n='3']"/><br/>
        <xsl:value-of select="./tei:div[@n='011']/tei:div/tei:p[@n='4']"/><br/>
        <xsl:value-of select="./tei:div[@n='011']/tei:div/tei:p[@n='5']"/><br/>
        <xsl:value-of select="./tei:div[@n='011']/tei:div/tei:p[@n='6']"/><br/>
         
        <u><xsl:text>Pericope 012: </xsl:text></u>
        <xsl:value-of select="./tei:div[@n='012']/tei:div/tei:p[@n='7']"/><br/>
        <xsl:value-of select="./tei:div[@n='012']/tei:div/tei:p[@n='8']"/><br/>
        <xsl:value-of select="./tei:div[@n='012']/tei:div/tei:p[@n='9']"/><br/>
        <xsl:value-of select="./tei:div[@n='012']/tei:div/tei:p[@n='10']"/><br/>
        <xsl:value-of select="./tei:div[@n='012']/tei:div/tei:p[@n='11']"/><br/>
        <xsl:value-of select="./tei:div[@n='012']/tei:div/tei:p[@n='12']"/><br/>
        <xsl:value-of select="./tei:div[@n='012']/tei:div/tei:p[@n='13']"/><br/>
    
        <u><xsl:text>Pericope 013: </xsl:text></u>
        <xsl:value-of select="./tei:div[@n='013']/tei:div/tei:p[@n='14']"/><br/>
        <xsl:value-of select="./tei:div[@n='013']/tei:div/tei:p[@n='15']"/><br/>
        <xsl:value-of select="./tei:div[@n='013']/tei:div/tei:p[@n='16']"/><br/>
        <xsl:value-of select="./tei:div[@n='013']/tei:div/tei:p[@n='17']"/><br/>
        <xsl:value-of select="./tei:div[@n='013']/tei:div/tei:p[@n='18']"/><br/>
    </xsl:template>



    <!--
    <xsl:template match="//div[@n='011']">

        <p>
            <xsl:copy-of select="."/>
        </p>

    </xsl:template>
    -->

</xsl:stylesheet>
