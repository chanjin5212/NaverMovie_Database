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
- **Relationship**에서 **N:N의 관계**는 가질 수 없기 때문에, 따로 테이블을 추가해서 관리하였다.(ex.영화-장르, 영화-국가)

-------------------------------

### 3. 테이블 정의서 및 DDL 작성
<img src = "https://user-images.githubusercontent.com/97499271/166867068-9f402162-69e5-4dd1-b295-865050babf45.png">

- **테이블 정의서**를 작성해 물리 데이터 베이스에 이식할 준비를 한다.

```sql
-- 영화
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
-- 영화인
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

### 5. Feedback🚑
#### ↪ 모델링 작업의 부족
- **ERD작성**에서, **정보 수집**이 제대로 이루어지지 않아 **null**인 경우에도 **not null**로 지정된 경우가 많아서 바꿔야하는 번거로움이 굉장히 많았다. **모델링 작업**을 좀 더 확실하게 할 필요성이 있어 보인다.
#### ↪ 시퀀스 객체 이름
- seq.nextval 을 통해서 시퀀스 번호를 만들었는데, 모두 같은 이름을 사용해 drop, create를 여러번 반복했다. 따라서 나중에 추가되는 데이터의 경우 마지막 시퀀스 번호가 저장되어 있지 않기 때문에, 다시 찾아야 하는 번거로움이 있다. 그렇기 때문에 시퀀스 객체의 이름을 테이블마다 다르게 해서 관리할 필요가 있을 것 같다.
