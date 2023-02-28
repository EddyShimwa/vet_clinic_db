CREATE TABLE IF NOT EXISTS public.patients
(
    id integer,
    name character varying,
    date_of_birth date,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.medical_histories
(
    id integer,
    admiited_at timestamp with time zone,
    patient_id integer,
    status character varying,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.invoices
(
    id integer,
    total_amount numeric,
    generated_at timestamp with time zone,
    payed_at time with time zone,
    medical_history_id integer,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.invoice_items
(
    id integer,
    unit_price numeric,
    quantity integer,
    total_price numeric,
    invoice_id integer,
    treatment_id integer,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.treatments
(
    id integer,
    type character varying,
    name character varying,
    PRIMARY KEY (id)
);