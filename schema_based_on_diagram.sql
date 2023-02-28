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

-- Drop existing foreign key constraint
ALTER TABLE IF EXISTS public.medical_histories_treatments
    DROP CONSTRAINT IF EXISTS medical_history_id_fk;

-- Create foreign key constraint
ALTER TABLE IF EXISTS public.medical_histories_treatments
    ADD CONSTRAINT medical_history_id_fk FOREIGN KEY (medical_history_id)
    REFERENCES public.medical_histories (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.medical_histories
    ADD CONSTRAINT patient_id FOREIGN KEY (patient_id)
    REFERENCES public.patients (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
ALTER TABLE IF EXISTS public.medical_histories
    ADD FOREIGN KEY (id)
    REFERENCES public.treatments (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
ALTER TABLE IF EXISTS public.invoices
    ADD CONSTRAINT medical_history_id FOREIGN KEY (medical_history_id)
    REFERENCES public.medical_histories (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
ALTER TABLE IF EXISTS public.invoice_items
    ADD CONSTRAINT invoice_id FOREIGN KEY (invoice_id)
    REFERENCES public.invoices (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
ALTER TABLE IF EXISTS public.invoice_items
    ADD CONSTRAINT treatment_id FOREIGN KEY (treatment_id)
    REFERENCES public.treatments (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
ALTER TABLE IF EXISTS public.treatments
    ADD FOREIGN KEY (id)
    REFERENCES public.medical_histories (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

CREATE INDEX IF NOT EXISTS idx_medical_history_id ON public.medical_histories_treatments (medical_history_id);
CREATE INDEX IF NOT EXISTS idx_treatment_id ON public.medical_histories_treatments (treatment_id);








