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
res = conn.exec('select first_name, title, email from speaking_proposals sp left join registrations r on sp.registration_id = r.id left join users u on r.user_id = u.id where not(booked_day2 = true or booked_day1 = true) and sp.created_at between \'2016-01-01\' and \'2016-05-08\';')

information = '<p> Vi hoppas att du väljer att ta med dig ämnet som ett Open Space-ämne eller en föranmäld workshop!
      <p> Mvh Arrangörskommittén 2016'

Mail.defaults do
  delivery_method :smtp, options
end


res.each do |row|
  Mail.deliver do
    to row['email']
    from 'info@agilasverige.se'
    subject 'Ditt tal - Agila Sverige 2016'
    body   ''

    html_part do
      content_type 'text/html; charset=UTF-8'
      body 'Hej ' + row['first_name'] + '! <br>  På grund av ett stort antal anmälda tal var vi tvungna att göra ett urval i programmet. Ditt tal <b>' + row['title'] + '</b> kom tyvärr inte med till Agila Sverige 2016.'+information
    end

  end
end


