class Presentations08

  attr_reader :presentations

  @@presentation_data=[["ABC-programmering","Thomas Nilsson",["abc-programmering_-_thomas_nilsson.pdf"]],
    ["Agil Biztalkutveckling","Joshua Anthony",["agil_biztalkutveckling_-_joshua_anthony.pdf","agil_biztalkutveckling_-_joshua_anthony.ppt"]],
    ["Agil Data","Niklas Lindström",["agil_data_-_niklas_lindstrom.zip"]],
    ["Agil dokumentation med bumblebee","Daniel Brolund",["agil_dokumentation_med_bumblebee_-_daniel_brolund.pdf","agil_dokumentation_med_bumblebee_-_daniel_brolund.ppt"]],
    ["Agil metoder i inbyggda system","Johan Hernefeldt",["agila_metoder_i_inbyggda_system_-_johan_hernefeldt.pdf","agila_metoder_i_inbyggda_system_-_johan_hernefeldt.ppt"]],
    ["Agil systemförvaltning","Henrik Lilienberg",["agil_systemforvaltning_-_henrik_lilienberg.pdf","agil_systemforvaltning_-_henrik_lilienberg.ppt"]],
    ["Agila som fiskar","Johan Lind",["agila_som_fiskar_-_johan_lind.pdf"]],
    ["Agila tester av inköpta system","Jonas Hermansson",["agila_tester_av_inkopta_system_-_jonas_hermansson.pdf","agila_tester_av_inkopta_system_-_jonas_hermansson.ppt"]],
    ["Agile bi dw","Daniel Fagerström.",["agile_bi_dw_-_daniel_fagerstrom.pdf"]],
    ["Agile decision awareness","Staffan Nöteberg",["agile_decision_awareness_-_staffan_noteberg.pdf"]],
    ["Agile game development","Fredrik Sjöö",["agile_game_development_-_fredrik_sjoo.pdf","agile_game_development_-_fredrik_sjoo.zip"]],
    ["Agile practices-experiences and adaptations","Mats Wahlberg",["agile_practices-experiences_and_adaptations_-_mats_wahlberg.pdf"]],
    ["Alla ska med","Andreas Ekström",["alla_ska_med_-_andreas_ekstrom.key.zip","alla_ska_med_-_andreas_ekstrom.pdf"]],
    ["Att skapa en product backlog","Martin Persson",["att_skapa_en_product_backlog_-_martin_persson.pdf","att_skapa_en_product_backlog_-_martin_persson.ppt"]],
    ["Bygg bättre system effektiva möten med användare","Johanna Särnå",["bygg_battre_system_effektiva_moten_med_anvandare_-_johanna_sarna.ppt","bygg_battre_system_effektiva_moten_med_anvandare_johanna_sarna.pdf"]],
    ["Bygg team på förtroende","Joakim Ohlrogge",["bygg_team_pa_fortroende_-_joakim_ohlrogge.pdf","bygg_team_pa_fortroende_-_joakim_ohlrogge.ppt"]],
    ["Bygga produktionsklart","Lars-Erik Stenholm",["bygga_produktionsklart_-_lars-erik_stenholm.pdf","bygga_produktionsklart_-_lars-erik_stenholm.ppt"]],
    ["Cppverktyg","Andreas Larsson",["cppverktyg_-_andreas_larsson.pdf","cppverktyg_-_andreas_larsson.ppt"]],
    ["Don quijote mot draken","Michael Albrecht",["don_quijote_mot_draken_-_michael_albrecht.pdf","don_quijote_mot_draken_-_michael_albrecht.ppt"]],
    ["Du kodar väl på svenska","Joakim Sundén",["du_kodar_val_pa_svenska_-_joakim_sundén.key.zip","du_kodar_val_pa_svenska_-_joakim_sundén.pdf"]],
    ["En dag i en agil analytikers liv","Thomas Nilsson",["en_dag_i_en_agil_analytikers_liv_-_thomas_nilsson.key.zip","en_dag_i_en_agil_analytikers_liv_-_thomas_nilsson.pdf"]],
    ["Erfarenheter från lean implementationer","Marcus Ahnve",["erfarenheter_fran_lean_implementationer_-_marcus_ahnve.pdf","erfarenheter_fran_lean_implementationer_-_marcus_ahnve.zip"]],
    ["Funktionstestning med fitnesse","Joakim Karason",["funktionstestning_med_fitnesse_-_joakim_karason.pdf"]],
    ["Grupper eller teamwork","Tobias Anderberg",["grupper_eller_teamwork_-_tobias_anderberg.key.zip","grupper_eller_teamwork_-_tobias_anderberg.pdf"]],
    ["I vattenfallets land","Jimmy Larsson",["i_vattenfallets_land_-_jimmy_larsson.key.zip","i_vattenfallets_land_-_jimmy_larsson.pdf"]],
    ["Kan man undvika den tekniska skuldfällan","Petter Wigle",["kan_man_undvika_den_tekniska_skuldfallan_-_petter_wigle.pdf","kan_man_undvika_den_tekniska_skuldfallan_-_petter_wigle.ppt"]],
    ["Kontinuerlig integration med ivy och team city","Niklas Lindholm",["kontinuerlig_integration_med_ivy_och_team_city_-_niklas_lindholm.pdf","kontinuerlig_integration_med_ivy_och_team_city_-_niklas_lindholm.ppt"]],
    ["Ksse at polopoly","Peter Antman",["ksse_at_polopoly_-_peter_antman.pdf","ksse_at_polopoly_-_peter_antman.ppt"]],
    ["Lättrörlig på egen hand","David Vrensk",["lattrorlig_pa_egen_hand_-_david_vrensk.pdf"]],
    ["Medvetet systemtänkande","Lennart Floreby",["medvetet_systemtankande_-_lennart_floreby.pdf","medvetet_systemtankande_-_lennart_floreby.ppt"]],
    ["När jag till slut förstod BDD","Niclas Nilsson",["nar_jag_till_slut_forstod_bdd_-_niclas_nilsson.pdf"]],
    ["Nattliga tester med Linux och Perl","Erwan Lemonnier",["nattliga_tester_med_linux_och_perl_-_erwan_lemonnier.zip"]],
    ["Nlp som kommunikationsstrategi","Mats Oldin",["nlp_som_kommunikationsstrategi_-_mats_oldin.pdf","nlp_som_kommunikationsstrategi_-_mats_oldin.ppt"]],
    ["Overcoming meeting skepsis","Marcus Widerberg",["overcoming_meeting_skepsis_-_marcus_widerberg.pdf","overcoming_meeting_skepsis_-_marcus_widerberg.ppt"]],
    ["Patientmetaforen","Gabriel Falkenberg",["patientmetaforen_-_gabriel_falkenberg.key.zip","patientmetaforen_-_gabriel_falkenberg.pdf"]],
    ["Ping-pong-kingen","Joakim Holm",["ping-pong-kingen_-_joakim_holm.pdf"]],
    ["Pomodoro technique","Staffan Nöteberg",["pomodoro_technique_-_staffan_noteberg.pdf"]],
    ["Produktiva team","David Barnholdt",["produktiva_team_-_barnholdt.pdf"]],
    ["Retrospektiv på riktigt","Chris Headgate",["retrospektiv_pa_riktigt_-_chris_headgate.key.zip","retrospektiv_pa_riktigt_-_chris_headgate.pdf"]],
    ["Scrum at polopoly eller varför vi var tvungna att skapa en lean kultur","Peter Antman",["scrum_at_polopoly_eller_varfor_vi_var_tvungna_att_skapa_en_lean_kultur_-_peter_antman.pdf","scrum_at_polopoly_eller_varfor_vi_var_tvungna_att_skapa_en_lean_kultur_-_peter_antman.ppt"]],
    ["Scrum på svenska","Gabriel Falkenberg",["scrum_pa_svenska_-_gabriel_falkenberg.pdf","scrum_pa_svenska_-_gabriel_falkenberg.zip"]],
    ["Sofistikerade verktyg","Andreas Ekstrom",["sofistikerade_verktyg_-_andreas_ekstrom.key.zip","sofistikerade_verktyg_-_andreas_ekstrom.pdf"]],
    ["Teknisk skuld","Andreas Larsson",["teknisk_skuld_-_andreas_larsson.pdf","teknisk_skuld_-_andreas_larsson.ppt"]],
    ["Tester är inte poängen","Joakim Ohlrogge",["tester_ar_inte_poangen_-_joakim_ohlrogge.pdf","tester_ar_inte_poangen_-_joakim_ohlrogge.ppt"]],
    ["Trafikstockning","Måns Sandström",["trafikstockning_-_mans_sandstrom.pdf","trafikstockning_-_mans_sandstrom.zip"]],
    ["Tvärfunktionella team","Sara Manding",["tvarfunktionella_team_-_sara_manding.pdf","tvarfunktionella_team_-_sara_manding.ppt"]],
    ["User guide driven development","Daniel Brolund",["user_guide_driven_development_-_daniel_brolund.pdf","user_guide_driven_development_-_daniel_brolund.ppt"]],
    ["Using agile practices in a crisis","Mats Wahlberg",["using_agile_practices_in_a_crisis_-_mats_wahlberg.pdf"]],
    ["Value stream mapping","Henrik Kniberg",["value_stream_mapping_-_henrik_kniberg.pdf","value_stream_mapping_-_henrik_kniberg.ppt"]],
    ["Varför utbilda sina konkurrenter","Mattias Karlsson",["varfor_utbilda_sina_konkurrenter_-_mattias_karlsson.pdf","varfor_utbilda_sina_konkurrenter_-_mattias_karlsson.ppt"]]]

  def initialize
    load_presentations
  end

  def load_presentations
    @presentations = []
    @@presentation_data.each do |data|
      presentation = Presentation.new
      presentation.title = data[0]
      presentation.author = data[1]
      data[2].each do |file|
        presentation.files.push(file)
      end
      @presentations.push(presentation)
    end
  end


  def size
    50
  end

  def first
    @presentations.first
  end
end
