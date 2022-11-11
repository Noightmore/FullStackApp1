-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-11-11 15:27:30.234

-- basic table layout of the database

-- tables
-- Table: Image
CREATE TABLE Images (
    Id bigserial  NOT NULL,
    ImageData bytea  NOT NULL,
    Description varchar(20)  NOT NULL,
    CONSTRAINT Image_pk PRIMARY KEY (Id)
);

-- Table: Thread
CREATE TABLE Threads (
    Id bigserial  NOT NULL,
    Header varchar(20)  NOT NULL,
    User_Id bigserial  NOT NULL,
    Description text  NOT NULL,
    Image_Id bigserial  NOT NULL,
    CONSTRAINT Thread_pk PRIMARY KEY (Id)
);

-- Table: ThreadSubscription
CREATE TABLE ThreadSubscriptions (
    User_Id bigserial  NOT NULL,
    Thread_Id bigserial  NOT NULL,
    StartOfSubscription bigint  NOT NULL,
    CONSTRAINT ThreadSubscription_pk PRIMARY KEY (User_Id,Thread_Id)
);

-- Table: User
CREATE TABLE "users" (
    Id bigserial  NOT NULL,
    Nickname varchar(60)  NOT NULL,
    Email varchar(30)  NOT NULL,
    "password" varchar(100)  NOT NULL,
    CONSTRAINT User_pk PRIMARY KEY (Id)
);

-- foreign keys
-- Reference: ThreadSubscription_Thread (table: ThreadSubscription)
ALTER TABLE ThreadSubscriptions ADD CONSTRAINT ThreadSubscription_Thread
    FOREIGN KEY (Thread_Id)
    REFERENCES Threads (Id)
    ON DELETE  RESTRICT
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: ThreadSubscription_User (table: ThreadSubscription)
ALTER TABLE ThreadSubscriptions ADD CONSTRAINT ThreadSubscription_User
    FOREIGN KEY (User_Id)
    REFERENCES "users" (Id)
    ON DELETE  CASCADE
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Thread_Image (table: Thread)
ALTER TABLE Threads ADD CONSTRAINT Thread_Image
    FOREIGN KEY (Image_Id)
    REFERENCES Images (Id)
    ON DELETE  CASCADE
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Thread_User (table: Thread)
ALTER TABLE Threads ADD CONSTRAINT Thread_User
    FOREIGN KEY (User_Id)
    REFERENCES "users" (Id)
    ON DELETE  SET NULL
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- End of file.

