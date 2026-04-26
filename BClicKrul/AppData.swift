import Foundation
import SwiftUI

enum AppData {
    static func quickFacts(_ language: AppLanguage) -> [QuickFact] {
        [
            QuickFact(
                value: "Curve",
                title: language.text("Signature roll", "Signatur-Kurve", "Roulement signature", "Rodado caracteristico"),
                detail: language.text(
                    "A krulbol bends on purpose. The whole sport is about reading that curved line early.",
                    "Ein Krulbol biegt absichtlich. Das Spiel lebt davon, diese Linie fruh zu lesen.",
                    "La krulbol suit une courbe voulue. Tout le jeu repose sur la lecture de cette trajectoire.",
                    "La krulbol se curva a proposito. Todo el juego consiste en leer esa linea temprano."
                )
            ),
            QuickFact(
                value: "3-4",
                title: language.text("Players per side", "Spieler pro Team", "Joueurs par equipe", "Jugadores por lado"),
                detail: language.text(
                    "Many local sessions are played with small teams, which keeps rotations simple and makes the game easy to teach.",
                    "Viele lokale Runden werden mit kleinen Teams gespielt. Das vereinfacht Wechsel und erleichtert die Vermittlung.",
                    "De nombreuses sessions locales se jouent en petites equipes, ce qui simplifie les rotations et facilite l'apprentissage.",
                    "Muchas sesiones locales se juegan con equipos pequenos, lo que simplifica las rotaciones y facilita la ensenanza."
                )
            ),
            QuickFact(
                value: "Flanders",
                title: language.text("Living roots", "Lebendige Wurzeln", "Racines vivantes", "Raices vivas"),
                detail: language.text(
                    "The game is closely tied to Flemish folk-sport culture and heritage spaces.",
                    "Das Spiel ist eng mit flämischer Volkssportkultur und Kulturerbeorten verbunden.",
                    "Le jeu est fortement lie a la culture des sports traditionnels flamands et aux lieux patrimoniaux.",
                    "El juego esta muy ligado a la cultura flamenca de deportes tradicionales y al patrimonio."
                )
            ),
            QuickFact(
                value: "Offline",
                title: language.text("Field ready", "Sofort einsetzbar", "Pret pour le terrain", "Listo para el campo"),
                detail: language.text(
                    "Guide content, practice mode, match tracking, and saved history all work directly on the device.",
                    "Leitfaden, Trainingsmodus, Matchverwaltung und gespeicherte Historie funktionieren direkt auf dem Gerat.",
                    "Le guide, le mode entrainement, le suivi de match et l'historique enregistre fonctionnent directement sur l'appareil.",
                    "La guia, el modo de practica, el seguimiento de partidos y el historial guardado funcionan directamente en el dispositivo."
                )
            )
        ]
    }

    static func guideCards(_ language: AppLanguage) -> [GuideCard] {
        [
            GuideCard(
                title: language.text("What you are aiming at", "Worauf du zielst", "Ce que vous visez", "A que apuntas"),
                detail: language.text(
                    "Players roll a curved bolle toward a fixed stake. The nearest finish matters more than raw speed.",
                    "Spieler rollen eine gekrummte Scheibe auf einen festen Pflock zu. Die Lage zahlt mehr als rohe Kraft.",
                    "Les joueurs lancent une bolle courbee vers un piquet fixe. La position finale compte plus que la force brute.",
                    "Los jugadores lanzan una bolle curva hacia una estaca fija. Importa mas quedar cerca que lanzar fuerte."
                ),
                tag: language.text("Mechanic", "Mechanik", "Mecanique", "Mecanica"),
                systemImage: "scope"
            ),
            GuideCard(
                title: language.text("How a club round feels", "Wie sich eine Clubrunde anfuhlt", "Le rythme d'une manche en club", "Como se siente una ronda de club"),
                detail: language.text(
                    "Teams alternate throws, clear space when needed, and read the lane like a precision sport.",
                    "Teams wechseln sich ab, offnen notfalls die Linie und lesen die Bahn wie einen Präzisionssport.",
                    "Les equipes alternent les lancers, ouvrent la ligne si besoin et lisent la piste comme un sport de precision.",
                    "Los equipos alternan tiros, despejan la linea cuando hace falta y leen la pista como un deporte de precision."
                ),
                tag: language.text("Flow", "Ablauf", "Flux", "Flujo"),
                systemImage: "arrow.triangle.branch"
            ),
            GuideCard(
                title: language.text("Why it works on mobile", "Warum es mobil funktioniert", "Pourquoi cela marche sur mobile", "Por que funciona en movil"),
                detail: language.text(
                    "The curved roll, the fixed stake, and the readable lane make the game easy to follow on a phone screen.",
                    "Die gebogene Rollbewegung, der feste Pflock und die gut lesbare Bahn machen das Spiel auf dem Handy leicht verstandlich.",
                    "Le roulement courbe, le piquet fixe et la piste lisible rendent le jeu facile a suivre sur ecran mobile.",
                    "El rodado curvo, la estaca fija y la pista legible hacen que el juego se siga facilmente en una pantalla movil."
                ),
                tag: language.text("Screen fit", "Bildschirm", "Ecran", "Pantalla"),
                systemImage: "iphone"
            ),
            GuideCard(
                title: language.text("What to explain first", "Was zuerst erklart werden sollte", "Ce qu'il faut expliquer d'abord", "Que explicar primero"),
                detail: language.text(
                    "For a first session, explain the surface, the curl, the target stake, the nearest bolle, and any local scoring adjustment.",
                    "Fur die erste Runde reichen Untergrund, Drall, Zielpflock, nachste Scheibe und eventuelle lokale Wertungsanpassungen.",
                    "Pour une premiere session, il suffit d'expliquer la surface, la courbe, le piquet cible, la bolle la plus proche et les ajustements locaux de score.",
                    "Para una primera sesion basta con explicar la superficie, la curva, la estaca objetivo, la bolle mas cercana y cualquier ajuste local de puntuacion."
                ),
                tag: language.text("Onboarding", "Onboarding", "Onboarding", "Inicio"),
                systemImage: "text.book.closed"
            )
        ]
    }

    static func rules(_ language: AppLanguage) -> [RuleCard] {
        [
            RuleCard(title: language.text("Curve is the skill", "Die Kurve ist die Kunst", "La courbe est la cle", "La curva es la habilidad"), detail: language.text("The bolle is asymmetrical, so players learn to use the curl rather than fight it.", "Die Scheibe ist asymmetrisch, daher nutzt man den Drall statt dagegen zu arbeiten.", "La bolle est asymetrique, donc on utilise la courbe au lieu de la combattre.", "La bolle es asimetrica, asi que se usa la curva en lugar de pelear contra ella."), systemImage: "point.topleft.down.curvedto.point.bottomright.up"),
            RuleCard(title: language.text("Read the lane", "Die Bahn lesen", "Lire la piste", "Leer la pista"), detail: language.text("Packed sand or clay changes pace. A good player adjusts release and weight to the surface.", "Verdichteter Sand oder Lehm verandert das Tempo. Gute Spieler passen Abgabe und Gewicht an.", "Le sable tasse ou l'argile changent la vitesse. Un bon joueur adapte son geste a la surface.", "La arena compacta o la arcilla cambian el ritmo. Un buen jugador adapta salida y fuerza."), systemImage: "mountain.2"),
            RuleCard(title: language.text("Nearest decides pressure", "Die Nahe erzeugt Druck", "La proximite met la pression", "La cercania crea presion"), detail: language.text("A common casual format compares whose bolle finishes closest to the stake after the sequence ends.", "In vielen lockeren Formaten zahlt, wessen Scheibe nach der Folge am nachsten am Pflock liegt.", "Dans un format courant, on compare la bolle la plus proche du piquet a la fin de la sequence.", "En un formato comun, cuenta que bolle termina mas cerca de la estaca al final de la secuencia."), systemImage: "flag.pattern.checkered"),
            RuleCard(title: language.text("Shooting has purpose", "Schiessen hat einen Zweck", "Le tir a un role", "El tiro tiene sentido"), detail: language.text("When an opponent sits close to the stake, the next throw can be used to move pieces and reopen the lane.", "Liegt ein Gegner nahe am Pflock, kann der nachste Wurf genutzt werden, um die Bahn neu zu offnen.", "Quand un adversaire est proche du piquet, le lancer suivant peut rouvrir la ligne.", "Cuando un rival queda muy cerca de la estaca, el siguiente tiro puede reabrir la linea."), systemImage: "target"),
            RuleCard(title: language.text("Local clubs can vary", "Lokale Clubs haben Varianten", "Les clubs locaux varient", "Los clubes locales varian"), detail: language.text("Point values, team size, and throw order may differ. The app gives a clean starting format, not a universal law.", "Punkte, Teamgrosse und Wurfreihenfolge konnen variieren. Die App bietet einen klaren Start, kein starres Gesetz.", "Le comptage, la taille des equipes et l'ordre des lancers peuvent varier. L'app propose un point de depart clair.", "La puntuacion, el tamano del equipo y el orden de tiro pueden variar. La app ofrece un formato inicial claro."), systemImage: "person.3.sequence"),
            RuleCard(title: language.text("Precision beats force", "Praezision schlagt Kraft", "La precision prime", "La precision supera la fuerza"), detail: language.text("A smooth, committed release usually scores better than a hard throw with no lane reading.", "Ein ruhiger, klarer Wurf punktet oft besser als rohe Kraft ohne Bahngefuhl.", "Un lancer propre et engage rapporte souvent plus qu'un tir brutal sans lecture de piste.", "Un lanzamiento limpio y decidido suele rendir mejor que un tiro fuerte sin lectura de pista."), systemImage: "dial.low")
        ]
    }

    static func drills(_ language: AppLanguage) -> [Drill] {
        [
            Drill(title: language.text("Line and release", "Linie und Abgabe", "Ligne et sortie", "Linea y salida"), duration: "8 min", focus: language.text("Clean hand path", "Saubere Handbahn", "Geste propre", "Trayectoria limpia"), steps: [language.text("Mark a release line.", "Markiere eine Abgabelinie.", "Marquez une ligne de lancer.", "Marca una linea de salida."), language.text("Roll six soft throws with the same stance.", "Rolle sechs weiche Wurfe aus derselben Stellung.", "Lancez six boules souples depuis la meme position.", "Haz seis lanzamientos suaves desde la misma postura."), language.text("Track which ones keep the cleanest curl.", "Notiere, welche die sauberste Kurve halten.", "Reperez lesquelles gardent la meilleure courbe.", "Observa cuales mantienen la curva mas limpia.")], color: BrandPalette.gold),
            Drill(title: language.text("Stake window", "Fenster am Pflock", "Fenetre du piquet", "Ventana de estaca"), duration: "10 min", focus: language.text("Distance control", "Distanzen", "Controle de distance", "Control de distancia"), steps: [language.text("Create a scoring ring around the stake.", "Lege einen Punktering um den Pflock fest.", "Creez une zone de score autour du piquet.", "Crea un anillo de puntuacion alrededor de la estaca."), language.text("Throw in pairs.", "Werft paarweise.", "Jouez par paires.", "Lancen por parejas."), language.text("Count only finishes that settle without a bounce.", "Zahlt nur Wurfe, die ruhig ausrollen.", "Comptez seulement les fins de trajectoire stables.", "Cuenta solo las bolas que se asientan sin rebote.")], color: BrandPalette.sand),
            Drill(title: language.text("Open the lane", "Bahn offnen", "Ouvrir la ligne", "Abrir la linea"), duration: "12 min", focus: language.text("Tactical shooting", "Taktischer Schuss", "Tir tactique", "Tiro tactico"), steps: [language.text("Place one blocker near the stake.", "Lege einen Blocker nahe an den Pflock.", "Placez un bloqueur pres du piquet.", "Coloca un bloqueo cerca de la estaca."), language.text("Aim to move it without losing your own line.", "Versuche ihn zu bewegen ohne die eigene Linie zu verlieren.", "Essayez de le deplacer sans perdre votre ligne.", "Intenta moverlo sin perder tu propia linea."), language.text("Talk through the choice after each throw.", "Besprecht die Entscheidung nach jedem Wurf.", "Expliquez le choix apres chaque lancer.", "Comenten la decision despues de cada tiro.")], color: BrandPalette.blush),
            Drill(title: language.text("Mini club set", "Mini-Clubsatz", "Mini manche club", "Mini serie de club"), duration: "14 min", focus: language.text("Match rhythm", "Matchrhythmus", "Rythme de match", "Ritmo de partido"), steps: [language.text("Play first to five.", "Spielt bis funf.", "Jouez jusqu'a cinq.", "Jueguen a cinco."), language.text("Swap roles every end.", "Wechselt die Rollen nach jedem End.", "Changez les roles a chaque end.", "Cambien roles en cada end."), language.text("Assign one person to explain every local rule out loud.", "Eine Person erklart jede lokale Regel laut.", "Une personne explique chaque regle locale a voix haute.", "Una persona explica cada regla local en voz alta.")], color: BrandPalette.white.opacity(0.82))
        ]
    }

    static func gear(_ language: AppLanguage) -> [GearItem] {
        [
            GearItem(title: language.text("Krulbol set", "Krulbol-Set", "Jeu de krulbol", "Set de krulbol"), detail: language.text("A proper curved bolle is central to the game. Shape and weight matter more than decoration.", "Ein echter Krulbol ist zentral fur das Spiel. Form und Gewicht sind wichtiger als Dekor.", "Une vraie bolle courbee est au coeur du jeu. La forme et le poids comptent plus que le decor.", "Una bolle curva autentica es central para el juego. La forma y el peso importan mas que la decoracion."), systemImage: "circle.hexagongrid.circle"),
            GearItem(title: language.text("Stake and measure", "Pflock und Messung", "Piquet et mesure", "Estaca y medida"), detail: language.text("A visible stake and a simple measuring method keep demos calm and disputes short.", "Ein sichtbarer Pflock und eine einfache Messung halten Vorfuhrungen klar und Diskussionen kurz.", "Un piquet visible et une mesure simple gardent la demonstration claire et sereine.", "Una estaca visible y una medicion simple mantienen la demo clara y sin discusiones."), systemImage: "ruler"),
            GearItem(title: language.text("Prepared lane", "Vorbereitete Bahn", "Piste preparee", "Pista preparada"), detail: language.text("Hard-packed sand or a maintained folk-sport lane gives predictable behavior and better teaching conditions.", "Verdichteter Sand oder eine gepflegte Bahn sorgen fur berechenbares Verhalten und bessere Lernbedingungen.", "Un sable tasse ou une piste entretenue offrent un comportement plus previsible et un meilleur apprentissage.", "Arena compacta o una pista bien mantenida ofrecen un comportamiento mas predecible y mejor ensenanza."), systemImage: "square.grid.3x3.bottommiddle.filled"),
            GearItem(title: language.text("Club notes", "Clubhinweise", "Notes de club", "Notas de club"), detail: language.text("A small rule card for team size, scoring, and throw order helps new players join without hesitation.", "Eine kleine Regelkarte fur Teamgrosse, Punkte und Reihenfolge hilft Einsteigern sofort mitzumachen.", "Une petite carte de regles aide les nouveaux joueurs a entrer sans hesitation.", "Una pequena tarjeta con reglas ayuda a que los nuevos entren sin dudar."), systemImage: "note.text")
        ]
    }

    static func etiquette(_ language: AppLanguage) -> [EtiquetteTip] {
        [
            EtiquetteTip(title: language.text("Call the local format first", "Lokales Format zuerst nennen", "Annoncer le format local d'abord", "Anunciar primero el formato local"), detail: language.text("Before the first throw, agree on scoring, team size, and whether the session is training or competitive.", "Vor dem ersten Wurf sollten Punkte, Teamgrosse und Charakter der Runde feststehen.", "Avant le premier lancer, fixez le score, la taille des equipes et le type de session.", "Antes del primer tiro acuerden puntuacion, tamano de equipos y si la sesion es de practica o competitiva.")),
            EtiquetteTip(title: language.text("Respect the reading line", "Die Leselinie respektieren", "Respecter la ligne de lecture", "Respetar la linea de lectura"), detail: language.text("Players often watch the curve closely. Leave a clear view and avoid stepping onto the lane too early.", "Spieler verfolgen die Kurve genau. Freie Sicht und kein zu fruhes Betreten der Bahn.", "Les joueurs lisent attentivement la courbe. Gardez la vue libre et n'entrez pas trop tot sur la piste.", "Los jugadores leen la curva de cerca. Deja la vista libre y no pises la pista demasiado pronto.")),
            EtiquetteTip(title: language.text("Explain the throw, not just the result", "Den Wurf erklaren, nicht nur das Resultat", "Expliquer le geste, pas seulement le resultat", "Explicar el tiro, no solo el resultado"), detail: language.text("For new players, coaching the line and pace is more useful than simply announcing who is closer.", "Fur Einsteiger ist eine Erklarung von Linie und Tempo wertvoller als nur das Ergebnis.", "Pour les debutants, expliquer la ligne et la vitesse est plus utile que dire qui est le plus proche.", "Para quienes empiezan, explicar linea y ritmo ayuda mas que solo decir quien quedo mas cerca.")),
            EtiquetteTip(title: language.text("Keep it social", "Sozial bleiben", "Rester convivial", "Mantenerlo social"), detail: language.text("Krulbollen sits inside folk-sport culture. A good session feels precise, friendly, and communal.", "Krulbollen ist Teil der Volkssportkultur. Gute Runden sind prazise, freundlich und gemeinschaftlich.", "Le krulbollen appartient a une culture sportive populaire. Une bonne session reste precise et conviviale.", "El krulbollen forma parte de una cultura deportiva popular. Una buena sesion se siente precisa, amable y comunitaria."))
        ]
    }

    static func cultureNotes(_ language: AppLanguage) -> [CultureNote] {
        [
            CultureNote(title: language.text("The equipment explains the game", "Das Spielgerat erklart das Spiel", "Le materiel explique le jeu", "El material explica el juego"), detail: language.text("The curved bolle is not decorative. Its asymmetrical shape creates the rolling arc that players learn to read and use.", "Der gekrummte Krulbol ist keine Dekoration. Seine asymmetrische Form erzeugt die Rollkurve, die Spieler lesen und nutzen lernen.", "La bolle courbee n'est pas decorative. Sa forme asymetrique cree la trajectoire que les joueurs apprennent a lire et a exploiter.", "La bolle curva no es decorativa. Su forma asimetrica crea la trayectoria que los jugadores aprenden a leer y aprovechar."), tag: language.text("Equipment", "Spielgerat", "Materiel", "Material")),
            CultureNote(title: language.text("A social game with tactical depth", "Ein soziales Spiel mit taktischer Tiefe", "Un jeu social avec une vraie tactique", "Un juego social con profundidad tactica"), detail: language.text("Krulbollen is easy to watch, but strong sessions reveal decisions about weight, line, blocking, and timing.", "Krulbollen ist leicht zu verfolgen, doch gute Runden zeigen Entscheidungen zu Gewicht, Linie, Blocken und Timing.", "Le krulbollen est facile a regarder, mais les bonnes parties montrent de vraies decisions sur la vitesse, la ligne, le blocage et le timing.", "Krulbollen es facil de seguir, pero las buenas partidas muestran decisiones reales sobre ritmo, linea, bloqueos y timing."), tag: language.text("Game feel", "Spielcharakter", "Esprit du jeu", "Caracter del juego")),
            CultureNote(title: language.text("Clubs keep the tradition active", "Clubs halten die Tradition lebendig", "Les clubs font vivre la tradition", "Los clubes mantienen viva la tradicion"), detail: language.text("The game remains visible because clubs continue to host sessions, maintain lanes, and pass local knowledge to new players.", "Das Spiel bleibt sichtbar, weil Clubs weiter Runden organisieren, Bahnen pflegen und lokales Wissen an neue Spieler weitergeben.", "Le jeu reste visible parce que les clubs continuent d'organiser des sessions, d'entretenir les pistes et de transmettre les savoirs locaux.", "El juego sigue visible porque los clubes organizan sesiones, mantienen pistas y transmiten el conocimiento local a quienes empiezan."), tag: language.text("Club life", "Clubleben", "Vie des clubs", "Vida de club")),
            CultureNote(title: language.text("Public heritage spaces broaden access", "Offentliche Kulturorte erweitern den Zugang", "Les lieux patrimoniaux ouvrent l'acces", "Los espacios patrimoniales amplian el acceso"), detail: language.text("Museums, tourism programs, and heritage demonstrations help new audiences encounter the game outside regular club competition.", "Museen, Tourismusprogramme und Kulturvorfuhrungen machen das Spiel auch ausserhalb des regulären Clubwettbewerbs zuganglich.", "Les musees, programmes touristiques et demonstrations patrimoniales permettent de decouvrir le jeu en dehors de la competition reguliere.", "Museos, programas turisticos y demostraciones patrimoniales ayudan a que nuevas personas conozcan el juego fuera de la competicion habitual."), tag: language.text("Public access", "Offentlicher Zugang", "Acces public", "Acceso publico"))
        ]
    }

    static func history(_ language: AppLanguage) -> [HeritageStory] {
        [
            HeritageStory(period: language.text("Medieval throwing traditions", "Mittelalterliche Wurfspiele", "Traditions de lancer medievales", "Tradiciones medievales de lanzamiento"), title: language.text("Curved target games emerge", "Gebogene Zielspiele entstehen", "Naissance des jeux de cible courbe", "Surgen los juegos de curva y objetivo"), detail: language.text("Across Western Europe, throwing games took many local forms. Krulbollen developed a distinctive curved bolle and a stake-centered lane logic.", "In Westeuropa entstanden viele lokale Wurfspiele. Krulbollen entwickelte die markante gekrummte Scheibe und die Logik rund um den Pflock.", "En Europe occidentale, les jeux de lancer ont pris de nombreuses formes locales. Le krulbollen s'est distingue par sa bolle courbee et sa logique autour du piquet.", "En Europa occidental surgieron muchas variantes locales de juegos de lanzamiento. El krulbollen destaco por su bolle curva y su logica alrededor de la estaca."), systemImage: "clock.arrow.trianglehead.counterclockwise.rotate.90"),
            HeritageStory(period: language.text("Village sport in Flanders", "Dorfsport in Flandern", "Sport de village en Flandre", "Deporte de pueblo en Flandes"), title: language.text("A local social game", "Ein lokales Gesellschaftsspiel", "Un jeu social local", "Un juego social local"), detail: language.text("The sport became tied to village life, folk clubs, and informal competition in Flemish communities.", "Der Sport verband sich mit Dorfleben, Volkssportclubs und informellem Wettbewerb in flaemischen Gemeinden.", "Le sport s'est ancre dans la vie de village, les clubs populaires et la competition locale en Flandre.", "El deporte quedo ligado a la vida de pueblo, a los clubes populares y a la competicion informal en comunidades flamencas."), systemImage: "person.3.fill"),
            HeritageStory(period: language.text("20th century continuity", "Kontinuitat im 20. Jahrhundert", "Continuite au XXe siecle", "Continuidad en el siglo XX"), title: language.text("Clubs keep the game readable", "Clubs halten das Spiel lebendig", "Les clubs gardent le jeu vivant", "Los clubes mantienen vivo el juego"), detail: language.text("Even as global sports dominated attention, clubs and heritage organizations continued to teach and host the game.", "Obwohl globale Sportarten die Aufmerksamkeit dominierten, hielten Clubs und Erbe-Organisationen das Spiel am Leben.", "Alors que les sports mondiaux prenaient l'attention, les clubs et acteurs du patrimoine ont continue a transmettre le jeu.", "Aunque los deportes globales dominaron la atencion, clubes y organizaciones patrimoniales siguieron ensenando el juego."), systemImage: "figure.socialdance"),
            HeritageStory(period: language.text("Heritage recognition era", "Phase der Erbeanerkennung", "Ere de reconnaissance patrimoniale", "Era de reconocimiento patrimonial"), title: language.text("Safeguarding ludodiversity", "Ludodiversitat sichern", "Sauvegarder la ludodiversite", "Proteger la ludodiversidad"), detail: language.text("Flemish traditional games were documented and promoted through heritage initiatives so they could remain visible to new generations.", "Flaemische Traditionsspiele wurden durch Kulturerbe-Initiativen dokumentiert und vermittelt, damit sie fur neue Generationen sichtbar bleiben.", "Les jeux traditionnels flamands ont ete documentes et promus par des initiatives patrimoniales afin de rester visibles pour de nouvelles generations.", "Los juegos tradicionales flamencos fueron documentados y promovidos por iniciativas patrimoniales para seguir visibles para nuevas generaciones."), systemImage: "building.columns")
        ]
    }

    static func glossary(_ language: AppLanguage) -> [GlossaryTerm] {
        [
            GlossaryTerm(term: "Krulbol", meaning: language.text("The curved disc used in play. Its shape causes the rolling arc.", "Die gekrummte Scheibe im Spiel. Ihre Form erzeugt die Kurve.", "Le disque courbe utilise en jeu. Sa forme provoque la trajectoire.", "El disco curvo usado en el juego. Su forma genera la trayectoria.")),
            GlossaryTerm(term: language.text("Stake", "Pflock", "Piquet", "Estaca"), meaning: language.text("The fixed target in the lane that players aim to finish near.", "Das feste Ziel in der Bahn, an dem die Scheibe nah enden soll.", "La cible fixe sur la piste, pres de laquelle la bolle doit finir.", "El objetivo fijo en la pista junto al cual debe terminar la bolle.")),
            GlossaryTerm(term: language.text("Lane", "Bahn", "Piste", "Pista"), meaning: language.text("The prepared sand or clay playing surface where line and pace become readable.", "Die vorbereitete Sand- oder Lehmbahn, auf der Linie und Tempo lesbar werden.", "La surface preparee en sable ou en argile ou la ligne et la vitesse deviennent lisibles.", "La superficie preparada de arena o arcilla donde se leen linea y ritmo.")),
            GlossaryTerm(term: language.text("Curl", "Drall", "Courbe", "Curva"), meaning: language.text("The natural bend in the bolle's path. Managing it is the core skill.", "Die naturliche Biegung der Laufbahn. Sie zu steuern ist die Kernkompetenz.", "La courbe naturelle de la bolle. La maitriser est la competence centrale.", "La curvatura natural de la bolle. Controlarla es la habilidad central.")),
            GlossaryTerm(term: language.text("Shot", "Schuss", "Tir", "Tiro"), meaning: language.text("A more forceful tactical throw used to move blocking pieces or change the lane picture.", "Ein kraeftigerer taktischer Wurf, um Blocker zu bewegen oder das Bild der Bahn zu aendern.", "Un lancer tactique plus fort pour deplacer les bloqueurs et changer la situation.", "Un lanzamiento tactico mas fuerte para mover bloqueos y cambiar la situacion.")),
            GlossaryTerm(term: "End", meaning: language.text("One completed exchange of team throws before the result is counted.", "Eine abgeschlossene Wurffolge beider Teams, bevor das Ergebnis gezaehlt wird.", "Une sequence complete de lancers avant de compter le resultat.", "Una secuencia completa de lanzamientos antes de contar el resultado."))
        ]
    }

    static func regions(_ language: AppLanguage) -> [RegionSpot] {
        [
            RegionSpot(area: "East Flanders", vibe: language.text("Classic folk-sport territory", "Klassisches Volkssportgebiet", "Territoire classique des sports populaires", "Territorio clasico de deporte popular"), detail: language.text("This region remains one of the clearest anchors for traditional Flemish games and long-running club activity.", "Diese Region ist weiterhin einer der wichtigsten Bezugspunkte fur traditionelle flaemische Spiele und langjahrige Clubaktivitat.", "Cette region reste l'un des principaux ancrages des jeux traditionnels flamands et de l'activite de club sur la duree.", "Esta region sigue siendo uno de los principales anclajes de los juegos tradicionales flamencos y de la actividad de clubes a largo plazo."), tag: language.text("Roots", "Wurzeln", "Racines", "Raices")),
            RegionSpot(area: "Meetjesland", vibe: language.text("Rural lane culture", "Laendliche Bahnkultur", "Culture rurale de piste", "Cultura rural de pista"), detail: language.text("This area is closely associated with club lanes, village play, and the everyday social setting of the sport.", "Diese Region steht besonders fur Clubbahnen, Dorfrunden und den alltaglichen sozialen Rahmen des Spiels.", "Cette zone est fortement associee aux pistes de club, au jeu de village et au cadre social quotidien du sport.", "Esta zona se asocia con pistas de club, juego de pueblo y el entorno social cotidiano del deporte."), tag: language.text("Local play", "Lokales Spiel", "Jeu local", "Juego local")),
            RegionSpot(area: "West Flanders", vibe: language.text("Community competition", "Gemeinschaftlicher Wettbewerb", "Competition communautaire", "Competicion comunitaria"), detail: language.text("The game's social side and local club formats come through clearly in this region's folk-sport culture.", "Die soziale Seite und lokale Clubformate zeigen sich in dieser Region besonders deutlich.", "Le cote social du jeu et les formats de clubs locaux y apparaissent tres clairement.", "El lado social del juego y los formatos locales de club se ven claramente en esta region."), tag: language.text("Club life", "Clubleben", "Vie de club", "Vida de club")),
            RegionSpot(area: "Bokrijk, Genk", vibe: language.text("Public heritage showcase", "Offentliche Erbe-Buhne", "Vitrine patrimoniale publique", "Escaparate publico de patrimonio"), detail: language.text("A great model for how traditional games can be demonstrated to families and first-time players.", "Ein starkes Vorbild dafur, wie traditionelle Spiele Familien und Neulingen vermittelt werden konnen.", "Un excellent modele pour montrer les jeux traditionnels aux familles et aux debutants.", "Un gran modelo para mostrar juegos tradicionales a familias y principiantes."), tag: language.text("Public demo", "Offentliche Demo", "Demo publique", "Demo publica"))
        ]
    }

    static func quiz(_ language: AppLanguage) -> [QuizQuestion] {
        [
            QuizQuestion(prompt: language.text("What makes krulbollen feel different from standard bowls?", "Was macht Krulbollen anders als klassisches Bowls?", "Qu'est-ce qui rend le krulbollen different des boules classiques ?", "Que hace que el krulbollen se sienta distinto de las bochas clasicas?"), options: [language.text("A curved bolle changes the path", "Eine gekrummte Scheibe verandert die Linie", "Une bolle courbee change la trajectoire", "Una bolle curva cambia la trayectoria"), language.text("Players never aim at a target", "Man zielt nie auf ein Ziel", "On ne vise jamais une cible", "Los jugadores nunca apuntan a un objetivo"), language.text("The sport is played only indoors", "Der Sport wird nur drinnen gespielt", "Le sport se joue seulement en interieur", "El deporte solo se juega bajo techo")], correctIndex: 0, explanation: language.text("The equipment itself changes the trajectory, which is the signature of the sport.", "Schon das Spielgerat verandert die Linie, und genau das ist die Signatur des Sports.", "L'objet de jeu modifie lui-meme la trajectoire, c'est la signature du sport.", "El propio implemento modifica la trayectoria, y esa es la firma del deporte.")),
            QuizQuestion(prompt: language.text("What should a first-time demo explain first?", "Was sollte eine erste Demo zuerst erklaren?", "Que faut-il expliquer d'abord lors d'une premiere demo ?", "Que deberia explicar primero una demo inicial?"), options: [language.text("TV rights", "TV-Rechte", "Droits TV", "Derechos de TV"), language.text("Stake, lane, curl, and local scoring", "Pflock, Bahn, Drall und lokale Wertung", "Piquet, piste, courbe et comptage local", "Estaca, pista, curva y puntuacion local"), language.text("Uniform sponsorship", "Trikotsponsoring", "Sponsoring d'uniforme", "Patrocinio del uniforme")], correctIndex: 1, explanation: language.text("A good intro is simple: target, surface, curve, and how the local round is counted.", "Eine gute Einfuhrung bleibt einfach: Ziel, Untergrund, Kurve und lokale Zaehllogik.", "Une bonne introduction reste simple : cible, surface, courbe et facon de compter.", "Una buena introduccion es simple: objetivo, superficie, curva y forma local de contar.")),
            QuizQuestion(prompt: language.text("What makes krulbollen easy to demonstrate to new players?", "Was macht Krulbollen fur Neueinsteiger leicht vorfuhrbar?", "Qu'est-ce qui rend le krulbollen facile a montrer a de nouveaux joueurs ?", "Que hace que el krulbollen sea facil de mostrar a quienes empiezan?"), options: [language.text("The target and curved line are easy to see", "Ziel und Kurve sind gut sichtbar", "La cible et la courbe sont faciles a voir", "La meta y la curva se ven con claridad"), language.text("It requires no equipment at all", "Es braucht uberhaupt kein Material", "Il ne demande aucun materiel", "No requiere ningun material"), language.text("It can only be understood by club members", "Es ist nur fur Clubmitglieder verstandlich", "Il n'est comprenable que par les membres du club", "Solo lo entienden miembros del club")], correctIndex: 0, explanation: language.text("The fixed stake and the visible curve help spectators and new players understand the objective quickly.", "Der feste Pflock und die sichtbare Kurve helfen Zuschauern und Einsteigern, das Ziel schnell zu verstehen.", "Le piquet fixe et la courbe visible permettent au public et aux debutants de comprendre vite l'objectif.", "La estaca fija y la curva visible ayudan a que el publico y quienes empiezan entiendan rapido el objetivo.")),
            QuizQuestion(prompt: language.text("What usually matters more than pure force?", "Was zahlt meist mehr als rohe Kraft?", "Qu'est-ce qui compte plus que la force brute ?", "Que suele importar mas que la fuerza bruta?"), options: [language.text("Precision and lane reading", "Praezision und Bahngefuhl", "Precision et lecture de piste", "Precision y lectura de pista"), language.text("Shouting louder", "Lauter rufen", "Crier plus fort", "Gritar mas fuerte"), language.text("Throwing as flat as possible", "Moglichst flach werfen", "Lancer le plus plat possible", "Lanzar lo mas plano posible")], correctIndex: 0, explanation: language.text("Players gain control by reading the surface and releasing with intent.", "Spieler gewinnen Kontrolle durch das Lesen der Oberflache und einen klaren Wurf.", "Les joueurs gagnent en controle en lisant la surface et en lancant avec intention.", "Los jugadores ganan control leyendo la superficie y soltando con intencion.")),
            QuizQuestion(prompt: language.text("Why include heritage content in the app?", "Warum gibt es Kultur- und Hintergrundinhalte in der App?", "Pourquoi integrer du contenu patrimonial dans l'app ?", "Por que incluir contenido patrimonial en la app?"), options: [language.text("To make the game harder", "Um das Spiel schwerer zu machen", "Pour rendre le jeu plus difficile", "Para hacer el juego mas dificil"), language.text("To explain the clubs, regions, and continuity behind the sport", "Um Clubs, Regionen und die Kontinuitat hinter dem Sport zu erklaren", "Pour expliquer les clubs, les regions et la continuite du sport", "Para explicar los clubes, las regiones y la continuidad del deporte"), language.text("To replace gameplay", "Um das Gameplay zu ersetzen", "Pour remplacer le jeu", "Para reemplazar la jugabilidad")], correctIndex: 1, explanation: language.text("The heritage layer gives the game context and helps hosts explain why it still matters today.", "Die Hintergrundebene gibt dem Spiel Kontext und hilft dabei zu erklaren, warum es heute noch wichtig ist.", "La couche patrimoniale donne du contexte au jeu et aide a expliquer pourquoi il compte encore aujourd'hui.", "La capa patrimonial da contexto al juego y ayuda a explicar por que sigue importando hoy.")),
            QuizQuestion(prompt: language.text("What kind of experience should a club session create?", "Welche Art Erlebnis sollte eine Clubsession schaffen?", "Quel type d'experience une session de club doit-elle creer ?", "Que tipo de experiencia debe crear una sesion de club?"), options: [language.text("Precise, social, and teachable", "Praezise, sozial und vermittelbar", "Precise, sociale et transmissible", "Precisa, social y facil de ensenar"), language.text("Pure chaos", "Reines Chaos", "Le chaos total", "Caos puro"), language.text("Only spectator entertainment", "Nur Zuschauershow", "Seulement du spectacle", "Solo entretenimiento para espectadores")], correctIndex: 0, explanation: language.text("Krulbollen works best when the social and tactical sides are both visible.", "Krulbollen funktioniert am besten, wenn soziale und taktische Seite zugleich sichtbar sind.", "Le krulbollen fonctionne le mieux quand le cote social et le cote tactique sont visibles.", "El krulbollen funciona mejor cuando se ven tanto lo social como lo tactico."))
        ]
    }

    static func federationSchedule(_ language: AppLanguage) -> [FederationSchedule] {
        [
            FederationSchedule(
                title: language.text("Summer trophy cycle", "Sommer-Trophaenzyklus", "Cyclee estival", "Ciclo de verano"),
                detail: language.text(
                    "The Belgian federation describes a summer season with 12 ranking events and additional club competitions on many weekdays and weekends.",
                    "Der belgische Verband beschreibt eine Sommersaison mit 12 Wertungsereignissen sowie vielen Clubwettbewerben an Wochen- und Werktagen.",
                    "La federation belge decrit une saison d'ete avec 12 epreuves de classement et de nombreuses competitions de club.",
                    "La federacion belga describe una temporada de verano con 12 pruebas de clasificacion y muchas competiciones de club."
                ),
                emphasis: language.text("Best fit for clubs with outdoor lanes", "Ideal fur Clubs mit Aussenbahnen", "Ideal pour les clubs avec pistes exterieures", "Ideal para clubes con pistas exteriores")
            ),
            FederationSchedule(
                title: language.text("Winter trophy cycle", "Winter-Trophaenzyklus", "Cyclee hivernal", "Ciclo de invierno"),
                detail: language.text(
                    "The federation also runs a winter cycle, plus weekday rankings and a superprestige format hosted at different venues.",
                    "Der Verband fuhrt zudem einen Winterzyklus, eine Wochentrophäe und ein Superprestige-Format an wechselnden Orten.",
                    "La federation organise aussi un cycle d'hiver, une semainee et un format superprestige sur plusieurs sites.",
                    "La federacion tambien organiza un ciclo de invierno, una semana de trofeos y un formato superprestigio en varias sedes."
                ),
                emphasis: language.text("Good fit for indoor or mixed clubs", "Passend fur Indoor- oder Mischclubs", "Adapte aux clubs indoor ou mixtes", "Adecuado para clubes indoor o mixtos")
            ),
            FederationSchedule(
                title: language.text("European Games window", "Zeitfenster Europaische Spiele", "Fenetre des Jeux europeens", "Ventana de Juegos Europeos"),
                detail: language.text(
                    "The Belgian federation states that the European Games activities are usually organized around the weekend of August 15.",
                    "Laut belgischem Verband finden die Europaischen Spiele in der Regel rund um das Wochenende des 15. August statt.",
                    "Selon la federation belge, les activites des Jeux europeens ont lieu autour du week-end du 15 aout.",
                    "Segun la federacion belga, las actividades de los Juegos Europeos suelen celebrarse alrededor del fin de semana del 15 de agosto."
                ),
                emphasis: language.text("Anchor point for heritage programming", "Anker fur Heritage-Programmierung", "Point d'ancrage patrimonial", "Punto clave para programacion patrimonial")
            )
        ]
    }

    static func clubs(_ language: AppLanguage) -> [ClubProfile] {
        [
            ClubProfile(
                id: "veense",
                name: "De Veense Bolders",
                founding: "2008",
                city: "Ertvelde",
                address: "Tervenen 38, 9940 Ertvelde",
                contact: "Marc Martens · +32 475 41 83 83 · marc.martens1@telenet.be",
                accommodation: language.text("8 outdoor lanes · summer-active club", "8 Aussenbahnen · nur im Sommer aktiv", "8 pistes exterieures · club actif en ete", "8 pistas exteriores · club activo en verano"),
                schedule: language.text("Public information points to a summer-oriented rhythm built around outdoor play and federation activity in the warmer months.", "Die offentlichen Angaben deuten auf einen sommerbetonten Rhythmus mit Aussenbahnen und Verbandsaktivitaten in den warmen Monaten hin.", "Les informations publiques indiquent un rythme estival centre sur le jeu exterieur et les activites federales pendant les mois chauds.", "La informacion publica apunta a un ritmo de verano centrado en juego exterior y actividad federativa durante los meses calidos."),
                history: language.text("This club profile is useful for understanding the seasonal outdoor side of krulbollen in East Flanders.", "Dieses Clubprofil hilft dabei, die saisonale Outdoor-Seite des Krulbollen in Ostflandern zu verstehen.", "Ce profil aide a comprendre le versant saisonnier et exterieur du krulbollen en Flandre orientale.", "Este perfil ayuda a entender el lado estacional y al aire libre del krulbollen en Flandes Oriental."),
                badgeTitle: "VB",
                sourceLabel: language.text("Federation listing", "Verbandsliste", "Liste federale", "Listado federativo")
            ),
            ClubProfile(
                id: "vijverhof",
                name: "'t Vijverhof",
                founding: "2000",
                city: "Waarschoot",
                address: "Stationsstraat 124, 9950 Waarschoot",
                contact: "Marijn Lippens · +32 9 377 92 76",
                accommodation: language.text("3 indoor lanes + 10 outdoor lanes · active in winter and summer", "3 Innenbahnen + 10 Aussenbahnen · im Winter und Sommer aktiv", "3 pistes interieures + 10 exterieures · actif en hiver et en ete", "3 pistas cubiertas + 10 exteriores · activo en invierno y verano"),
                schedule: language.text("Its facilities suggest a year-round rhythm, with indoor capacity for colder periods and outdoor lanes for the main summer season.", "Die Anlage spricht fur einen ganzjahrigen Rhythmus mit Innenbahnen fur kalte Phasen und Aussenbahnen fur die Sommersaison.", "Ses installations suggerent un rythme annuel avec des pistes interieures pour les periodes froides et des pistes exterieures pour la belle saison.", "Sus instalaciones sugieren un ritmo anual con pistas cubiertas en periodos frios y pistas exteriores para la temporada principal de verano."),
                history: language.text("The mixed indoor and outdoor setup makes this club a good example of how some venues support play across more than one season.", "Die Kombination aus Innen- und Aussenbahnen macht diesen Club zu einem guten Beispiel fur ganzjahrige Spielmoglichkeiten.", "La combinaison interieur-exterieur en fait un bon exemple de club capable d'accueillir le jeu sur plus d'une saison.", "La combinacion de interior y exterior lo convierte en un buen ejemplo de club capaz de sostener el juego durante mas de una temporada."),
                badgeTitle: "VH",
                sourceLabel: language.text("Federation listing", "Verbandsliste", "Liste federale", "Listado federativo")
            ),
            ClubProfile(
                id: "staakbolders",
                name: "De Staakbolders vzw",
                founding: "1961",
                city: "Kluizen",
                address: "Pastoorshoek 5, 9940 Kluizen",
                contact: "Antoon Claeys · +32 9 344 97 91 · ancla@telenet.be",
                accommodation: language.text("1 indoor lane + 10 outdoor lanes · active in winter and summer", "1 Innenbahn + 10 Aussenbahnen · Winter und Sommer aktiv", "1 piste interieure + 10 exterieures · actif en hiver et en ete", "1 pista cubierta + 10 exteriores · activo en invierno y verano"),
                schedule: language.text("The combination of indoor and outdoor lanes supports activity across both the winter and summer competition windows.", "Die Kombination aus Innen- und Aussenbahnen erlaubt Spielbetrieb in Winter- und Sommerfenstern.", "La combinaison de pistes interieures et exterieures permet une activite sur les fenetres d'hiver et d'ete.", "La combinacion de pistas cubiertas y exteriores permite actividad en ventanas de invierno y verano."),
                history: language.text("Founded in 1961, this club stands out for continuity, mixed infrastructure, and a strong place in the historical club landscape.", "Gegrundet 1961, steht dieser Club fur Kontinuitat, gemischte Infrastruktur und einen festen Platz in der Vereinsgeschichte.", "Fonde en 1961, ce club se distingue par sa continuite, ses installations mixtes et sa place solide dans le paysage historique.", "Fundado en 1961, este club destaca por su continuidad, su infraestructura mixta y su lugar firme en el panorama historico."),
                badgeTitle: "SB",
                sourceLabel: language.text("Federation listing", "Verbandsliste", "Liste federale", "Listado federativo")
            ),
            ClubProfile(
                id: "amandus",
                name: "St Amandusbolders",
                founding: language.text("Historic local club", "Historischer Ortsclub", "Club local historique", "Club local historico"),
                city: "Oostakker",
                address: "Gasthuisstraat 2A, 9040 Oostakker",
                contact: "Geert Praet · +32 499 336 689 · g.praet@telenet.be",
                accommodation: language.text("Official contact and location available via federation listing", "Kontakt und Standort sind uber den Verband gelistet", "Contact et localisation disponibles via la federation", "Contacto y ubicacion disponibles en la federacion"),
                schedule: language.text("Publicly available details are limited, so the federation listing is the main reference point for contact and location.", "Die offentlich verfugbaren Details sind begrenzt; deshalb ist der Verbandseintrag die wichtigste Quelle fur Kontakt und Standort.", "Les details publics sont limites; la fiche federale reste donc la principale reference pour le contact et la localisation.", "Los detalles publicos son limitados; por eso la ficha federativa es la referencia principal para contacto y ubicacion."),
                history: language.text("Even with lighter published detail, the club shows that krulbollen still relies on active local anchors around the Ghent area.", "Auch mit knapperen Angaben zeigt der Club, dass Krulbollen weiterhin auf aktive lokale Anker rund um Gent baut.", "Meme avec peu d'informations publiees, le club montre que le krulbollen s'appuie encore sur des points d'ancrage locaux autour de Gand.", "Aunque haya menos informacion publicada, el club muestra que el krulbollen sigue apoyandose en anclajes locales activos alrededor de Gante."),
                badgeTitle: "SA",
                sourceLabel: language.text("Federation listing", "Verbandsliste", "Liste federale", "Listado federativo")
            ),
            ClubProfile(
                id: "achel",
                name: "Krulbol Achel",
                founding: language.text("Recognized in tourism listing", "Touristisch gelistet", "Reference touristique", "Referencia turistica"),
                city: "Hamont-Achel",
                address: "Catharinadal z/n, 3930 Hamont-Achel",
                contact: "krulbolachel@gmail.com",
                accommodation: language.text("Group demos, play sessions, and a weather-protected setup for up to 16 players under tent coverage", "Gruppendemos, Spielrunden und ein wettergeschutztes Setup fur bis zu 16 Spieler unter Zelt", "Demos de groupe, parties et installation protegee sous tente pour jusqu'a 16 joueurs", "Demos de grupo, partidas e instalacion protegida bajo carpa para hasta 16 jugadores"),
                schedule: language.text("The tourism listing describes sessions by request, usually in guided group formats lasting around two to three hours.", "Die Tourismusseite beschreibt Termine auf Anfrage, meist als begleitete Gruppenformate von etwa zwei bis drei Stunden.", "La fiche touristique presente des sessions sur demande, generalement en groupe accompagne, d'une duree d'environ deux a trois heures.", "La ficha turistica presenta sesiones bajo solicitud, normalmente en formato guiado para grupos de unas dos a tres horas."),
                history: language.text("This profile shows how krulbollen also appears in heritage tourism and introductory group sessions beyond regular club competition.", "Dieses Profil zeigt, wie Krulbollen auch im Kulturtourismus und in Gruppen-Einfuhrungen ausserhalb des regulären Ligabetriebs sichtbar wird.", "Ce profil montre comment le krulbollen apparait aussi dans le tourisme patrimonial et dans les initiations de groupe en dehors de la competition reguliere.", "Este perfil muestra como el krulbollen tambien aparece en turismo patrimonial y en sesiones introductorias de grupo fuera de la competicion regular."),
                badgeTitle: "KA",
                sourceLabel: language.text("Tourism listing", "Tourismusliste", "Liste tourisme", "Listado turistico")
            )
        ]
    }

    static func levels(_ language: AppLanguage) -> [GameLevel] {
        [
            GameLevel(id: 1, title: language.text("Lane 1", "Bahn 1", "Piste 1", "Pista 1"), subtitle: language.text("Learn the curve", "Kurve lernen", "Apprendre la courbe", "Aprender la curva"), shots: 5, targetScore: 70, curveBias: 0.20, powerTightness: 1.0, obstacleMode: .none),
            GameLevel(id: 2, title: language.text("Lane 2", "Bahn 2", "Piste 2", "Pista 2"), subtitle: language.text("Closer settle", "Nahes Finish", "Se poser plus pres", "Asentarse mas cerca"), shots: 5, targetScore: 90, curveBias: 0.26, powerTightness: 0.9, obstacleMode: .none),
            GameLevel(id: 3, title: language.text("Lane 3", "Bahn 3", "Piste 3", "Pista 3"), subtitle: language.text("Beat the blocker", "Den Blocker schlagen", "Battre le bloqueur", "Superar el bloqueo"), shots: 5, targetScore: 95, curveBias: 0.30, powerTightness: 0.85, obstacleMode: .blocker),
            GameLevel(id: 4, title: language.text("Lane 4", "Bahn 4", "Piste 4", "Pista 4"), subtitle: language.text("Narrow gate", "Enges Tor", "Porte etroite", "Puerta estrecha"), shots: 4, targetScore: 100, curveBias: 0.34, powerTightness: 0.8, obstacleMode: .narrowGate),
            GameLevel(id: 5, title: language.text("Lane 5", "Bahn 5", "Piste 5", "Pista 5"), subtitle: language.text("Pressure finish", "Druck-Finish", "Finale sous pression", "Final bajo presion"), shots: 4, targetScore: 110, curveBias: 0.38, powerTightness: 0.75, obstacleMode: .doublePressure),
            GameLevel(id: 6, title: language.text("Lane 6", "Bahn 6", "Piste 6", "Pista 6"), subtitle: language.text("Club master", "Club-Master", "Maitre du club", "Maestro del club"), shots: 4, targetScore: 120, curveBias: 0.42, powerTightness: 0.72, obstacleMode: .doublePressure)
        ]
    }
}

@MainActor
final class MatchStore: ObservableObject {
    @Published var score: ScoreState {
        didSet { saveScore() }
    }

    @Published var logs: [MatchLog] {
        didSet { saveLogs() }
    }

    private let scoreKey = "bclic.krul.score"
    private let logsKey = "bclic.krul.logs"

    init() {
        if let data = UserDefaults.standard.data(forKey: scoreKey),
           let decoded = try? JSONDecoder().decode(ScoreState.self, from: data) {
            score = decoded
        } else {
            score = ScoreState()
        }

        if let data = UserDefaults.standard.data(forKey: logsKey),
           let decoded = try? JSONDecoder().decode([MatchLog].self, from: data) {
            logs = decoded
        } else {
            logs = []
        }
    }

    func addPoint(toHome: Bool) {
        if toHome {
            score.homeScore += 1
        } else {
            score.awayScore += 1
        }
        score.ends += 1
        score.servingHome = toHome
        score.pointHistory.append(toHome)
    }

    func toggleLead() {
        score.servingHome.toggle()
    }

    func undoPoint() {
        guard score.ends > 0 else { return }

        if let lastPointWasHome = score.pointHistory.popLast() {
            if lastPointWasHome {
                score.homeScore = max(0, score.homeScore - 1)
            } else {
                score.awayScore = max(0, score.awayScore - 1)
            }
            score.servingHome = score.pointHistory.last ?? true
        }

        score.ends = max(0, score.ends - 1)
    }

    func saveMatch() {
        let log = MatchLog(
            id: UUID(),
            date: Date(),
            homeName: cleanName(score.homeName, fallback: "Side A"),
            awayName: cleanName(score.awayName, fallback: "Side B"),
            homeScore: score.homeScore,
            awayScore: score.awayScore,
            targetScore: score.targetScore
        )

        logs.insert(log, at: 0)
        if logs.count > 12 {
            logs = Array(logs.prefix(12))
        }
        resetCurrentMatch()
    }

    func resetCurrentMatch() {
        score.homeScore = 0
        score.awayScore = 0
        score.ends = 0
        score.servingHome = true
        score.pointHistory = []
    }

    func clearHistory() {
        logs = []
    }

    private func saveScore() {
        guard let data = try? JSONEncoder().encode(score) else { return }
        UserDefaults.standard.set(data, forKey: scoreKey)
    }

    private func saveLogs() {
        guard let data = try? JSONEncoder().encode(logs) else { return }
        UserDefaults.standard.set(data, forKey: logsKey)
    }

    private func cleanName(_ value: String, fallback: String) -> String {
        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? fallback : trimmed
    }
}
