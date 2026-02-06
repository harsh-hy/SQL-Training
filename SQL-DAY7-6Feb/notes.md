
---------- SQL – Performance & Concept Notes ----------

 1. Improving SQL Performance

* Retrieve only the **required page size** (avoid fetching unnecessary rows).
* Use **pagination** to limit the number of records returned per request.

  * Pagination helps reduce load time and memory usage.
  * Commonly implemented using `OFFSET` and `FETCH` or `ROW_NUMBER()`.

---

 2. Views

* **Views** help improve performance by:

  * Removing unnecessary columns and rows.
  * Simplifying complex queries.
* **Best Practice:**

  * Maintain **4–6 views per table** (avoid excessive views).
* Views can be:

  * **Static** (preferred for maintainability).
  * **Dynamic** (possible but not recommended unless necessary).

---

 3. Pagination

* Pagination means **fetching data in chunks instead of all at once**.
* Often implemented by:

  * Creating a **Serial Number / Row Number column**.
  * Using `ROW_NUMBER()` with `ORDER BY`.

---

 4. Indexes

* **Indexes** improve query performance by speeding up data retrieval.
* Should be created on:

  * Frequently searched columns.
  * Columns used in `WHERE`, `JOIN`, and `ORDER BY` clauses.
* Over-indexing can hurt performance (slower inserts/updates).

---

 5. Cursors

* Cursors process data **row by row**.
* Useful when:

  * Different logic must be applied to different rows.
* Types:

  * Fast-forward, Read-only (best for performance).
* **Important Points:**

  * Must be **CLOSED and DEALLOCATED** after use.
  * Consume **program memory**.
  * Poor performance for large datasets.
* Use **transactions** to ensure **atomicity** when required.


 6. Temporary Tables

* Temporary tables store **intermediate results**.
* Useful for:

  * Complex calculations.
  * Breaking large queries into smaller steps.
* Automatically removed when the session ends.

------------------------------------------------------

Normalization:
1NF : Eliminate repeating groups; make sure each field contains only atomic values.
      For Example : Instead of having a column for multiple phone numbers, create separate rows for each phone number.
2NF : Remove partial dependencies; ensure all non-key attributes depend on the whole primary key.
      For Example : In a table with a composite primary key (e.g., OrderID, ProductID), ensure that non-key attributes (e.g., Quantity) depend on both OrderID and ProductID, not just one of them.
3NF : Remove transitive dependencies; ensure non-key attributes depend only on the primary key.
      For Example : If a table has columns for EmployeeID, DepartmentID, and DepartmentName, ensure that DepartmentName depends only on DepartmentID, not on EmployeeID.
BCNF : A stronger version of 3NF; for every functional dependency X -> Y, X should be a super key.
      For Example : In a table with columns for StudentID, CourseID, and InstructorID, if InstructorID determines CourseID, then InstructorID must be a super key.