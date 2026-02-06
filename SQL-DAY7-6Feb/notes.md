
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




# 📘 Database Normalization

**Normalization** is the process of organizing data in a database to:

* Reduce data redundancy
* Improve data integrity
* Eliminate update, insert, and delete anomalies

---

## 1️⃣ First Normal Form (1NF)

### Definition

* Eliminate **repeating groups**
* Each field must contain **atomic (indivisible) values**
* Each record must be uniquely identifiable

### Rules

* No multi-valued attributes
* No repeating columns
* Use a primary key

### ❌ Unnormalized Table

| StudentID | Name | PhoneNumbers |
| --------- | ---- | ------------ |
| 1         | John | 9876, 8765   |

### ✅ 1NF Table

| StudentID | Name | PhoneNumber |
| --------- | ---- | ----------- |
| 1         | John | 9876        |
| 1         | John | 8765        |

---

## 2️⃣ Second Normal Form (2NF)

### Definition

* Table must be in **1NF**
* Remove **partial dependency**
* All non-key attributes must depend on the **entire primary key**

### Partial Dependency

Occurs when a non-key attribute depends on **part of a composite key**.

### ❌ 2NF Violation

**Primary Key:** (StudentID, CourseID)

| StudentID | CourseID | StudentName | CourseName |
| --------- | -------- | ----------- | ---------- |
| 1         | C1       | John        | Math       |

* `StudentName` depends only on `StudentID`
* `CourseName` depends only on `CourseID`

### ✅ 2NF Tables

**Student Table**

| StudentID | StudentName |
| --------- | ----------- |
| 1         | John        |

**Course Table**

| CourseID | CourseName |
| -------- | ---------- |
| C1       | Math       |

**Enrollment Table**

| StudentID | CourseID |
| --------- | -------- |

---

## 3️⃣ Third Normal Form (3NF)

### Definition

* Table must be in **2NF**
* Remove **transitive dependency**
* Non-key attributes should depend **only on the primary key**

### Transitive Dependency

Occurs when:

```
A → B and B → C
```

So, `A → C` indirectly.

### ❌ 3NF Violation

| EmpID | EmpName | DeptID | DeptName |
| ----- | ------- | ------ | -------- |

* `EmpID → DeptID`
* `DeptID → DeptName`
* `DeptName` depends **indirectly** on `EmpID`

### ✅ 3NF Tables

**Employee Table**

| EmpID | EmpName | DeptID |
| ----- | ------- | ------ |

**Department Table**

| DeptID | DeptName |
| ------ | -------- |

---

## 4️⃣ Boyce–Codd Normal Form (BCNF)

### Definition

* A stronger version of **3NF**
* For every functional dependency `X → Y`, **X must be a super key**

### ❌ BCNF Violation

| Student | Subject | Professor |
| ------- | ------- | --------- |

**Functional Dependencies**

* Student → Subject
* Subject → Professor

👉 `Subject` is **not a super key**, so BCNF is violated.

### ✅ BCNF Decomposition

**Subject Table**

| Subject | Professor |
| ------- | --------- |

**Enrollment Table**

| Student | Subject |
| ------- | ------- |

---

## 🧠 Quick Summary Table

| Normal Form | Main Focus                      |
| ----------- | ------------------------------- |
| 1NF         | Atomic values                   |
| 2NF         | No partial dependency           |
| 3NF         | No transitive dependency        |
| BCNF        | Determinant must be a super key |

---

## 🎯 Interview One-Liner

> **Normalization reduces redundancy and improves data consistency by organizing data into well-structured tables.**

---

If you want, I can:

* Add **4NF & 5NF**
* Convert this into **1-page revision notes**
* Add **real-world SQL examples**

Just tell me 👍
