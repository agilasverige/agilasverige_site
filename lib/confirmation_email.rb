class ConfirmationEmail < EmailMessage

  FROM = 'registrar@agilasverige.se'
  SUBJECT = 'Tack för din anmälan till Agila Sverige 2009'

  def initialize(attendant)
    @attendant = attendant
    self.to = @attendant.email
    self.from = FROM 
    self.subject = SUBJECT
    super()
  end

  def body
    temp_body = salutation + info 
    if(@attendant.speaker?)
      temp_body << speaker
    else
      temp_body << invoice
    end
    temp_body
  end

  def salutation
    " Hej #{@attendant.first_name}

Tack för din anmälan till Agila Sverige 2009!

"
  end

  def info
    "
Vi har registrerat följande uppgifter om dig:

Namn: #{@attendant.first_name} #{@attendant.last_name}
Organisation: #{@attendant.organization}
Adress: #{@attendant.address}
Postnummer: #{@attendant.zip_code}
Postadress: #{@attendant.postal_address}
Land: #{@attendant.country}
Telefonnummer: #{@attendant.telephone_number}
"
  end

  def speaker
      "
Förslag till blixttal:
----------------------

Titel: #{@attendant.speaking_proposal.title}
Beskrivning: #{@attendant.speaking_proposal.abstract}
      "
  end

  def invoice
    "
Detta meddelande fungerar även som underlag för faktura.  Vill du ha en
pdf-version, kontakta oss via: faktura@agilasverige.se

Fakturainformation nedan:
-------------------------

Agila Sverige
c/o Joakim Holm 
Sandelsgatan 40 
115 33 Stockholm (Innehar 
F-skattesedel) 
http://agilasverige.se 

Betalningsinformation: 
----------------------

Bankgiro: 280-9267 
Orgnr: 802404-7879

Datum: #{@attendant.invoice_date}
Fakturanr: #{@attendant.invoice_no}
Tjänst: Agila Sverige 2009 (early bird)
Pris: SEK 1000
Moms 25%: SEK 250
Summa: SEK 750

OBS:
För att du skall kunna deltaga på konferensen måste vi ha pengarna på
vårt konto senast den 4:e juni. Eftersom vi räknar med att platserna går
åt, rekommenderar vi att du garanterar din plats genom att betala så
fort som möjligt. Vi återbetalar inga anmälningsavgifter men det går att
överlåta platsen till en annan person.
    "
  end

end
