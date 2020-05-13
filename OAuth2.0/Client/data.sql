
INSERT INTO Person (firstname,lastname,email,address,city,password,dtype) VALUES 
    ('Robert','Exampler','robert@example.com','Example street','San Francisco','81dc9bdb52d04dc20036dbd8313ed055','Customer'),
    ('Admin','Admin','admin@example.com','Example street','Belmont','81dc9bdb52d04dc20036dbd8313ed055','Administrator'),
    ('Jack','Frost','jack@example.com','Example Blvd','San Francisco','81dc9bdb52d04dc20036dbd8313ed055','Customer'),
    ('Payment','User','paymentUser@dukesforest.com','-','-','58175e1df62779046a3a4e2483575937','Customer');

INSERT INTO Groups (name, description) VALUES 
    ('USERS', 'Users of the store'),
    ('ADMINS', 'Administrators of the store');

INSERT INTO Person_Group (groups_id, email) VALUES 
    (1,'robert@example.com'),
    (2,'admin@example.com'),
    (1,'jack@example.com'),
    (1,'paymentUser@dukesforest.com');