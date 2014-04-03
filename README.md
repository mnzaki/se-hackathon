SE-Hackathon
============

## Concept, so far
The hackathon controllers/managers outline a project and break it down into
tasks. Tasks are grouped into categories/modules. A task is rated based on
difficulty and can have pre-requisites (a set of tasks that must be completed
before it is available for claiming). A task is related to a set of tests that
must succeed in order for the task to be submitted for review.

Each participant ('hacker') will start by looking through the tasks and claiming one/many
(depending on the rules of the hackathon, time limits, etc). The hacker will
then work on the task, run the tests, and once satisfied submit the task for
review.

Completed tasks award points based on difficult and depth/size.

Achievements regarding the nature/amount of completed tasks can also be awarded.

## Execution
A project is backed by a github repository. A branch is automatically created
for each task and will contain the set of tests for the task. Upon claiming a
task, the hacker is instructed to pull the appropriate branch and begin
working on it. They are also instructed/reminded how to run the tests and which
tests are relevant to the task claimed.

Once work on a task is complete, the branch is pushed and a review request is
made through the system. The system will run a few automated checks first, for
instance: the branch must not include changes to any files except those related
to the task, the tests must run successfully, the branch must be mergeable with
the current master (which should be trivial given proper project and task break
down), etc. The system will then create a github issue and notify the
appropriate people. The task is now in review state. The system will
automatically close the task and award points once the issue is closed and
merged.

## Miscellany
A scoreboard for live projection at the hackathon event can be used to see the
top performers, recent points claimed, and even an overview of recent github
comments or a common chatroom, etc.

## Problems
Task dependencies might stop the whole hackathon from succeeding if the project
is not broken down appropriately. A good break down would be a forest of trees
with limited depth. Having a project with a 100 tasks and only 2 or 3 roots is a
recipe for disaster.

Tasks may need to have time limits and/or a process for handling completion
failure, again to avoid stalling the hackathon due to dependencies.

## More Problems
Yes.
