% Define task/4 as a dynamic predicate
:- dynamic task/4.

% Predicate to create a task
create_task(ID, Description, Assignee) :-
    assertz(task(ID, Description, Assignee, false)),
    format('Task created: ~w~n', [ID]).

% Predicate to assign a task to a new user
assign_task(ID, NewAssignee) :-
    task(ID, Description, _, Status),
    retract(task(ID, Description, _, Status)),
    assertz(task(ID, Description, NewAssignee, Status)),
    format('Task ~w assigned to user: ~w~n', [ID, NewAssignee]).

% Predicate to mark a task as completed
mark_completed(ID) :-
    task(ID, Description, Assignee, _),
    retract(task(ID, Description, Assignee, _)),
    assertz(task(ID, Description, Assignee, true)),
    format('Task ~w marked as completed.~n', [ID]).

% Predicate to display all tasks
display_tasks :-
    task(ID, Description, Assignee, Status),
    format('Task ~w:~n- Description: ~w~n- Assignee: ~w~n- Completion status: ~w~n~n', 
           [ID, Description, Assignee, Status]),
    fail.
display_tasks.

% Predicate to display tasks assigned to a specific user
display_tasks_assigned_to(User) :-
    task(ID, Description, User, Status),
    format('Task ~w:~n- Description: ~w~n- Completion status: ~w~n~n', 
           [ID, Description, Status]),
    fail.
display_tasks_assigned_to(_).

% Predicate to display completed tasks
display_completed_tasks :-
    task(ID, Description, Assignee, true),
    format('Task ~w:~n- Description: ~w~n- Assignee: ~w~n~n', 
           [ID, Description, Assignee]),
    fail.
display_completed_tasks.
