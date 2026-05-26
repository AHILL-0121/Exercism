update yacht
set result =
    (
        with split(value, rest) as (
            select
                substr(dice_results, 1, instr(dice_results || ',', ',') - 1) as value,
                substr(dice_results, instr(dice_results || ',', ',') + 1) AS rest
            where value is not null and value <> ''
            union all
            select
                substr(rest, 1, instr(rest || ',', ',') - 1),
                substr(rest, instr(rest || ',', ',') + 1)
            from split
            where rest is not null and rest <> ''
        ), numbers as (
            select cast(value as int) n
            from split
        )
        select case category
            when 'yacht' then iif((select count(distinct n) from numbers)=1, 50, 0)
            when 'ones' then (select count(1) from numbers where n=1)
            when 'twos' then (select count(1) from numbers where n=2) * 2
            when 'threes' then (select count(1) from numbers where n=3) * 3
            when 'fours' then (select count(1) from numbers where n=4) * 4
            when 'fives' then (select count(1) from numbers where n=5) * 5
            when 'sixes' then (select count(1) from numbers where n=6) * 6
            when 'full house' then
                iif((select count(distinct n) from numbers)=2 and
                    (select count(1) from numbers group by n order by count(1) desc limit 1)=3,
                    (select sum(n) from numbers), 0
                )
            when 'four of a kind' then
                iif((select count(distinct n) from numbers)<=2 and
                    (select count(1) from numbers group by n order by count(1) desc limit 1)>=4,
                    (select n from numbers group by n order by count(1) desc limit 1) * 4, 0
                )
            when 'little straight' then
                iif((select count(distinct n) from numbers)=5 and
                    (select min(n)=1 and max(n)=5 from numbers),
                    30, 0
                )
            when 'big straight' then
                iif((select count(distinct n) from numbers)=5 and
                    (select min(n)=2 and max(n)=6 from numbers),
                    30, 0
                )
            when 'choice' then (select sum(n) from numbers)
            end
    );