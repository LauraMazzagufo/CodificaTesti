// $(document).ready(function() {
// 	// Seleziona tutti i paragrafi con id che inizia con 'p' e termina con '-fr'
// 	$("p[id^='p'][id$='-fr']").hover(
// 		function() {
// 			// Quando il mouse entra nel paragrafo francese

// 			// Recupera l'ID del paragrafo in francese
// 			var id_fr = $(this).attr('id');

// 			// Estrai il numero dall'ID del paragrafo francese utilizzando una regex
// 			var num = id_fr.match(/\d+/)[0];

// 			// Costruisci l'ID del paragrafo italiano concatenando il numero estratto
// 			var id_it = "p" + num + "-it";

// 			// Trova il corrispondente paragrafo in italiano e aggiungi la classe "highlight"
// 			$("#" + id_it).addClass("highlight");
// 		},
// 		function() {
// 			// Quando il mouse esce dal paragrafo francese

// 			// Rimuovi la classe "highlight" da tutti i paragrafi in italiano
// 			$("p[id$='-it']").removeClass("highlight");
// 		}
// 	);
//   });

alert("Script funziona!");

