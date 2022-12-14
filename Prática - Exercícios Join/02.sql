SELECT testimonials.id, users.name AS writer, recipient.name AS recipient, testimonials.message FROM testimonials 
JOIN users ON testimonials."writerId"= users.id 
JOIN users AS recipient ON testimonials."recipientId"=recipient.id;
