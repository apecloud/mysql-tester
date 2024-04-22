########################################################
# Basic syntax test for the wesql_scale_filter

create filter if not exists (
        name='test1',
        desc='test description',
        priority='999',
        status='ACTIVE'
)
with_pattern(
        plans='Delete',
        fully_qualified_table_names='wesql_scale_filter.t1',
        query_regex='',
        query_template='',
        request_ip_regex='',
        user_regex='',
        leading_comment_regex='',
        trailing_comment_regex='',
        bind_var_conds=''
)
execute(
        action='FAIL',
        action_args=''
);

select
    id,name,description,priority,status,plans,fully_qualified_table_names,query_regex,query_template,request_ip_regex,user_regex,leading_comment_regex,trailing_comment_regex,bind_var_conds,action,action_args
from
    mysql.wescale_plugin;

use wesql_scale_filter;
create table if not exists wesql_scale_filter.t1 (
                                                     id int,
                                                     name varchar(32)
);
insert into wesql_scale_filter.t1 values (1, 'a');
select * from wesql_scale_filter.t1;
delete from wesql_scale_filter.t1 where id = 1;

alter filter test1 (
        name='test2',
        desc='test description',
        priority='998',
        status='ACTIVE'
)
with_pattern(
        plans='Delete',
        fully_qualified_table_names='wesql_scale_filter.t1',
        query_regex='',
        query_template='',
        request_ip_regex='',
        user_regex='',
        leading_comment_regex='',
        trailing_comment_regex='',
        bind_var_conds=''
)
execute(
        action='FAIL',
        action_args=''
);

select
    id,name,description,priority,status,plans,fully_qualified_table_names,query_regex,query_template,request_ip_regex,user_regex,leading_comment_regex,trailing_comment_regex,bind_var_conds,action,action_args
from
    mysql.wescale_plugin;

drop filter test2;

########################################################
# TODO Test ConcurrencyControlAction