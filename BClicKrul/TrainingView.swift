import SwiftUI

struct TrainingView: View {
    @State private var completed: Set<String> = []
    @AppStorage("bclic.krul.language") private var languageRawValue = AppLanguage.english.rawValue

    private var language: AppLanguage {
        AppLanguage.from(languageRawValue)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    BrandHeader(
                        eyebrow: language.text("Club directory", "Clubverzeichnis", "Repertoire des clubs", "Directorio de clubes"),
                        title: language.text("Find active clubs, season rhythms, and practical contact details.", "Aktive Clubs, Saisonrhythmen und praktische Kontaktdaten finden.", "Retrouver les clubs actifs, le rythme des saisons et les contacts utiles.", "Encontrar clubes activos, ritmos de temporada y datos de contacto utiles."),
                        subtitle: language.text("Club listings combine public federation information with venue and visit details where available, so the app stays useful for planning, contact, and orientation.", "Die Clubeintrage verbinden offentliche Verbandsdaten mit verfugbaren Orts- und Besuchsinformationen, damit die App fur Planung, Kontakt und Orientierung nutzlich bleibt.", "Les fiches de clubs combinent les informations federales publiques avec les details de lieu et de visite disponibles afin de rester utiles pour planifier, contacter et s'orienter.", "Las fichas de clubes combinan informacion publica de la federacion con datos de sede y visita cuando existen, para que la app sea util al planificar, contactar y orientarse.")
                    )

                    federationCard

                    SectionTitle(
                        title: language.text("Featured clubs", "Ausgewahlte Clubs", "Clubs mis en avant", "Clubes destacados"),
                        detail: language.text("Each profile focuses on location, facilities, playing rhythm, and the role the club plays in the broader krulbollen scene.", "Jedes Profil konzentriert sich auf Standort, Anlage, Spielrhythmus und die Rolle des Clubs innerhalb der Krulbollen-Landschaft.", "Chaque profil met l'accent sur le lieu, les installations, le rythme de jeu et la place du club dans l'ensemble du krulbollen.", "Cada perfil se centra en la ubicacion, las instalaciones, el ritmo de juego y el papel del club dentro del entorno del krulbollen.")
                    )

                    VStack(spacing: 12) {
                        ForEach(AppData.clubs(language)) { club in
                            clubCard(club)
                        }
                    }

                    SectionTitle(
                        title: language.text("Session toolkit", "Session-Toolkit", "Boite a outils de session", "Kit de sesion"),
                        detail: language.text("Use these checklists for introductions, club evenings, school visits, and public demonstrations.", "Diese Checklisten helfen bei Einfuhrungen, Clubabenden, Schulbesuchen und offentlichen Vorfuhrungen.", "Ces listes servent pour les initiations, les soirees de club, les visites scolaires et les demonstrations publiques.", "Estas listas sirven para introducciones, noches de club, visitas escolares y demostraciones publicas.")
                    )

                    progressCard

                    VStack(spacing: 12) {
                        ForEach(AppData.drills(language)) { drill in
                            drillCard(drill)
                        }
                    }

                    VStack(spacing: 12) {
                        ForEach(AppData.gear(language)) { item in
                            gearCard(item)
                        }
                    }

                    VStack(spacing: 12) {
                        ForEach(AppData.etiquette(language)) { tip in
                            etiquetteCard(tip)
                        }
                    }
                }
                .padding(20)
            }
            .background(BrandPalette.background.ignoresSafeArea())
            .navigationTitle(Copy.clubsTab(language))
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var federationCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                ClubBadge(title: "BKB", color: BrandPalette.gold)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Belgische Krulbolbond")
                        .font(.headline)
                        .foregroundStyle(BrandPalette.white)
                    Text(language.text("Federation context", "Verbandskontext", "Contexte federal", "Contexto federativo"))
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(BrandPalette.secondaryText)
                }
                Spacer()
            }

            ForEach(AppData.federationSchedule(language)) { item in
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.title)
                        .font(.headline)
                        .foregroundStyle(BrandPalette.gold)
                    Text(item.detail)
                        .font(.subheadline)
                        .foregroundStyle(BrandPalette.white)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(item.emphasis)
                        .font(.caption)
                        .foregroundStyle(BrandPalette.secondaryText)
                }
                .padding(.top, 4)
            }
        }
        .padding(16)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var progressCard: some View {
        let drills = AppData.drills(language)
        let ratio = Double(completed.count) / Double(max(drills.count, 1))

        return VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(language.text("Session progress", "Session-Fortschritt", "Progression de session", "Progreso de sesion"))
                    .font(.headline)
                    .foregroundStyle(BrandPalette.white)
                Spacer()
                Text("\(completed.count)/\(drills.count)")
                    .font(.headline.monospacedDigit())
                    .foregroundStyle(BrandPalette.gold)
            }

            ProgressView(value: ratio)
                .tint(BrandPalette.white)

            Text(ratio == 1 ? language.text("All preparation blocks are complete. The session plan is ready to use.", "Alle Vorbereitungsblöcke sind erledigt. Der Sessionsplan ist einsatzbereit.", "Tous les blocs de preparation sont termines. Le plan de session est pret.", "Todos los bloques de preparacion estan completos. El plan de sesion ya esta listo.") : language.text("Mark each block as it is completed during setup or delivery.", "Markiere jeden Block wahrend Vorbereitung oder Durchfuhrung als erledigt.", "Cochez chaque bloc au fur et a mesure pendant la preparation ou l'animation.", "Marca cada bloque a medida que se complete durante la preparacion o la sesion."))
                .font(.footnote)
                .foregroundStyle(BrandPalette.secondaryText)
        }
        .padding(16)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func clubCard(_ club: ClubProfile) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top, spacing: 12) {
                ClubBadge(title: club.badgeTitle, color: BrandPalette.white)

                VStack(alignment: .leading, spacing: 4) {
                    Text(club.name)
                        .font(.title3.weight(.bold))
                        .foregroundStyle(BrandPalette.white)
                    Text("\(club.city) · \(club.founding)")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(BrandPalette.gold)
                }
                Spacer()
                TagChip(title: club.sourceLabel)
            }

            infoLine(title: language.text("Address", "Adresse", "Adresse", "Direccion"), value: club.address)
            infoLine(title: language.text("Contact", "Kontakt", "Contact", "Contacto"), value: club.contact)
            infoLine(title: language.text("Facilities", "Anlage", "Installations", "Instalaciones"), value: club.accommodation)
            infoLine(title: language.text("Schedule", "Spielrhythmus", "Rythme", "Ritmo"), value: club.schedule)
            infoLine(title: language.text("History", "Geschichte", "Histoire", "Historia"), value: club.history)
        }
        .padding(16)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func infoLine(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title.uppercased())
                .font(.caption2.weight(.black))
                .foregroundStyle(BrandPalette.secondaryText)
            Text(value)
                .font(.subheadline)
                .foregroundStyle(BrandPalette.white)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private func drillCard(_ drill: Drill) -> some View {
        let isDone = completed.contains(drill.id)

        return VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(drill.title)
                        .font(.headline)
                        .foregroundStyle(BrandPalette.white)
                    Text("\(drill.duration) · \(drill.focus)")
                        .font(.subheadline.weight(.medium))
                        .foregroundStyle(BrandPalette.secondaryText)
                }

                Spacer()

                Button {
                    if isDone {
                        completed.remove(drill.id)
                    } else {
                        completed.insert(drill.id)
                    }
                } label: {
                    Image(systemName: isDone ? "checkmark.circle.fill" : "circle")
                        .font(.title2)
                        .foregroundStyle(isDone ? BrandPalette.white : BrandPalette.secondaryText)
                }
                .buttonStyle(.plain)
            }

            ForEach(Array(drill.steps.enumerated()), id: \.offset) { index, step in
                HStack(alignment: .top, spacing: 10) {
                    Text("\(index + 1)")
                        .font(.caption.weight(.black))
                        .foregroundStyle(BrandPalette.background)
                        .frame(width: 24, height: 24)
                        .background(drill.color)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    Text(step)
                        .font(.subheadline)
                        .foregroundStyle(BrandPalette.white)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .padding(16)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(drill.color.opacity(0.4), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func gearCard(_ item: GearItem) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: item.systemImage)
                .font(.headline)
                .foregroundStyle(BrandPalette.background)
                .frame(width: 40, height: 40)
                .background(BrandPalette.white)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

            VStack(alignment: .leading, spacing: 6) {
                Text(item.title)
                    .font(.headline)
                    .foregroundStyle(BrandPalette.white)
                Text(item.detail)
                    .font(.subheadline)
                    .foregroundStyle(BrandPalette.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer(minLength: 0)
        }
        .padding(16)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func etiquetteCard(_ tip: EtiquetteTip) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(tip.title)
                .font(.headline)
                .foregroundStyle(BrandPalette.gold)
            Text(tip.detail)
                .font(.subheadline)
                .foregroundStyle(BrandPalette.secondaryText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}
