select cast(m7student.onecf.name as varchar(35)) name, cast(m7student.twocf.age as integer) age, cast(m7student.threecf.gpa as decimal(4,2)) gpa, cast(m7voter.twocf.registration as varchar(20)) registration from m7student full outer join m7voter on (m7student.onecf.name = m7voter.onecf.name) where cast(m7student.twocf.age as integer) < 25;
