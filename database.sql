--offer is an entity 

CREATE TABLE offer
(
    offer_id    INT          NOT NULL,
    offer_name  VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Offer PRIMARY KEY  (offer_id)
);

CREATE TABLE offer_attributes
(
    attr_id     INT          NOT NULL, 
    attr_name   VARCHAR(100) NOT NULL, 
    description TEXT,
    CONSTRAINT PK_Attr       PRIMARY KEY  (attr_id)
);

CREATE TABLE params
(
    offer_id    INT          NOT NULL,   
    attr_id     INT          NOT NULL, 
    attr_value  VARCHAR(100), 
    --CONSTRAINT PK_param       PRIMARY KEY  (?)
    CONSTRAINT FK_OfferId_Params FOREIGN KEY  (offer_id)  REFERENCES offer (offer_id), 
    CONSTRAINT FK_AttrId_Params  FOREIGN KEY  (attr_id)   REFERENCES offer_attributes (attr_id) 
);

CREATE TABLE usr
(
    usr_id    INT          NOT NULL PRIMARY KEY, 
    usr_name  VARCHAR(100) NOT NULL
);

CREATE TABLE user_offer
(
    usr_name  VARCHAR(100) NOT NULL,
    offer_id   INT          NOT NULL,
    CONSTRAINT PK_UserOffer PRIMARY KEY  (usr_name, offer_id),
    CONSTRAINT FK_OfferId_Offer FOREIGN KEY  (offer_id)  REFERENCES offer (offer_id), 
    CONSTRAINT FK_UserName_Name FOREIGN KEY  (usr_name)  REFERENCES usr   (usr_name) 
);