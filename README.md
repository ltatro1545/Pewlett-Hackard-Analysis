# Pewlett Hackard Analysis Using Postgres
## Purpose
Pewlett Hackard is on the verge of experiencing a "silver tsunami", or mass retirement. They have been using only Microsoft Excel and Visual Basic for Applications for decades, and would benefit from using structured query language to find and filter the data they need. They offer a retirement package to employees that meet a set criteria and now require an analysis on current versus retiring employees. In response to this crisis, they have created a mentorship program that requires a set standard for employees to participate in. Their hope is that the mentorship program will allow the participants to replace the retiring employees.

## Results
### Retirement Eligibility
The results of the analysis tell us the initial queries were not executed properly, specifically when determining who is eligible for retirement. It appears the retirement eligibility table included employees that were no longer active with the company. The following code is what is used to determine such results.

![Retirement_eligibility](https://user-images.githubusercontent.com/92493572/144926723-abc21295-3929-478b-9e03-5fa73687523e.png)

Notice the conditional statements do not filter for current employees at all. This would be done by joining a table into the query that has the employees to_date (works like an 'employed until date'), and then filtering for to_date's that are "9999-01-01", meaning they are currently employed.

The number of employees grouped by title that are eligible for retirement are:

![RetireByTitle](https://user-images.githubusercontent.com/92493572/144927377-b5bb4ad5-ddb6-4caf-81de-59e485aab0af.png)

The number of current employees by title are:

![CurrentEmpTitle](https://user-images.githubusercontent.com/92493572/144927696-6049f725-5034-4e1c-9a7a-4ceac25eb99b.png)

Although the titles do not fall in the same order as the previous table, upon further examination a major flaw as well as other concerns become apparent:
  - There are more senior engineers eligible for retirement than there are senior engineers currently employed.
  - Many other positions have over a third of their current employment eligible for retirement.

### Mentorship Eligiblity
With such a high percentage of retirement eligiblity, the mentorship will theoretically move many employees into those positions that need to be filled. Workers will be promoted into new positions, thus their former positions will require staffing. 

The number of employees by title that are eligible for mentorship are:

![MentorshipEligible](https://user-images.githubusercontent.com/92493572/144928524-b2a3e71d-fda6-4248-8024-dd5c3f70ffa6.png)

The number of mentorship eligible employees is staggeringly small and unable to meet Pewlett Hackard's needs. In response to these reults, Pewlett Hackard has two main options:
  - Hire more senior positions from outside the company.
  - Expand the mentoship program to be more inclusive of current employees.

Hiring senior positions from outside the company is a time consuming task, as you must assess not only their credentials and their skills, but assure they will be a good fit for the company. Expanding the mentorship program could be as simple as loosening the birth date restriction, as it currently only takes in employees that are born in the year 1965. If Pewlett Hackard were to stretch the restriction to a five year span, they will acquire many more skilled mentees to fill the senior positions.

## Summary
Additional queries were performed to provide the above images, in which the code can be found within the queries folder of this repository. 

A visualization was created apart from the required deliverables to provide insight into the current state of Pewlett Hackard. It must be stressed that the y-axis is intentionally broken as to encapsulate the data with numbers below 600. Therefore, the visualization is not drawn to scale. As a separate reminder, the module provided incorrect query language that resulted in more senior engineers retiring than currently employed - this is apparent in the chart.

![Retirement_Mentorship_Chart](https://user-images.githubusercontent.com/92493572/144930452-8d87cea9-3989-4ce9-be82-a7bdb374b6d5.png)

Within the chart, the mentorship bars (shown in green) do not even reach 600, whereas the upper half of the chart has much of its data in the 600 to 90,000 range, excluding manager roles.

The simple conclusion to draw from this is that Pewlett Hackard, given current eligiblity standards, is unable to fill the gaps left behind by the mass retirement. If they were to stick with these standards, they would need to hire about 88,600 employees in dominantly senior positions. If they chose to broaden the prerequisites to become a mentee, they could fill the senior positions as needed, while hiring 88,600 more entry-level positions.
