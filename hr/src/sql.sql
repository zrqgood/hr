CREATE TABLE tb_cj(
	id INT PRIMARY KEY  NOT NULL,
	cj_title VARCHAR(50) NOT NULL,
	cj_type CHAR(1) NOT NULL,
	cj_content TEXT NOT NULL,
	cj_money VARCHAR(50) NULL,
	cj_time VARCHAR(50) NOT NULL)
	
	
	CREATE TABLE tb_department(
	id INT PRIMARY KEY   NOT NULL,
	dt_name CHAR(10) NULL,
	dt_createTime VARCHAR(20) NULL,
	dt_bz VARCHAR(50) NULL
)


CREATE TABLE tb_employee(
	id INT PRIMARY KEY  NOT NULL,
	em_serialNumber VARCHAR(30) NOT NULL,
	em_name CHAR(10) NOT NULL,
	em_sex CHAR(2) NOT NULL,
	em_age INT NOT NULL,
	em_IDCard VARCHAR(30) NOT NULL,
	em_born VARCHAR(50) NOT NULL,
	em_nation CHAR(10) NOT NULL,
	em_marriage CHAR(10) NOT NULL,
	em_visage CHAR(10) NULL,
	em_ancestralHome CHAR(30) NULL,
	em_tel VARCHAR(50) NULL,
	em_address VARCHAR(50) NULL,
	em_afterSchool VARCHAR(50) NULL,
	em_speciality VARCHAR(50) NULL,
	em_culture CHAR(10) NULL,
	em_startime CHAR(30) NULL,
	em_departmentId INT NOT NULL,
	em_typeWork CHAR(10) NULL,
	em_creatime VARCHAR(50) NULL,
	em_createName CHAR(30) NULL,
	em_bz VARCHAR(50) NULL

) 



CREATE TABLE tb_initeJob(
		id INT PRIMARY KEY  NOT NULL,
		NAME CHAR(10) NULL,
		sex CHAR(10) NULL,
		age INT NULL,
		born VARCHAR(50) NULL,
		job VARCHAR(50) NULL,
		specialty VARCHAR(50) NULL,
		experience CHAR(10) NULL,
		teachSchool VARCHAR(30) NULL,
		afterSchool VARCHAR(50) NULL,
		tel VARCHAR(50) NULL,
		address VARCHAR(50) NULL,
		createtime VARCHAR(50) NULL,
		content TEXT NULL,
		isstock BIT NOT NULL
	) 
	
	
CREATE TABLE tb_manager(
		id INT  PRIMARY KEY  NOT NULL,
		account VARCHAR(20) NOT NULL,
		PASSWORD VARCHAR(30) NOT NULL,
		managerLevel CHAR(10) NOT NULL
	) 
	
	CREATE TABLE tb_pay(
		id INT PRIMARY KEY  NOT NULL,
		pay_emNumber VARCHAR(30) NOT NULL,
		pay_emName CHAR(10) NOT NULL,
		pay_month VARCHAR(50) NOT NULL,
		pay_baseMoney INT NOT NULL,
		pay_overtime INT NOT NULL,
		pay_age INT NOT NULL,
		pay_check VARCHAR(20) NOT NULL,
		pay_absent VARCHAR(20) NOT NULL,
		pay_safety VARCHAR(20) NOT NULL
	
	) 
	
	CREATE TABLE tb_train(
		id INT PRIMARY KEY NOT NULL,
		tn_man CHAR(10) NULL,
		tn_title VARCHAR(50) NULL,
		tn_content VARCHAR(50) NULL,
		tn_time CHAR(30) NULL,
		tn_address CHAR(30) NULL,
		tn_join VARCHAR(50) NULL,
		tn_bz TEXT NULL
	) 



	


