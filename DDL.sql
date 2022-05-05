
create table tblRating (
	seq number primary key,
	rating varchar2(30) not null
);

create table tblMovie (
	seq number primary key,
	rseq number not null references tblRating(seq),
	title varchar2(90) not null,
    engtitle varchar2(90) not null,
    audience number null,
    runningtime number null,
    likes number null,
    summary varchar2(1500) not null,
    releasedate date not null
);

create table tblGenrelist (
	seq number primary key,
	name varchar2(30) not null
);

create table tblMovieGenre (
	seq number primary key,
        mseq number not null references tblMovie(seq),
gseq number not null references tblGenrelist(seq)
	
);

create table tblCountrylist (
	seq number primary key,
	name varchar2(90) not null
);

create table tblMovieCountry (
	seq number primary key,
    mseq number not null references tblMovie(seq),
    cseq number not null references tblCountrylist(seq)
	
);

create table tblFilmcompany (
	seq number primary key,
	name varchar2(90) null,
	location varchar2(90) null,
	address varchar2(90) null,
	site varchar2(90) null
);

create table tblFilmcompanyMovie (
	seq number primary key,
	fseq number not null references tblFilmcompany(seq),
	mseq number not null references tblMovie(seq),
	role varchar2(90) not null
);

create table tblMovievideo (
    seq number primary key,
    mseq number not null references tblMovie(seq),
    division varchar2(90) not null,
    title varchar2(90) not null,
    regdate date not null,
    video varchar2(200) not null
);

create table tblMoviePerson (
    seq number primary key,
    name varchar2(90) not null,
    birthday date null,
    height number null,
    weight number null,
    aname varchar2(90) null
);

create table tblUser(
	id VARCHAR(30) primary key,
	gender VARCHAR(1) not null,
	age NUMBER not null

);

create table tblQuote (
    seq number primary key,
    mseq number not null references tblMovie(seq),
    ID varchar2(30) not null references tblUser(ID),
    mpseq number not null references tblMovieperson(seq),
    line varchar2(300) not null,
    role varchar2(60) default '이름없음' not null,
    likes number default 0 not null,
    regdate date not null
);



create table tblPhoto (
seq number primary key,
mseq number not null references tblMovie(seq),
category varchar2(30) not null,
photoURL varchar2(200) not null,
title varchar2(120) not null
);


create table tblMovieMoviePerson (
    seq number primary key,
    mseq references tblMovie(seq),
    mpseq references tblMoviePerson(seq),
    role varchar2(6) check (role in('주연', '조연', '감독')),
    casting varchar2(50) null
);

create table tblAwards (
    seq number primary key,
    mpseq references tblMoviePerson(seq),
    content VARCHAR2(300) not null    
);

create table tblPhotoMoviePerson (
    seq number primary key,
    pseq references tblPhoto(seq),
    mpseq references tblMoviePerson(seq)   
);
 

create table tblMoviepersonReview (
	seq number primary key,
    mpseq number not null references tblMovieperson(seq),
    id VARCHAR2(30) not null references tbluser(id),
    contents VARCHAR2(1500) not null,
    regdate DATE default SYSDATE not null,
    title VARCHAR2(90),
    views NUMBER  DEFAULT 0 not null,
    likes NUMBER  DEFAULT 0 not null
 );

create table tblMovieReivew (
	seq number primary key,
	contents varchar2(1500) not null,
	regdate date default sysdate not null,
	title varchar2(90) not null,
	views number default 0 not null,
	recommendedNum number default 0 not null,
	mseq number not null references tblMovie(seq),
	ID varchar2(30) not null references tblUser(ID)
);

create table tblRatings (
	seq number primary key,
	score number(10) not null,
	contents varchar2(1500) not null,
	regdate date default sysdate not null,
	likes number default 0 not null,
	nlikes number default 0 not null,
	mseq number references tblMovie(seq) not null,
	ID varchar2(30) not null references tblUser(ID)
);










































