function gestoreOver(a) { //Permette di evidenziare l' elemento con id indicato nell'href togliendo il simbolo #, l' elemento viene illuminato
	try {
		var n = document.getElementById(a.getAttribute("href"));
		n.style.backgroundColor = "rgba(255,127,0,0.5)";
	} catch( e ) { //Controlla se ci sono errori
		alert("gestoreOver" + e);
	}
}

function gestoreOut(a) { //Quando il mouse esce, l'elemento con id indicato con l'href, torna allo stato normale senza essere illuminato
	try {
		var n = document.getElementById(a.getAttribute("href"));
		n.style.backgroundColor = "transparent";		
	} catch( e ) {
		alert("gestoreOut" + e);
	}
}