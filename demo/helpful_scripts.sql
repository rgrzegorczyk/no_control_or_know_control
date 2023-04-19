  select object_name, 
     object_type
from user_objects
order by object_type, object_name;


select * from databasechangelog
order by dateexecuted desc;


select * from databasechangelog_actions;
