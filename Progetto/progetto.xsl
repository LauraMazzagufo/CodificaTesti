<?xml version="1.0" encoding="UTF-8"?>

<!-- Aggiungere in <xsl:stylesheet>? xmlns:html="http://ww.3w.org/1999/xhtml" -->

<xsl:stylesheet version="1.0" 
                xmlns="https://www.w3.org/1999/xhtml" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"> 

<xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/"> <!-- match su tutto il documento -->

        <html> <!-- struttura HTML -->
            <head>
               
                <!-- titolo della pagina HTML -->
                <title>
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" />
                </title>
                
                <!-- Includi jQuery -->
                <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

                <!-- collegamento javascript -->
                <script type="text/javascript">
                    <![CDATA[
                    $(document).ready(function() {
                        // Seleziona tutti i paragrafi con id che inizia con 'p' e termina con '-fr' o '-it'
                        $("p[id^='p']").hover(
                            function() {
                                // Quando il mouse entra nel paragrafo
                    
                                // Recupera l'ID del paragrafo
                                var id = $(this).attr('id');
                    
                                // Estrai il numero dall'ID del paragrafo utilizzando una regex
                                var num = id.match(/\d+/)[0];
                    
                                // Costruisci l'ID del paragrafo in italiano e in francese concatenando il numero estratto
                                var id_it = "p" + num + "-it";
                                var id_fr = "p" + num + "-fr";
                    
                                // Trova i corrispondenti paragrafi in italiano e francese e aggiungi la classe "highlight"
                                $("p[id='" + id_it + "'], p[id='" + id_fr + "']").addClass("highlight");
                            },
                            function() {
                                // Quando il mouse esce dal paragrafo
                    
                                // Rimuovi la classe "highlight" da tutti i paragrafi in italiano e francese
                                $("p[id^='p']").removeClass("highlight");
                            }
                        );
                    });
                    
                      ]]>
                </script>

                
                <!-- collegamento foglio di stile CSS -->
                <link rel="stylesheet" type="text/css" href="./progetto.css" /> <!-- collegare foglio CSS con nome giusto -->

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


                 <!-- quarto box: traduzione -->
                 <div id="traduzione" class="box-grande">
                    <h2><xsl:text>Morfologia, paragrafo 1: traduzione italiana</xsl:text></h2>
                    <p class="small">Nel testo sono evidenziati in verde gli esempi linguistici in lingua diversa da quella del testo (francese), in giallo i termini tecnici di dominio linguistico. Sono inoltre riportate le sottolineature presenti nella fonte primaria e sono state formattate in corsivo le forme ricostruite.</p>
                    <div class="box-contenitore">
                    <span class="affiancato">
                        <h3><xsl:text>Il testo francese: </xsl:text></h3>
                        <xsl:apply-templates select="/tei:TEI/tei:text/tei:group/tei:text[@xml:id='text_fr']/tei:body[@xml:id='text_fr_body']" />
                    </span>
                    <span class="affiancato">
                        <h3><xsl:text>La traduzione italiana: </xsl:text></h3>
                        <xsl:apply-templates select="/tei:TEI/tei:text/tei:group/tei:text[@xml:id='text_it']/tei:body[@xml:id='text_it_body']" />
                    </span>
                    </div>
                
                    <!-- glossario -->
                    <div id="glossario" class="box">
                        <h2><xsl:text>Glossario</xsl:text></h2>
                        <xsl:apply-templates select="/tei:TEI/tei:text/tei:group/tei:text[@xml:id='text_fr']/tei:back/tei:div[@type='glossary']" />
                    </div>
                </div>
                
                <div id="torna-menu">
                    <a href="#menu"><xsl:text>Torna al menu</xsl:text></a>
                </div>


                <!-- quinto box: La codifica della fonte primaria -->
                <div id="fonte-primaria" class="box-grande">
                    <h2><xsl:text>La fonte primaria</xsl:text></h2>
                    <div class="box-contenitore">
                    <span class="affiancato">
                        <h3><xsl:text>Informazioni</xsl:text></h3><br/>
                        <p> <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:layoutDesc" /></p><br/>
                        <p> <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc" /></p><br/>
                        <p> <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:handDesc" /></p>
                    </span>
                    <span class="affiancato">
                        <h3><xsl:text>Il manoscritto</xsl:text></h3>
                        <xsl:apply-templates select="/tei:TEI/tei:facsimile/tei:surface[@xml:id='ms_fr_03951_07_p001']/tei:graphic" />
                    </span>
                    </div>

                    <h2><xsl:text>La fonte primaria</xsl:text></h2>
                        <div class="box-contenitore">
                            <span class="affiancato">
                                <h3><xsl:text>Il manoscritto</xsl:text></h3>
                                <xsl:apply-templates select="/tei:TEI/tei:facsimile/tei:surface[@xml:id='ms_fr_03951_07_p001']/tei:graphic" />
                            </span>
                            <span class="affiancato">
                                <h3><xsl:text>Trascrizione diplomatica della prima pagina</xsl:text></h3>
                                <i><p class="small">In questa sezione il testo è trascritto diplomaticamente, senza lo scioglimento delle abbreviazioni e con le ortografie e le interruzioni di riga originali.</p></i>
                                <p class="large"> <xsl:apply-templates select="/tei:TEI/tei:text/tei:group/tei:text/tei:body/tei:div[@xml:id='pericope-011']" /></p><br/>
                                <p class="large"> <xsl:apply-templates select="/tei:TEI/tei:text/tei:group/tei:text/tei:body/tei:div[@xml:id='pericope-012']/tei:div[@xml:id='def2-generale']" /></p>
                            </span>
                        </div>
                        <div class="box-contenitore">
                            <span class="affiancato">
                                <xsl:apply-templates select="/tei:TEI/tei:facsimile/tei:surface[@xml:id='ms_fr_03951_07_p002']/tei:graphic" />
                            </span>
                            <span class="affiancato">
                                <h3><xsl:text>Trascrizione diplomatica della seconda pagina</xsl:text></h3>
                                <i><p class="small">In questa sezione il testo è trascritto diplomaticamente, senza lo scioglimento delle abbreviazioni e con le ortografie e le interruzioni di riga originali.</p></i>
                                <p class="large"> <xsl:apply-templates select="/tei:TEI/tei:text/tei:group/tei:text/tei:body/tei:div[@xml:id='pericope-012']/tei:div[@xml:id='esempio']" /></p>
                            </span>
                        </div>
                        <div class="box-contenitore">
                            <span class="affiancato">
                                <xsl:apply-templates select="/tei:TEI/tei:facsimile/tei:surface[@xml:id='ms_fr_03951_07_p003']/tei:graphic" />
                            </span>
                            <span class="affiancato">
                                <h3><xsl:text>Trascrizione diplomatica della terza pagina</xsl:text></h3>
                                <i><p class="small">In questa sezione il testo è trascritto diplomaticamente, senza lo scioglimento delle abbreviazioni e con le ortografie e le interruzioni di riga originali.</p></i>
                                <p class="large"> <xsl:apply-templates select="/tei:TEI/tei:text/tei:group/tei:text/tei:body/tei:div[@xml:id='pericope-013']" /></p>
                            </span>
                        </div>
                </div>
                <div id="torna-menu">
                <a href="#menu"><xsl:text>Torna al menu</xsl:text></a>
                </div>


                 <!-- sesto box: Bibliografia -->
                <div id="bibliografia" class="box">
                    <h2><xsl:text>Bibliografia</xsl:text></h2>
                    <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listBibl" />
                </div>
                <div id="torna-menu">
                    <a href="#menu"><xsl:text>Torna al menu</xsl:text></a>
                </div>


                
                <!-- footer -->
                <footer>
                    <p>Crediti:</p>
                    <p class="small">Laura Mazzagufo</p>
                    <p class="small">Corso di Codifica dei Testi, A.A. 2020/2021</p>
                    <p class="small">Corso di Laurea in Informatica Umanistica, Università di Pisa</p>
                </footer>

            </body>

        </html>
    </xsl:template>

    <!-- template per interruzione di riga  -->
    <xsl:template match="tei:lb">
        <br/>
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
        <xsl:value-of select="./tei:objectDesc/tei:supportDesc/tei:collation/tei:p"/>
    </xsl:template>

    <!-- template per riempire "Morfologia, paragrafo 1: traduzione italiana" -->
    <!-- template per sezione "Il testo francese: " -->
    <xsl:template match="tei:body[@xml:id='text_fr_body']">
        <p><u><xsl:text>Pericope 011: </xsl:text></u></p>
        <xsl:for-each select="./tei:div[@n='011']/tei:div/tei:p">
            <xsl:element name="p">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:apply-templates select="node()[not(self::tei:expan or self::tei:lb)]"/>
            </xsl:element>
        </xsl:for-each>

        <p><u><xsl:text>Pericope 012: </xsl:text></u></p>
        <xsl:for-each select="./tei:div[@n='012']/tei:div/tei:p">
            <xsl:element name="p">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:apply-templates select="node()[not(self::tei:expan or self::tei:lb)]"/>
            </xsl:element>
        </xsl:for-each>

        <p><u><xsl:text>Pericope 013: </xsl:text></u></p>
        <xsl:for-each select="./tei:div[@n='013']/tei:div/tei:p">
            <xsl:element name="p">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:apply-templates select="node()[not(self::tei:expan or self::tei:lb)]"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>


    <!-- template per sezione "La traduzione italiana: " -->
    <xsl:template match="tei:body[@xml:id='text_it_body']">
        <u><xsl:text>Pericope 011: </xsl:text></u>
        <xsl:for-each select="./tei:div[@n='011']/tei:div/tei:p">
            <xsl:element name="p">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:for-each>
    
        <p><u><xsl:text>Pericope 012: </xsl:text></u></p>
        <xsl:for-each select="./tei:div[@n='012']/tei:div/tei:p">
            <xsl:element name="p">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:for-each>

        <p><u><xsl:text>Pericope 013: </xsl:text></u></p>
        <xsl:for-each select="./tei:div[@n='013']/tei:div/tei:p">
            <xsl:element name="p">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>


    <!-- template per riempire "La fonte primaria" -->
    <!-- template per sezione "Informazioni: " -->
    <xsl:template match="tei:layoutDesc">
        <i><xsl:text>Tipo di materiale autografo: </xsl:text></i>
        <p><xsl:value-of select="./tei:p"/></p>
    </xsl:template>
    <xsl:template match="tei:objectDesc">
        <i><xsl:text>Condizioni del fascicolo: </xsl:text></i>
        <p><xsl:value-of select="./tei:supportDesc/tei:condition/tei:p"/></p><br/>

        <p><i><xsl:text>Numerazione delle pagine: </xsl:text></i></p>
        <xsl:for-each select="./tei:supportDesc/tei:foliation">
            <p><xsl:value-of select="tei:p"/></p>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:handDesc">
        <i><xsl:text>Mani: </xsl:text></i>
        <xsl:for-each select="./tei:handNote">
        <p>
            <xsl:value-of select="@xml:id"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="tei:p"/>
        </p>
        </xsl:for-each>
    </xsl:template>

    <!-- template per gestione abbreviazioni e ortografie -->
    <xsl:template match="tei:p//tei:expan">
        <xsl:value-of select="tei:abbr" />
    </xsl:template>

    <xsl:template match="tei:p//tei:reg">
        <xsl:value-of select="tei:orig" />
    </xsl:template>
    

    <!-- template per visualizzazione fonte primaria -->
    <xsl:template match="tei:surface[@xml:id='ms_fr_03951_07_p001']/tei:graphic">
        <xsl:element name="img">
            <xsl:attribute name="class">
                img-facs
            </xsl:attribute>
            <xsl:attribute name="src">
                <xsl:value-of select="@url"/>
            </xsl:attribute>
            <xsl:attribute name="alt">
                Prima pagina della fonte primaria
            </xsl:attribute>
            <xsl:attribute name="style">
                width:100%; height:100%; object-fit: contain;
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:surface[@xml:id='ms_fr_03951_07_p002']/tei:graphic">
        <xsl:element name="img">
            <xsl:attribute name="class">
                img-facs
            </xsl:attribute>
            <xsl:attribute name="src">
                <xsl:value-of select="@url"/>
            </xsl:attribute>
            <xsl:attribute name="alt">
                Seconda pagina della fonte primaria
            </xsl:attribute>
            <xsl:attribute name="style">
                width:100%; height:100%; object-fit: contain;
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

<xsl:template match="tei:surface[@xml:id='ms_fr_03951_07_p003']/tei:graphic">
    <xsl:element name="img">
        <xsl:attribute name="class">
            img-facs
        </xsl:attribute>
        <xsl:attribute name="src">
            <xsl:value-of select="@url"/>
        </xsl:attribute>
        <xsl:attribute name="alt">
            Terza pagina della fonte primaria
        </xsl:attribute>
        <xsl:attribute name="style">
            width:100%; height:100%; object-fit: contain;
        </xsl:attribute>
    </xsl:element>
    </xsl:template>


    <!-- template per visualizzazione della bibliografia -->
    <xsl:template match="tei:listBibl">

        <ul>    
            <p><xsl:text>Manoscritto: </xsl:text></p>

            <xsl:for-each select="./tei:bibl">
            <li>
                <xsl:value-of select="./tei:author"/><xsl:text>, </xsl:text>
                <i><xsl:value-of select="./tei:title"/></i><xsl:text>, </xsl:text>
                <xsl:value-of select="./tei:pubPlace"/><xsl:text>: </xsl:text>
                <xsl:value-of select="./tei:publisher"/><xsl:text>, </xsl:text>
                <xsl:value-of select="./tei:date"/><xsl:text>. </xsl:text>
            </li>
            </xsl:for-each>

            <p><xsl:text>Risorse bibliografiche: </xsl:text></p>
            <xsl:for-each select="./tei:biblStruct/tei:monogr">
                <li>
                    <b>
                        <xsl:value-of select="./@xml:id"/><xsl:text>: </xsl:text> 
                    </b>
                    <xsl:value-of select="./tei:author"/><xsl:text>, </xsl:text>
                    <i><xsl:value-of select="./tei:title"/><xsl:value-of select="./tei:title[@type='sub']"/></i><xsl:text>, </xsl:text>
                    <xsl:value-of select="./tei:imprint/tei:pubPlace"/><xsl:text>: </xsl:text>
                    <xsl:value-of select="./tei:imprint/tei:publisher"/><xsl:text>, </xsl:text>
                    <xsl:value-of select="./tei:imprint/tei:date"/><xsl:text>. </xsl:text>
                </li>
            </xsl:for-each>
        </ul>
        
    </xsl:template>


    <!-- template per visualizzazione del glossario -->
    <xsl:template match="tei:div[@type='glossary']">
        <p><xsl:value-of select=".//tei:head"/></p>
        <ul>
            <xsl:for-each select="tei:list/tei:item">
                <!-- Estrae il contenuto testuale di term e gloss -->
                <xsl:variable name="termText" select="tei:term"/>
                <xsl:variable name="glossText" select="tei:gloss"/>

                <li>
                    <u><xsl:value-of select="$termText"/></u><xsl:text>: </xsl:text><xsl:value-of select="$glossText"/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>


    <!-- template per tabelle -->
    <xsl:template match="//tei:table">
        <table border="1">
            <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xsl:template match="//tei:row">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>

    <xsl:template match="//tei:cell">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <!-- template per formattazione  -->
    <xsl:template match="tei:hi[@rend='underline']">
        <u><xsl:apply-templates/></u>
      </xsl:template>

     <!--template per termini ricostruiti  -->
    <xsl:template match="tei:distinct">
        <i><xsl:apply-templates /></i>
    </xsl:template>

    <!--template per termini in lingua diversa dal francese -->
    <xsl:template match="tei:foreign">
        <span class="highlight">
            <xsl:apply-templates/>
          </span>
    </xsl:template>

    <!--template per termini di dominio linguistico -->
    <xsl:template match="tei:term">
        <span class="highlight2">
            <xsl:apply-templates/>
          </span>
    </xsl:template>

</xsl:stylesheet>