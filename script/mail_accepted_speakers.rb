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

conn = PGconn.open(:dbname => 'agilasverige_development')
res = conn.exec('select title as title, email as email, first_name as first_name from speaking_proposals sp left join registrations r on sp.registration_id = r.id left join users u on r.user_id = u.id where (booked_day2 = true or booked_day1 = true) and sp.created_at between \'2014-12-01\' and \'2015-05-08\' offset 46')

information = '<p> Senast den 31/5 kommer vi att behöva din presentation för att kunna förbereda våra presentationsdatorer (mer information om hur vi tar emot presentationerna kommer).
      <p> För att se preliminärt vilken dag ditt tal är planerat till kan du kika på www.agilasverige.se/program . 
      <p> Vi ser fram emot den 3-4 juni och är taggade på att detta kommer att bli en toppenkonferens!
      <p> Mvh Arrangörskommittén 2015'

Mail.defaults do
  delivery_method :smtp, options
end


res.each do |row|
  Mail.deliver do
    to row['email']
    from 'info@agilasverige.se'
    subject 'Accepterat tal - Agila Sverige 2015'
    body   ''

    html_part do
      content_type 'text/html; charset=UTF-8'
      body '<h3>Bra jobbat ' + row['first_name'] + '!</h3> <br>  Ditt tal <b>' + row['title'] + '</b> har accepterats till Agila Sverige 2015.'+information
    end

  end
end


