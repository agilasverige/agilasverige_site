# encoding: utf-8
require 'mail'
require 'pg'

options = { 
            :address              => "smtp.gmail.com",
            :port                 => 587,
            :user_name            => 'info@agilasverige.se',
            :password             => '<password>',
            :authentication       => 'plain',
            :enable_starttls_auto => true  
}

conn = PGconn.open(:dbname => 'agilasverige_production')
res = conn.exec('select title as title, email as email, first_name as first_name from speaking_proposals sp left join registrations r on sp.registration_id = r.id left join users u on r.user_id = u.id where (booked_day2 = true or booked_day1 = true) and sp.created_at between \'2016-01-01\' and \'2016-05-08\' offset 46')

information = '<p> Senast den 29/5 kommer vi att behöva din presentation för att kunna förbereda våra presentationsdatorer (mer information om hur vi tar emot presentationerna kommer).
      <p> För att se preliminärt vilken dag ditt tal är planerat till kan du kika på www.agilasverige.se/program .
      <p> Kom ihåg att om ni är fler som håller tal är det endast en talare som går gratis och de övriga behöver anmäla sig. Gör det gärna så fort som möjligt. 
      <p> Vi ser fram emot den 1-2 juni och är taggade på att detta kommer att bli en toppenkonferens!
      <p> Mvh Arrangörskommittén 2016'

Mail.defaults do
  delivery_method :smtp, options
end


res.each do |row|
  Mail.deliver do
    to row['email']
    from 'info@agilasverige.se'
    subject 'Accepterat tal - Agila Sverige 201r65'
    body   ''

    html_part do
      content_type 'text/html; charset=UTF-8'
      body '<h3>Bra jobbat ' + row['first_name'] + '!</h3> <br>  Ditt tal <b>' + row['title'] + '</b> har accepterats till Agila Sverige 2016.'+information
    end

  end
end


