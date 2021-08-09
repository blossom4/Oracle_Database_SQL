-- String Function

-- 1. Uppercase to Lowercase.
select lower('ABcdEFg')
from dual;

-- 2. Get ename to lowercase.
select lower(ename)
from emp;

-- 3. Lowercase to Uppercase.
select upper('ABcdEFg')
from dual;

-- 4. First letter to uppercase, last letters to lowercase.
select initcap('abcde')
from dual;

-- 5. Get ename first letter to uppercase, last letters to lowercase.
select initcap(ename)
from emp;

-- 6. Combine String.
select concat('abc', 'defg')
from dual;

-- 7. Get ename and job like this. employee's name is 'ename', job is 'job'.
select concat(concat(concat('Employee''s name is ', ename), ', job is '), job)
from emp;

select 'Employee''s name is ' || ename || ', job is ' || job
from emp;

-- 8. Get length of string.
-- lengthb: length of byte
select length('abcd'), lengthb('abcd')
from dual;

-- 9. Cut the string.
-- substrb: cut the string by byte
-- substr(string, from start index, to end index)
select substr('abcd', 3), substrb('abcd', 3)
from dual;

select substr('abcdefghi', 3, 4)
from dual;

-- 10. Find the string.
-- instr: return first place of letter
-- instr(string, start index, nth)
select instr('abcdedede', 'de'), instr('abcdedede', 'de', 4, 3)
from dual;

-- 11. Get ename which alphabet 'A' comes after second letter.
select ename
from emp
where instr(ename, 'A') >= 2;

-- 12. Fill with specific string.
-- lpad(string, length from left, fill remain space element)
select lpad('STRING', 10, 1), rpad('STRING', 3)
from dual;

-- 13. Remove space.
select trim('   String   '), ltrim('   String   '), rtrim('   String   ')
from dual;

-- 14. Change string.
-- replace(string, from, to)
select replace('abcdefg', 'abc'), replace('abcdefg', 'abc', 'kkk')
from dual;
