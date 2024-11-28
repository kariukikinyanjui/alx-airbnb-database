# Requirements for Creating an ERD Diagram

## Overview
An Entity-Relationship Diagram (ERD) visually represents the structure of a database, showcasing the entities within the system, their attributes, and the relationships between them. Creating an ERD is a critical step in the database design process, ensuring that data is stored and accessed efficiently and accurately.

---

## Objectives
* Define the entities that will be part of the system.
* Determine the attributes for each entity.
* Establish the relationships between entities.
* Identify the cardinality and participation constraints for each relationship.
* Ensure consistency with business logic and use cases.

---

## Requirements
### 1. Entities
Entities represent objects or concepts that are stored in the database. They should be clearly defined based on the business requirements and system needs.
    * **List of Entities:** Define all the entities required for the system (e.g., `User`, `Property`, `Payment`, etc.).
    * **Attributes:** Each entity should have relevant attributes (e.g., `User` entity might have `user_id`, `email`, `password`, etc.).
    * **Primary Key:** For each entity, define a unique identifier (primary key) that ensures each record is uniquely identifiable.

### 2. Relationsihps
Relationships describe how entities are associated with one another.
    * **Relationship Types:** Identify the types of relationships between entities (e.g., One-to-One, One-to-Many, Many-to-Many).
    * **Cardinality:** Determine the cardinality for each relationship, specifying how many instances of one entity are related to instances of another(e.g., One `User` can place many `Orders`).
    * **Participation:** Define whether the participation of an entity in a relationship is optional or mandatory.

### 3. Attributes of Relationships
Some relationships may have additional attributes. For example, a `Payment` relationship might contain attributes such as `payment_amount` and `payment_date`.

### 4. Normalization
Ensure the ERD follows normalization principles to minimize redundancy and avoid data anomalies. This process includes:
    * **1NF (First Normal Form):** Ensuring that all attributes contain atomic values.
    * **2NF (Second Normal Form):** Ensuring no partial dependencies of attributes on the primary kye.
    * **3NF (Third Normal Form):** Ensuring no transitive dependencies.

### 5. Constraints
Identify any constraints or rules that the data must comply with. Examples of constraints include:
    * **Uniqueness:** Ensure that specifies attributes (e.g., `email` for `User`) are unique across the system.
    * **Not Null:** Specify which attributes must always have a value(e.g., `order_date` for `Order`).

## Process

---

1. **Identity Entities and Relationships:** Review the business requirements to identify the core entities and their relationships.
2. **Define Attributes:** List all attributes for each entity.
3. **Map Relationships:** Draw relationships between entities and define cardinality and participation constraints.
4. **Normalization:** Apply normalization rules to ensure that schema design is efficient and scalable.
5. **Create the ERD:** Use diagramming software to draw the ERD.
6. **Review and iterate:** Ensure all relationships are correct and complete.
