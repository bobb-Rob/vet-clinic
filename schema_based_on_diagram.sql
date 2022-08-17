CREATE TABLE patients (
 id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(100),
 date_of_birth DATE
);

CREATE TABLE medical_histories (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  admitted_at timestamp NOT NULL,
  patient_id INT, 
  status VARCHAR NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients (id) ON DELETE CASCADE
);

CREATE TABLE treatments (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  type VARCHAR,
  name VARCHAR NOT NULL
);

CREATE TABLE treatments_medical_histories (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  treatment_id INT NOT NULL,  
  medical_history_id INT NOT NULL,  
  FOREIGN KEY (treatment_id) REFERENCES treatments (id) ON DELETE CASCADE,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id) ON DELETE CASCADE
);

CREATE TABLE invoices (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL NOT NULL,
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id) ON DELETE CASCADE
);

CREATE TABLE invoice_items (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT NOT NULL,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  FOREIGN KEY (treatment_id) REFERENCES treatments (id) ON DELETE CASCADE,
  FOREIGN KEY (invoice_id) REFERENCES invoices (id) ON DELETE CASCADE
);
