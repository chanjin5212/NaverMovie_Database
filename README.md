# 🎥NaverMovie_Database
#### - Project topic : 네이버 영화를 이용한 DB 조작
#### - Project execution period : 2022-04-29~2022-05-04
-------------------------------
### 1. 데이터 수집
<img src = "https://user-images.githubusercontent.com/97499271/166864754-9f5210ca-2c5c-48aa-9f5c-2f7c08be76f3.png" width="300" height="300"/> <img src = "https://user-images.githubusercontent.com/97499271/166864757-5ede9c0d-f671-4c92-a092-aee15ac9815b.png" width="500" height="300"/>

- [네이버 영화](https://movie.naver.com/movie/sdb/rank/rmovie.naver) 에서 생성 해야될 **Table**의 정보를 수집하고 정리한다.

-------------------------------
### 2. ERD 작성
#### - 사용한 프로그램 : EXERD <img src = "https://user-images.githubusercontent.com/97499271/166865359-0b33d34d-b67b-45e5-8eeb-07e608f193b4.png" width="20" height="20"/>

<img src = "https://user-images.githubusercontent.com/97499271/166865737-8e5b8679-9d4d-455d-bfc9-e6e911b48ab3.png">

- **논리 ERD** 작성 후, **물리 ERD** 작성을 통해 최종적으로 관리할 데이터를 선택하고 **제약사항**을 추가한다.

-------------------------------

### 3. 테이블 정의서 및 DDL 작성
<img src = "https://user-images.githubusercontent.com/97499271/166867068-9f402162-69e5-4dd1-b295-865050babf45.png">

- **테이블 정의서**를 작성해 물리 데이터 베이스에 이식할 준비를 한다.

```sql
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
```

-------------------------------

### 4. DML 작성

```sql
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, '에디 레드메인', '1982-01-06', 183, null,'Edward John David Redmayne');
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, '주드 로', '1972-12-29', 178, 66, '쥬드 로우');
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, '매즈 미켈슨', '1965-11-22', '183', null, null);
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, '댄 포글러', '1976-10-20', 165, null, 'Daniel Kevin Fogler');
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, '앨리슨 수돌', '1984-12-23', 168, null, '어 파인 프렌지,A Fine Frenzy,Alison Monro');
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, '에즈라 밀러', '1992-09-30', 180, null, null);
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, '칼럼 터너', '1990-02-15', 187, null, null);
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, '제시카 윌리엄스', null, null, null, 'Jessica R. Williams');
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, '데이빗 예이츠', '1963-11-30', 185, null, null);
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, '김상경', null, 183, 78, 'Sang-kyung Kim');
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, '이선빈', null, 166, null, '이진경');
```

- 최종적으로 **Table**에 추가할 **데이터**를 작성한다.
