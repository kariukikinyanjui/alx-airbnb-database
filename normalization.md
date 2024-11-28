# Normalization to 3NF

## Overview
Normalization is the process of organizing database structure to minimize redundancy and dependency. The goal is to ensure that each table is efficient and maintains data integrity.

---

## Steps to Achieve 3NF

### 1. First Normal Form `1NF`
**Requirements:**
- All attributes must contain indivisible(atomic) values.
- Repeating groups or multivalued attributes must be eliminated.

**Findings:**
-The schema satisfies `1NF` as all attributes are atomic and there are no repeating groups.

---

## 2. Second Normal Form `2NF`
**Requirements:**
- The schema must be in `1NF`
- Partial dependencies (attributes depending on part of a composite key) must be eliminated.

**Findings:**
- No tables have composite primary keys.
- All non-key attributes depend entirely on their respective primary key.


---

### 3. Third Normal Form `3NF`
**Requirements:**
- The schema must be in `2NF`.
- Transitive dependencies (non-prime attributes depending on other non-prime attributes) must be eliminated.

**Findings:**
- No transitive dependencies exist in the schema.
- All non-prime attributes depend solely on their respective primary key.

---

## Conclusion
The database schema privided satisfies `1NF`, `2NF`, and `3NF`. No further adjustments were required as there are no redundancies or violations of normalization principles.

## Schema Compliance Summary
| Table     | Normal Form | Notes
|-----------|-------------|----------------------------------------------------|
| User      | `3NF`       | All attributes depend solely on `user_id`.         |
| Property  | `3NF`       | All attributes depend solely on `property_id`.     |
| Booking   | `3NF`       | All attributes depend solely on `booking_id`.      |
| Payment   | `3NF`       | All attributes depend solely on `payment_id`.      |
| Review    | `3NF`       | All attributes depend solely on `review_id`.       |
| Message   | `3NF`       | All attributes depend solely on `message_id`.      |
|-----------|-------------|----------------------------------------------------|

