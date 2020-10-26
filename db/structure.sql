SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    address_line_1 character varying(80),
    address_line_2 character varying(80),
    city character varying(30),
    country_region character varying(2),
    zip_postal_code character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    addressable_type character varying NOT NULL,
    addressable_id bigint NOT NULL,
    state_province_id bigint NOT NULL
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: diamond_clarities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.diamond_clarities (
    id bigint NOT NULL,
    grade character varying(4) NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: diamond_clarities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.diamond_clarities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: diamond_clarities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.diamond_clarities_id_seq OWNED BY public.diamond_clarities.id;


--
-- Name: diamond_colors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.diamond_colors (
    id bigint NOT NULL,
    grade character varying(1) NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: diamond_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.diamond_colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: diamond_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.diamond_colors_id_seq OWNED BY public.diamond_colors.id;


--
-- Name: diamond_cuts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.diamond_cuts (
    id bigint NOT NULL,
    grade character varying(9) NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: diamond_cuts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.diamond_cuts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: diamond_cuts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.diamond_cuts_id_seq OWNED BY public.diamond_cuts.id;


--
-- Name: diamond_grades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.diamond_grades (
    id bigint NOT NULL,
    diamond_cut_id bigint NOT NULL,
    diamond_color_id bigint NOT NULL,
    diamond_clarity_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: diamond_grades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.diamond_grades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: diamond_grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.diamond_grades_id_seq OWNED BY public.diamond_grades.id;


--
-- Name: email_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_addresses (
    id bigint NOT NULL,
    email_address character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    emailable_type character varying NOT NULL,
    emailable_id bigint NOT NULL
);


--
-- Name: email_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_addresses_id_seq OWNED BY public.email_addresses.id;


--
-- Name: gemstone_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gemstone_categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: gemstone_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.gemstone_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gemstone_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.gemstone_categories_id_seq OWNED BY public.gemstone_categories.id;


--
-- Name: gemstone_subcategories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gemstone_subcategories (
    id bigint NOT NULL,
    name character varying(40),
    gemstone_category_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: gemstone_subcategories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.gemstone_subcategories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gemstone_subcategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.gemstone_subcategories_id_seq OWNED BY public.gemstone_subcategories.id;


--
-- Name: households; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.households (
    id bigint NOT NULL,
    household_name character varying(40),
    anniversary date,
    addresses_type character varying,
    addresses_id bigint,
    email_address_type character varying,
    email_address_id bigint,
    phone_numbers_type character varying,
    phone_numbers_id bigint
);


--
-- Name: households_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.households_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: households_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.households_id_seq OWNED BY public.households.id;


--
-- Name: parties; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parties (
    id bigint NOT NULL,
    party_type character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    actable_id integer,
    actable_type character varying
);


--
-- Name: parties_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parties_id_seq OWNED BY public.parties.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.people (
    id bigint NOT NULL,
    title character varying(20),
    first_name character varying(40),
    last_name character varying(40),
    suffix character varying(20),
    ring_size numeric(4,2),
    ring_size_notes text,
    necklace_length numeric(4,2),
    necklace_length_notes text,
    birthday date,
    household_id bigint
);


--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;


--
-- Name: phone_numbers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.phone_numbers (
    id bigint NOT NULL,
    phone_number character varying(32),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    phoneable_type character varying NOT NULL,
    phoneable_id bigint NOT NULL
);


--
-- Name: phone_numbers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.phone_numbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: phone_numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.phone_numbers_id_seq OWNED BY public.phone_numbers.id;


--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_categories (
    id bigint NOT NULL,
    name character varying(40),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_categories_id_seq OWNED BY public.product_categories.id;


--
-- Name: product_styles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_styles (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: product_styles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_styles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_styles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_styles_id_seq OWNED BY public.product_styles.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name character varying(40) NOT NULL,
    cost_cents integer DEFAULT 0 NOT NULL,
    cost_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    price_cents integer DEFAULT 0 NOT NULL,
    price_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    product_category_id bigint NOT NULL,
    notes text,
    product_style_id bigint NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sources (
    id bigint NOT NULL,
    code character varying(1) NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: sources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sources_id_seq OWNED BY public.sources.id;


--
-- Name: state_provinces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.state_provinces (
    id bigint NOT NULL,
    code character varying(2),
    name character varying(40),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: state_provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.state_provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: state_provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.state_provinces_id_seq OWNED BY public.state_provinces.id;


--
-- Name: store_transaction_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.store_transaction_categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: store_transaction_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.store_transaction_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: store_transaction_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.store_transaction_categories_id_seq OWNED BY public.store_transaction_categories.id;


--
-- Name: store_transaction_line_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.store_transaction_line_items (
    id bigint NOT NULL,
    store_transaction_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    price_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    tax_cents integer DEFAULT 0 NOT NULL,
    tax_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    discount_cents integer DEFAULT 0 NOT NULL,
    discount_currency character varying DEFAULT 'USD'::character varying NOT NULL
);


--
-- Name: store_transaction_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.store_transaction_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: store_transaction_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.store_transaction_line_items_id_seq OWNED BY public.store_transaction_line_items.id;


--
-- Name: store_transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.store_transactions (
    id bigint NOT NULL,
    party_id bigint NOT NULL,
    transaction_datetime timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    store_transaction_category_id bigint NOT NULL
);


--
-- Name: store_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.store_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: store_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.store_transactions_id_seq OWNED BY public.store_transactions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: diamond_clarities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diamond_clarities ALTER COLUMN id SET DEFAULT nextval('public.diamond_clarities_id_seq'::regclass);


--
-- Name: diamond_colors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diamond_colors ALTER COLUMN id SET DEFAULT nextval('public.diamond_colors_id_seq'::regclass);


--
-- Name: diamond_cuts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diamond_cuts ALTER COLUMN id SET DEFAULT nextval('public.diamond_cuts_id_seq'::regclass);


--
-- Name: diamond_grades id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diamond_grades ALTER COLUMN id SET DEFAULT nextval('public.diamond_grades_id_seq'::regclass);


--
-- Name: email_addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_addresses ALTER COLUMN id SET DEFAULT nextval('public.email_addresses_id_seq'::regclass);


--
-- Name: gemstone_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gemstone_categories ALTER COLUMN id SET DEFAULT nextval('public.gemstone_categories_id_seq'::regclass);


--
-- Name: gemstone_subcategories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gemstone_subcategories ALTER COLUMN id SET DEFAULT nextval('public.gemstone_subcategories_id_seq'::regclass);


--
-- Name: households id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.households ALTER COLUMN id SET DEFAULT nextval('public.households_id_seq'::regclass);


--
-- Name: parties id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parties ALTER COLUMN id SET DEFAULT nextval('public.parties_id_seq'::regclass);


--
-- Name: people id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);


--
-- Name: phone_numbers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone_numbers ALTER COLUMN id SET DEFAULT nextval('public.phone_numbers_id_seq'::regclass);


--
-- Name: product_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_categories_id_seq'::regclass);


--
-- Name: product_styles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_styles ALTER COLUMN id SET DEFAULT nextval('public.product_styles_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: sources id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sources ALTER COLUMN id SET DEFAULT nextval('public.sources_id_seq'::regclass);


--
-- Name: state_provinces id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.state_provinces ALTER COLUMN id SET DEFAULT nextval('public.state_provinces_id_seq'::regclass);


--
-- Name: store_transaction_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_transaction_categories ALTER COLUMN id SET DEFAULT nextval('public.store_transaction_categories_id_seq'::regclass);


--
-- Name: store_transaction_line_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_transaction_line_items ALTER COLUMN id SET DEFAULT nextval('public.store_transaction_line_items_id_seq'::regclass);


--
-- Name: store_transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_transactions ALTER COLUMN id SET DEFAULT nextval('public.store_transactions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: diamond_clarities diamond_clarities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diamond_clarities
    ADD CONSTRAINT diamond_clarities_pkey PRIMARY KEY (id);


--
-- Name: diamond_colors diamond_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diamond_colors
    ADD CONSTRAINT diamond_colors_pkey PRIMARY KEY (id);


--
-- Name: diamond_cuts diamond_cuts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diamond_cuts
    ADD CONSTRAINT diamond_cuts_pkey PRIMARY KEY (id);


--
-- Name: diamond_grades diamond_grades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diamond_grades
    ADD CONSTRAINT diamond_grades_pkey PRIMARY KEY (id);


--
-- Name: email_addresses email_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_addresses
    ADD CONSTRAINT email_addresses_pkey PRIMARY KEY (id);


--
-- Name: gemstone_categories gemstone_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gemstone_categories
    ADD CONSTRAINT gemstone_categories_pkey PRIMARY KEY (id);


--
-- Name: gemstone_subcategories gemstone_subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gemstone_subcategories
    ADD CONSTRAINT gemstone_subcategories_pkey PRIMARY KEY (id);


--
-- Name: households households_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.households
    ADD CONSTRAINT households_pkey PRIMARY KEY (id);


--
-- Name: parties parties_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parties
    ADD CONSTRAINT parties_pkey PRIMARY KEY (id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: phone_numbers phone_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone_numbers
    ADD CONSTRAINT phone_numbers_pkey PRIMARY KEY (id);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: product_styles product_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_styles
    ADD CONSTRAINT product_styles_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sources sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);


--
-- Name: state_provinces state_provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.state_provinces
    ADD CONSTRAINT state_provinces_pkey PRIMARY KEY (id);


--
-- Name: store_transaction_categories store_transaction_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_transaction_categories
    ADD CONSTRAINT store_transaction_categories_pkey PRIMARY KEY (id);


--
-- Name: store_transaction_line_items store_transaction_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_transaction_line_items
    ADD CONSTRAINT store_transaction_line_items_pkey PRIMARY KEY (id);


--
-- Name: store_transactions store_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_transactions
    ADD CONSTRAINT store_transactions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_addresses_on_addressable_type_and_addressable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_on_addressable_type_and_addressable_id ON public.addresses USING btree (addressable_type, addressable_id);


--
-- Name: index_addresses_on_state_province_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_on_state_province_id ON public.addresses USING btree (state_province_id);


--
-- Name: index_diamond_grades_on_diamond_clarity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_diamond_grades_on_diamond_clarity_id ON public.diamond_grades USING btree (diamond_clarity_id);


--
-- Name: index_diamond_grades_on_diamond_color_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_diamond_grades_on_diamond_color_id ON public.diamond_grades USING btree (diamond_color_id);


--
-- Name: index_diamond_grades_on_diamond_cut_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_diamond_grades_on_diamond_cut_id ON public.diamond_grades USING btree (diamond_cut_id);


--
-- Name: index_email_addresses_on_emailable_type_and_emailable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_addresses_on_emailable_type_and_emailable_id ON public.email_addresses USING btree (emailable_type, emailable_id);


--
-- Name: index_gemstone_subcategories_on_gemstone_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gemstone_subcategories_on_gemstone_category_id ON public.gemstone_subcategories USING btree (gemstone_category_id);


--
-- Name: index_households_on_addresses_type_and_addresses_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_households_on_addresses_type_and_addresses_id ON public.households USING btree (addresses_type, addresses_id);


--
-- Name: index_households_on_email_address_type_and_email_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_households_on_email_address_type_and_email_address_id ON public.households USING btree (email_address_type, email_address_id);


--
-- Name: index_households_on_phone_numbers_type_and_phone_numbers_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_households_on_phone_numbers_type_and_phone_numbers_id ON public.households USING btree (phone_numbers_type, phone_numbers_id);


--
-- Name: index_people_on_household_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_people_on_household_id ON public.people USING btree (household_id);


--
-- Name: index_phone_numbers_on_phoneable_type_and_phoneable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_phone_numbers_on_phoneable_type_and_phoneable_id ON public.phone_numbers USING btree (phoneable_type, phoneable_id);


--
-- Name: index_product_styles_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_product_styles_on_name ON public.product_styles USING btree (name);


--
-- Name: index_products_on_product_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_product_category_id ON public.products USING btree (product_category_id);


--
-- Name: index_products_on_product_style_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_product_style_id ON public.products USING btree (product_style_id);


--
-- Name: index_store_transaction_line_items_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_store_transaction_line_items_on_product_id ON public.store_transaction_line_items USING btree (product_id);


--
-- Name: index_store_transaction_line_items_on_store_transaction_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_store_transaction_line_items_on_store_transaction_id ON public.store_transaction_line_items USING btree (store_transaction_id);


--
-- Name: index_store_transactions_on_party_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_store_transactions_on_party_id ON public.store_transactions USING btree (party_id);


--
-- Name: index_store_transactions_on_store_transaction_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_store_transactions_on_store_transaction_category_id ON public.store_transactions USING btree (store_transaction_category_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: diamond_grades fk_rails_113a66e536; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diamond_grades
    ADD CONSTRAINT fk_rails_113a66e536 FOREIGN KEY (diamond_cut_id) REFERENCES public.diamond_cuts(id);


--
-- Name: store_transactions fk_rails_13591f4845; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_transactions
    ADD CONSTRAINT fk_rails_13591f4845 FOREIGN KEY (store_transaction_category_id) REFERENCES public.store_transaction_categories(id);


--
-- Name: diamond_grades fk_rails_6175ef843c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diamond_grades
    ADD CONSTRAINT fk_rails_6175ef843c FOREIGN KEY (diamond_clarity_id) REFERENCES public.diamond_clarities(id);


--
-- Name: products fk_rails_6d374caf01; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_6d374caf01 FOREIGN KEY (product_style_id) REFERENCES public.product_styles(id);


--
-- Name: store_transactions fk_rails_7775d59e28; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_transactions
    ADD CONSTRAINT fk_rails_7775d59e28 FOREIGN KEY (party_id) REFERENCES public.parties(id);


--
-- Name: people fk_rails_829e856eff; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT fk_rails_829e856eff FOREIGN KEY (household_id) REFERENCES public.households(id);


--
-- Name: gemstone_subcategories fk_rails_94115774e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gemstone_subcategories
    ADD CONSTRAINT fk_rails_94115774e7 FOREIGN KEY (gemstone_category_id) REFERENCES public.gemstone_categories(id);


--
-- Name: diamond_grades fk_rails_a430fb1905; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diamond_grades
    ADD CONSTRAINT fk_rails_a430fb1905 FOREIGN KEY (diamond_color_id) REFERENCES public.diamond_colors(id);


--
-- Name: store_transaction_line_items fk_rails_af4a850152; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_transaction_line_items
    ADD CONSTRAINT fk_rails_af4a850152 FOREIGN KEY (store_transaction_id) REFERENCES public.store_transactions(id);


--
-- Name: store_transaction_line_items fk_rails_ba768cee4d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_transaction_line_items
    ADD CONSTRAINT fk_rails_ba768cee4d FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: products fk_rails_efe167855e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_efe167855e FOREIGN KEY (product_category_id) REFERENCES public.product_categories(id);


--
-- Name: addresses fk_rails_fe85803a1e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_rails_fe85803a1e FOREIGN KEY (state_province_id) REFERENCES public.state_provinces(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20191211152807'),
('20191213211745'),
('20191213212120'),
('20200405215330'),
('20200505214823'),
('20200507183739'),
('20200508183741'),
('20200511145103'),
('20200511145648'),
('20200511184600'),
('20200511194245'),
('20200512182444'),
('20200512201517'),
('20200513033144'),
('20200513135616'),
('20200513151246'),
('20200513190814'),
('20200513190912'),
('20200513191125'),
('20200521223647'),
('20200525221847'),
('20200525222226'),
('20200526020509'),
('20200526023320'),
('20200526024418'),
('20200526195627'),
('20200526200129'),
('20200526224941'),
('20200526225630'),
('20200529020841'),
('20200601180012'),
('20200601214830'),
('20200604170752'),
('20200604180016'),
('20200604184807'),
('20200608201848'),
('20200608202828'),
('20200609235320'),
('20200611174427'),
('20200611180009'),
('20200611180046'),
('20200613021313'),
('20200615185854'),
('20200615194322'),
('20200616015533'),
('20200617040322'),
('20200617041937'),
('20200617174348'),
('20200617184705'),
('20200717212210'),
('20201009192838'),
('20201009193154'),
('20201009193314'),
('20201009211325'),
('20201009211337'),
('20201009211342'),
('20201009214701'),
('20201009220327'),
('20201009220648'),
('20201009221159'),
('20201015000456'),
('20201015001654'),
('20201015001857'),
('20201015002102'),
('20201016210814'),
('20201016235621'),
('20201023222650'),
('20201026201355'),
('20201026211514');


