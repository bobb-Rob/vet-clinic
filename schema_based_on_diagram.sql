CREATE TABLE patients {
 id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(100),
 date_of_birth
}

CREATE TABLE medical_histories (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  admitted_at timestamp,
  patient_id INT, 
  status VARCHAR,
  FOREIGN KEY (patient_id) REFERENCES patients (id) ON DELETE CASCADE,
);

CREATE TABLE invoices (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL(2,12),
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id) ON DELETE CASCADE,
);

