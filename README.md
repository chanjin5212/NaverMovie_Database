# π₯NaverMovie_Database
#### - Project topic : λ€μ΄λ² μνλ₯Ό μ΄μ©ν DB μ‘°μ
#### - Project execution period : 2022-04-29~2022-05-04
-------------------------------
### 1. λ°μ΄ν° μμ§
<img src = "https://user-images.githubusercontent.com/97499271/166864754-9f5210ca-2c5c-48aa-9f5c-2f7c08be76f3.png" width="300" height="300"/> <img src = "https://user-images.githubusercontent.com/97499271/166864757-5ede9c0d-f671-4c92-a092-aee15ac9815b.png" width="500" height="300"/>

- [λ€μ΄λ² μν](https://movie.naver.com/movie/sdb/rank/rmovie.naver) μμ μμ± ν΄μΌλ  **Table**μ μ λ³΄λ₯Ό μμ§νκ³  μ λ¦¬νλ€.

-------------------------------
### 2. ERD μμ±
#### - μ¬μ©ν νλ‘κ·Έλ¨ : EXERD <img src = "https://user-images.githubusercontent.com/97499271/166865359-0b33d34d-b67b-45e5-8eeb-07e608f193b4.png" width="20" height="20"/>

<img src = "https://user-images.githubusercontent.com/97499271/166865737-8e5b8679-9d4d-455d-bfc9-e6e911b48ab3.png">

- **λΌλ¦¬ ERD** μμ± ν, **λ¬Όλ¦¬ ERD** μμ±μ ν΅ν΄ μ΅μ’μ μΌλ‘ κ΄λ¦¬ν  λ°μ΄ν°λ₯Ό μ ννκ³  **μ μ½μ¬ν­**μ μΆκ°νλ€.
- **Relationship**μμ **N:Nμ κ΄κ³**λ κ°μ§ μ μκΈ° λλ¬Έμ, λ°λ‘ νμ΄λΈμ μΆκ°ν΄μ κ΄λ¦¬νμλ€.(ex.μν-μ₯λ₯΄, μν-κ΅­κ°)

-------------------------------

### 3. νμ΄λΈ μ μμ λ° DDL μμ±
<img src = "https://user-images.githubusercontent.com/97499271/166867068-9f402162-69e5-4dd1-b295-865050babf45.png">

- **νμ΄λΈ μ μμ**λ₯Ό μμ±ν΄ λ¬Όλ¦¬ λ°μ΄ν° λ² μ΄μ€μ μ΄μν  μ€λΉλ₯Ό νλ€.

```sql
-- μν
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

### 4. DML μμ±

```sql
-- μνμΈ
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, 'μλ λ λλ©μΈ', '1982-01-06', 183, null,'Edward John David Redmayne');
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, 'μ£Όλ λ‘', '1972-12-29', 178, 66, 'μ₯¬λ λ‘μ°');
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, 'λ§€μ¦ λ―ΈμΌμ¨', '1965-11-22', '183', null, null);
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, 'λ ν¬κΈλ¬', '1976-10-20', 165, null, 'Daniel Kevin Fogler');
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, 'μ¨λ¦¬μ¨ μλ', '1984-12-23', 168, null, 'μ΄ νμΈ νλ μ§,A Fine Frenzy,Alison Monro');
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, 'μμ¦λΌ λ°λ¬', '1992-09-30', 180, null, null);
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, 'μΉΌλΌ ν°λ', '1990-02-15', 187, null, null);
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, 'μ μμΉ΄ μλ¦¬μμ€', null, null, null, 'Jessica R. Williams');
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, 'λ°μ΄λΉ μμ΄μΈ ', '1963-11-30', 185, null, null);
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, 'κΉμκ²½', null, 183, 78, 'Sang-kyung Kim');
insert into tblMoviePerson (seq, name, birthday, height, weight, aname) values (seq.nextVal, 'μ΄μ λΉ', null, 166, null, 'μ΄μ§κ²½');
```

- μ΅μ’μ μΌλ‘ **Table**μ μΆκ°ν  **λ°μ΄ν°**λ₯Ό μμ±νλ€.

### 5. Feedbackπ
#### βͺ λͺ¨λΈλ§ μμμ λΆμ‘±
- **ERDμμ±**μμ, **μ λ³΄ μμ§**μ΄ μ λλ‘ μ΄λ£¨μ΄μ§μ§ μμ **null**μΈ κ²½μ°μλ **not null**λ‘ μ§μ λ κ²½μ°κ° λ§μμ λ°κΏμΌνλ λ²κ±°λ‘μμ΄ κ΅μ₯ν λ§μλ€. **λͺ¨λΈλ§ μμ**μ μ’ λ νμ€νκ² ν  νμμ±μ΄ μμ΄ λ³΄μΈλ€.
#### βͺ μνμ€ κ°μ²΄ μ΄λ¦
- seq.nextval μ ν΅ν΄μ μνμ€ λ²νΈλ₯Ό λ§λ€μλλ°, λͺ¨λ κ°μ μ΄λ¦μ μ¬μ©ν΄ drop, createλ₯Ό μ¬λ¬λ² λ°λ³΅νλ€. λ°λΌμ λμ€μ μΆκ°λλ λ°μ΄ν°μ κ²½μ° λ§μ§λ§ μνμ€ λ²νΈκ° μ μ₯λμ΄ μμ§ μκΈ° λλ¬Έμ, λ€μ μ°ΎμμΌ νλ λ²κ±°λ‘μμ΄ μλ€. κ·Έλ κΈ° λλ¬Έμ μνμ€ κ°μ²΄μ μ΄λ¦μ νμ΄λΈλ§λ€ λ€λ₯΄κ² ν΄μ κ΄λ¦¬ν  νμκ° μμ κ² κ°λ€.
