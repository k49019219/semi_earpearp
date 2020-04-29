show user;

create table aaa(name varchar2(20));

select *
from tab;

drop table aaa purge;

create table san_wish
(wishno         number not null
,fk_userid      Nvarchar2(16)
,fk_prodcode    varchar2(50)
,model          varchar2(20)
,quantity       number default 1
,constraint PK_san_wish primary key(wishno)
,constraint FK_san_wish_fk_userid foreign key(fk_userid) references san_member(userid)
,constraint FK_san_wish_fk_prodcode foreign key(fk_prodcode) references san_product(prodcode)
);
-- Table SAN_WISH이(가) 생성되었습니다.

drop table san_wish;

create sequence seq_san_wish
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_SAN_WISH이(가) 생성되었습니다.

drop sequence seq_san_wish;

select *
from san_member;

select *
from san_category;

select *
from san_product
order by prodcode;

select *
from san_cart;

drop table san_cart purge;

drop table san_wish purge;

drop table san_product purge;




select *
from san_wish;

select * from tabs;


drop table san_qna purge;

drop table san_review purge;

commit;

select *
from san_product
order by 1;

select *
from san_wish;

select *
from Seq

----------------------------------------- clear jelly insert -----------------------------------------

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'True luv-yellow(젤리)', '1_clearj_True luv-yellow(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'True luv-red(젤리)', '2_clearj_True luv-red(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Eyes bear(젤리)', '3_clearj_Eyes bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Eyes tomato(젤리)', '4_clearj_Eyes tomato(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Eyes triangle(젤리)', '5_clearj_Eyes triangle(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Eyes square(젤리)', '6_clearj_Eyes square(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Check kids bear(젤리)', '7_clearj_Check kids bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Rous the fastest(젤리)', '8_clearj_Rous the fastest(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Read intensively(젤리)', '9_clearj_Read intensively(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'dancing bear(젤리)', '10_clearj_dancing bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'TBear and rabbit(젤리)', '11_clearj_Bear and rabbit(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Rainbow bear(젤리)', '12_clearj_Rainbow bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Jolly(젤리)', '13_clearj_Jolly(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Dot love and bear(젤리)', '14_clearj_Dot love and bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Picnic bear(젤리)', '15_clearj_Picnic bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Animal friends(젤리)', '16_clearj_Animal friends(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Bear friends(젤리)', '17_clearj_Bear friends(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Dot big bear(젤리)', '18_clearj_Dot big bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Bear affect-blue/purple(젤리)', '19_clearj_Bear affect-blue/purple(젤리).jpg');

update san_product set prodimg='19_clearj_Bear affect-bluepurple(젤리).jpg'
where prodname = 'Bear affect-blue/purple(젤리)';

commit;

select *
from san_product;

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Bear affect-green/yellow(젤리)', '20_clearj_Bear affect-green/yellow(젤리).jpg');

update san_product set prodimg='20_clearj_Bear affect-greenyellow(젤리).jpg'
where prodname = 'Bear affect-green/yellow(젤리)';

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Dot cherry big bear(젤리)', '21_clearj_Dot cherry big bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Rose squirrel(젤리)', '22_clearj_Rose squirrel(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Bear flower garden(젤리)', '23_clearj_Bear flower garden(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Smart bear friends(젤리)', '24_clearj_Smart bear friends(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Squirrel Acorns(젤리)', '25_clearj_Squirrel Acorns(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Cherry big bear(젤리)', '26_clearj_Cherry big bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Bear heart(젤리)', '27_clearj_Bear heart(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Shapes special(젤리)', '28_clearj_Shapes special(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Cherry bear(젤리)', '29_clearj_Cherry bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Dot cherry bear(젤리)', '30_clearj_Dot cherry bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Rolling bear(젤리)', '31_clearj_Rolling bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Cookie bear(젤리)', '32_clearj_Cookie bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Today dog(젤리)', '33_clearj_Today dog(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Bear pick(젤리)', '34_clearj_Bear pick(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Big color bear(젤리)', '35_clearj_Big color bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Board bear(젤리)', '36_clearj_Board bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Roller bear(젤리)', '37_clearj_Roller bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Box mung(젤리)', '38_clearj_Box mung(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'I''m bread(젤리)', '39_clearj_I''m bread(젤리).jpg');

update san_product set prodimg='39_clearj_Im bread(젤리).jpg'
where prodname = 'I''m bread(젤리)';


insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'I''m eggplant(젤리)', '40_clearj_I''m eggplant(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'I''m broccoli(젤리)', '41_clearj_I''m broccoli(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'I''m Carrot(젤리)', '42_clearj_I''m Carrot(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'I''m banana(젤리)', '43_clearj_I''m banana(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'I''m pineapple(젤리)', '44_clearj_I''m pineapple(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Brunch cat(젤리)', '45_clearj_Brunch cat(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Paper cat(젤리)', '46_clearj_Paper cat(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'DogHeart character(젤리)', '47_clearj_DogHeart character(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Color bear(젤리)', '48_clearj_Color bear(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Monkey(젤리)', '49_clearj_Monkey(젤리).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 3, 'Mouse c(젤리)', '50_clearj_Mouse c(젤리).jpg');


----------------------------------------- color jelly insert -----------------------------------------

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'True luv-purple(color jelly)', '1_colorj_True luv-purple(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'True luv-pink(color jelly)', '2_colorj_True luv-pink(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'True luv-ornage(color jelly)', '3_colorj_True luv-ornage(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'True luv-yellow(color jelly)', '4_colorj_True luv-yellow(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'True luv-black(color jelly)', '5_colorj_True luv-navy(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'True luv-black(color jelly)', '6_colorj_True luv-black(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Kids bear-purple(color jelly)', '7_colorj_Kids bear-purple(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Kids bear-pink(color jelly)', '8_colorj_Kids bear-pink(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Kids bear-orange(color jelly)', '9_colorj_Kids bear-orange(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Kids bear-yellow(color jelly)', '10_colorj_Kids bear-yellow(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Kids bear-blue(color jelly)', '11_colorj_Kids bear-blue(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Kids bear-mint(color jelly)', '12_colorj_Kids bear-mint(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Kids bear-navy(color jelly)', '13_colorj_Kids bear-navy(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Kids bear-black(color jelly)', '14_colorj_Kids bear-black(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Eyes tomato-purple(color jelly)', '15_colorj_Eyes tomato-purple(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Eyes bear-yellow(color jelly)', '16_colorj_Eyes bear-yellow(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Eyes triangle-blue(color jelly)', '17_colorj_Eyes triangle-blue(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Eyes square-black(color jelly)', '18_colorj_Eyes square-black(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Rous the fastest-pink(color jelly)', '19_colorj_Rous the fastest-pink(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Rous the fastest-yellow(color jelly)', '20_colorj_Rous the fastest-yellow(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Rous the fastest-blue(color jelly)', '21_colorj_Rous the fastest-blue(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Rous the fastest-navy(color jelly)', '22_colorj_Rous the fastest-navy(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Rous the fastest-black(color jelly)', '23_colorj_Rous the fastest-black(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Read intensively-purple(color jelly)', '24_colorj_Read intensively-purple(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Read intensively-pink(color jelly)', '25_colorj_Read intensively-pink(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Read intensively-yellow(color jelly)', '26_colorj_Read intensively-yellow(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Read intensively-blue(color jelly)', '27_colorj_Read intensively-blue(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Read intensively-navy(color jelly)', '28_colorj_Read intensively-navy(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Read intensively-black(color jelly)', '29_colorj_Read intensively-black(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Bear and rabbit-purple(color jelly)', '30_colorj_Bear and rabbit-purple(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Bear and rabbit-pink(color jelly)', '31_colorj_Bear and rabbit-pink(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Bear and rabbit-orange(color jelly)', '32_colorj_Bear and rabbit-orange(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Bear and rabbit-yellow(color jelly)', '33_colorj_Bear and rabbit-yellow(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Bear and rabbit-blue(color jelly)', '34_colorj_Bear and rabbit-blue(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Bear and rabbit-mint(color jelly)', '35_colorj_Bear and rabbit-mint(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Bear and rabbit-navy(color jelly)', '36_colorj_Bear and rabbit-navy(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'dancing bear-purple(color jelly)', '37_colorj_dancing bear-purple(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'dancing bear-pink(color jelly)', '38_colorj_dancing bear-pink(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'dancing bear-yellow(color jelly)', '39_colorj_dancing bear-yellow(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'dancing bear-navy(color jelly)', '40_colorj_dancing bear-navy(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'dancing bear-black(color jelly)', '41_colorj_dancing bear-black(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Animal friends-purple(color jelly)', '42_colorj_Animal friends-purple(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Animal friends-pink(color jelly)', '43_colorj_Animal friends-pink(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Animal friends-orange(color jelly)', '44_colorj_Animal friends-orange(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Animal friends-yellow(color jelly)', '45_colorj_Animal friends-yellow(color jelly)');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Jolly-purple(color jelly)', '46_colorj_Jolly-purple(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Jolly-pink(color jelly)', '47_colorj_Jolly-pink(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Dot big bear-yellow(color jelly)', '48_colorj_Dot big bear-yellow(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Dot big bear-navy(color jelly)', '49_colorj_Dot big bear-navy(color jelly).jpg');

insert into san_product 
values('123-'||seq_san_product.nextval, 4, 'Dot love and bear-black(color jelly)', '50_colorj_Dot love and bear-black(color jelly).jpg');

commit;

select *
from san_product
order by 1;

select *
from san_detail_img
order by 1;

create or replace procedure pcd_3
(p_imgfilename     IN varchar2)
is
begin

    for i in 1..50 loop
    
    insert into san_detail_img(fk_prodcode, imgfilename)
     values('123-'||seq_3.nextval, p_imgfilename||i||'.jpg');

    end loop;
    
end pcd_3;
-- p: 파라미터 userid: 변수 
-- IN: 입력모드(해당변수에 어떠한 값을 담아 주겠다) OUT: 출력모드(해당 변수에 담긴 값을 출력한다)
-- varcahr2: 자리수(ex. (20))를 쓰면 안 된다

exec pcd_3('clearj');

create or replace procedure pcd_4
(p_imgfilename     IN varchar2)
is
begin

    for i in 1..50 loop
    
    insert into san_detail_img(fk_prodcode, imgfilename)
     values('123-'||seq_4.nextval, p_imgfilename||i||'.jpg');

    end loop;
    
end pcd_4;
-- p: 파라미터 userid: 변수 
-- IN: 입력모드(해당변수에 어떠한 값을 담아 주겠다) OUT: 출력모드(해당 변수에 담긴 값을 출력한다)
-- varcahr2: 자리수(ex. (20))를 쓰면 안 된다

exec pcd_4('colorj');

commit; 




create sequence seq_2
start with 51
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_3
start with 101
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_4
start with 151
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

drop sequence seq_3;
drop sequence seq_4;

select *
from san_detail_img
order by 1;

delete from san_detail_img;

rollback;

insert into san_detail_img(fk_prodcode, imgfilename)
values('123-201', 'limited1.jpg');

update san_detail_img set fk_prodcode = '123-201'
where imgfilename = 'limited1.jpg';

update san_detail_img set fk_prodcode = '123-202'
where imgfilename = 'limited2.jpg';

insert into san_detail_img(fk_prodcode, imgfilename)
values('123-202', 'limited2.jpg');

select *
from san_wish;

select *
from san_member;

select prodcode, prodname, prodimg, price, saleprice, fk_userid, model 
from 
(select prodcode, prodname, prodimg, price, saleprice
from san_product P, san_category C
where P.fk_cateno = C.cateno
) T, san_wish W
where T.prodcode = W.fk_prodcode;



select *
from san_wish;

select *
from san_product;

select *
from san_category;

select RNO, wishno, fk_prodcode, model 
from(
    select rownum as RNO, wishno, fk_prodcode, model 
    from(
        select wishno, fk_prodcode, model 
        from san_wish
		 where fk_userid = 'parksy' 
        order by wishno
    )W
)F
where F.RNO between 5 and 10;

select RNO, prodcode, prodname, prodimg, cateno, catename, price, saleprice, wishno, fk_userid, model 
from
(
select rownum as RNO, prodcode, prodname, prodimg, cateno, catename, price, saleprice, wishno, fk_userid, model 
from 
(
select prodcode, prodname, prodimg, cateno, catename, price, saleprice, wishno, fk_userid, model 
from 
(select prodcode, prodname, prodimg, cateno, catename, price, saleprice
from san_product P, san_category C
where P.fk_cateno = C.cateno
) T, san_wish W
where T.prodcode = W.fk_prodcode
and fk_userid = 'parksy'
) R
)A
where RNO between 1 and 5;

select count(*) AS CNT 
from san_wish;

select *
from san_product;

select RNO, prodname, prodimg, cateno, price, saleprice
from
(select rownum as RNO, prodname, prodimg, cateno, price, saleprice
from
(select prodname, prodimg, cateno, price, saleprice
from san_product P, san_category C
where P.fk_cateno = c.cateno) R
) T
where RNO between 1 and 9
and 1=1;

 select RNO, prodcode, prodname, prodimg, cateno, price, saleprice
 from
 (select rownum as RNO, prodcode, prodname, prodimg, cateno, price, saleprice
 from
 (select prodcode, prodname, prodimg, cateno, price, saleprice
 from san_product P, san_category C
 where P.fk_cateno = c.cateno) R
 ) T
 where RNO between 1 and 9 





select *
from san_category

select *
from SAN_SHIPMENT;
-- 결제완료 배송준비중 배송중 배송완료

 select RNO, prodcode, prodname, prodimg, cateno, catename, price, saleprice
 from
 (select rownum as RNO, prodcode, prodname, prodimg, cateno, catename, price, saleprice
 from
 (select prodcode, prodname, prodimg, cateno, catename, price, saleprice
 from san_product P, san_category C
 where P.fk_cateno = c.cateno 
  and ( prodname like '%'|| '' || '%' or  catename like '%' || 'HARD' || '%')
) R
 ) T
 where RNO between 1 and 203
 
 select *
 from san_wish;
 
 select ordernum, count(totalprice), sum(totalprice),
 sum(totalprice)/count(totalprice)
from san_order O, san_orderdetail D
where O.ordernum = D.ordernum_fk
group by O.ordernum
order by 1;
 
  select *
 from san_cart
 
 select * from san_member;
 
 -- SEARCH
  select RNO, prodcode, prodname, prodimg, cateno, catename, price, saleprice
 from
 (select rownum as RNO, prodcode, prodname, prodimg, cateno, catename, price, saleprice
 from
 (select count(*)
 from san_product P, san_category C
 where P.fk_cateno = C.cateno
 order by saleprice
 ) R
) T
where RNO between 1 and 5;

select *
from san_wish;

select *
from san_mileage;

select *
from san_member;

select count(*)
 from san_product P, san_category C
 where P.fk_cateno = C.cateno
 and saleprice > 8000;
 
 select RNO, mileageno, fk_userid,mileagePoint,enableUseDay,saveRegisterday,content1,content2  
 from 
   ( 
      select rownum as RNO, mileageno, fk_userid, mileagePoint,enableUseDay,saveRegisterday,content1,content2  
       from san_mileageList 
       where fk_userid = 'parksb'
      
          )V 
             
 where V.RNO between 1 and 3 
order by RNO desc
 
  select * from SAN_product;
  
  select * from tabs;
  
  desc san_member;
  
  select * from san_member;
  
  select * from san_order
  order by 1;
  
  select * from san_orderdetail
  order by 1