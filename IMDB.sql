CREATE TABLE "IMDBschema"."Comment"
(
  "commentID" integer NOT NULL,
  "UserID" integer NOT NULL,
  "MovieID" integer NOT NULL,
  "CommentDate" date NOT NULL,
  "CommentTitle" text NOT NULL,
  CONSTRAINT "CommentID" PRIMARY KEY ("commentID"),
  CONSTRAINT "Movie_fkey" FOREIGN KEY ("MovieID")
      REFERENCES "IMDBschema"."Movie" ("MovieID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "Usercomment_fkey" FOREIGN KEY ("UserID")
      REFERENCES "IMDBschema"."User" ("UserID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);


CREATE TABLE "IMDBschema"."Movie"
(
  "MovieID" integer NOT NULL,
  "MovieName" character(1) NOT NULL,
  "MovieDate" date,
  "MovieStudio" character(1),
  "MovieTypeID" integer NOT NULL,
  CONSTRAINT "MovieID" PRIMARY KEY ("MovieID"),
  CONSTRAINT "MovieType_fkey" FOREIGN KEY ("MovieTypeID")
      REFERENCES "IMDBschema"."MovieType" ("MovieTypeID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE "IMDBschema"."MovieActor"
(
  "MovieID" integer NOT NULL,
  "PersonID" integer NOT NULL,
  CONSTRAINT "MovieActor_fkey" FOREIGN KEY ("MovieID")
      REFERENCES "IMDBschema"."Movie" ("MovieID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "MoviePerson_fkey" FOREIGN KEY ("PersonID")
      REFERENCES "IMDBschema"."Person" ("PersonID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
REATE TABLE "IMDBschema"."MovieDirector"
(
  "MovieID" integer NOT NULL,
  "PersonID" integer NOT NULL,
  CONSTRAINT "MovieActor_fkey" FOREIGN KEY ("MovieID")
      REFERENCES "IMDBschema"."Movie" ("MovieID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "MovieActor_fkey1" FOREIGN KEY ("PersonID")
      REFERENCES "IMDBschema"."Person" ("PersonID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE "IMDBschema"."MovieRate"
(
  "MovieID" integer NOT NULL,
  "UserID" integer NOT NULL,
  "MovieRating" integer NOT NULL,
  CONSTRAINT "MovieRate_fkey1" FOREIGN KEY ("MovieID")
      REFERENCES "IMDBschema"."Movie" ("MovieID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "MovieRate_fkey2" FOREIGN KEY ("UserID")
      REFERENCES "IMDBschema"."User" ("UserID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE "IMDBschema"."MovieType"
(
  "MovieTypeID" integer NOT NULL,
  "MovieTypeName" character(1) NOT NULL,
  "MovieTypeDescription" text,
  CONSTRAINT "movieTypeID" PRIMARY KEY ("MovieTypeID")
)
WITH (
  OIDS=FALSE
);
CREATE TABLE "IMDBschema"."MovieTypeMovie"
(
  "MovieTypeID" integer NOT NULL,
  "MovieID" integer,
  CONSTRAINT "MovieTypeMovie_fkey" FOREIGN KEY ("MovieID")
      REFERENCES "IMDBschema"."Movie" ("MovieID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
CREATE TABLE "IMDBschema"."Person"
(
  "PersonID" integer NOT NULL,
  "PersonName" character(1) NOT NULL,
  "PersonSurname" character(1) NOT NULL,
  CONSTRAINT "PersonID" PRIMARY KEY ("PersonID")
)
WITH (
  OIDS=FALSE
);

REATE TABLE "IMDBschema"."TopOne"
(
  "MovieID" integer NOT NULL,
  "MovieRate" integer NOT NULL,
  CONSTRAINT "TopOne" FOREIGN KEY ("MovieID")
      REFERENCES "IMDBschema"."Movie" ("MovieID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE "IMDBschema"."User"
(
  "UserID" integer NOT NULL,
  "UserName" character(1) NOT NULL,
  "UserSurname" character(1) NOT NULL,
  CONSTRAINT "UserID" PRIMARY KEY ("UserID")
)
WITH (
  OIDS=FALSE
);
CREATE TABLE "IMDBschema"."UserEdit"
(
  "UserID" integer NOT NULL,
  "UserNick" character(1) NOT NULL,
  "UserEmail" character(1) NOT NULL,
  "UserPassword" character(1) NOT NULL,
  "UserBirth" date NOT NULL,
  CONSTRAINT "UserEdit_fkey" FOREIGN KEY ("UserID")
      REFERENCES "IMDBschema"."User" ("UserID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);