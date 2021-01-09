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

--
-- Name: validate_exclusive_fn(bigint, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.validate_exclusive_fn(product_id bigint, product_category_id integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
      DECLARE
        result_var            INTEGER;
      BEGIN
        SELECT COALESCE(1, 0)
            INTO result_var
            FROM products
           WHERE products.product_id            = $1
             AND products.product_category_id   = $2;

          RETURN result_var;
      END
      $_$;


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
-- Name: gemstone_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gemstone_profiles (
    id bigint NOT NULL,
    carat numeric,
    role character varying(20),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: gemstone_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.gemstone_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gemstone_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.gemstone_profiles_id_seq OWNED BY public.gemstone_profiles.id;


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
-- Name: gemstones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gemstones (
    id bigint NOT NULL,
    carat numeric(5,2),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: gemstones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.gemstones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gemstones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.gemstones_id_seq OWNED BY public.gemstones.id;


--
-- Name: gemstones_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gemstones_items (
    gemstone_id bigint NOT NULL,
    item_id bigint NOT NULL
);


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
-- Name: item_styles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_styles (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: item_styles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_styles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_styles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.item_styles_id_seq OWNED BY public.item_styles.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.items (
    id bigint NOT NULL,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name character varying(40) NOT NULL,
    cost_cents integer DEFAULT 0 NOT NULL,
    cost_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    price_cents integer DEFAULT 0 NOT NULL,
    price_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    notes text,
    item_style_id bigint NOT NULL,
    category character varying(20),
    merchant_id bigint NOT NULL
);


--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: jewelry_pieces_metal_colors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jewelry_pieces_metal_colors (
    jewelry_piece_id bigint NOT NULL,
    metal_color_id bigint NOT NULL
);


--
-- Name: jewelry_pieces_metal_purities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jewelry_pieces_metal_purities (
    metal_purity_id bigint NOT NULL,
    jewelry_piece_id bigint NOT NULL
);


--
-- Name: jewelry_pieces_metals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jewelry_pieces_metals (
    jewelry_piece_id bigint NOT NULL,
    metal_id bigint NOT NULL
);


--
-- Name: loose_gemstones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.loose_gemstones (
    id bigint NOT NULL,
    item_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    gemstone_profile_id bigint NOT NULL
);


--
-- Name: loose_gemstones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.loose_gemstones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: loose_gemstones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.loose_gemstones_id_seq OWNED BY public.loose_gemstones.id;


--
-- Name: merchants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.merchants (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: merchants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.merchants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: merchants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.merchants_id_seq OWNED BY public.merchants.id;


--
-- Name: metal_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.metal_categories (
    id bigint NOT NULL,
    name character varying(20),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: metal_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.metal_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: metal_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.metal_categories_id_seq OWNED BY public.metal_categories.id;


--
-- Name: metal_colors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.metal_colors (
    id bigint NOT NULL,
    name character varying(10),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: metal_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.metal_colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: metal_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.metal_colors_id_seq OWNED BY public.metal_colors.id;


--
-- Name: metal_purities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.metal_purities (
    id bigint NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: metal_purities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.metal_purities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: metal_purities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.metal_purities_id_seq OWNED BY public.metal_purities.id;


--
-- Name: metals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.metals (
    id bigint NOT NULL,
    name character varying(40),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    metal_category_id bigint NOT NULL,
    metal_color_id bigint NOT NULL,
    metal_purity_id bigint NOT NULL,
    piece_id bigint NOT NULL
);


--
-- Name: metals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.metals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: metals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.metals_id_seq OWNED BY public.metals.id;


--
-- Name: miscellaneous_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.miscellaneous_items (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    item_id bigint NOT NULL
);


--
-- Name: miscellaneous_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.miscellaneous_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: miscellaneous_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.miscellaneous_items_id_seq OWNED BY public.miscellaneous_items.id;


--
-- Name: mounted_gemstones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mounted_gemstones (
    gemstone_profile_id bigint NOT NULL,
    piece_id bigint NOT NULL
);


--
-- Name: mountings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mountings (
    gemstone_id bigint NOT NULL,
    piece_id bigint NOT NULL
);


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
-- Name: pieces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pieces (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    item_id bigint NOT NULL
);


--
-- Name: pieces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pieces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pieces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pieces_id_seq OWNED BY public.pieces.id;


--
-- Name: product_eras; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_eras (
    id bigint NOT NULL,
    name character varying(40),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: product_eras_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_eras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_eras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_eras_id_seq OWNED BY public.product_eras.id;


--
-- Name: product_jewelry_metals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_jewelry_metals (
    id bigint NOT NULL,
    name character varying(20),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: product_jewelry_metals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_jewelry_metals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_jewelry_metals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_jewelry_metals_id_seq OWNED BY public.product_jewelry_metals.id;


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
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    merchant_id bigint NOT NULL
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
-- Name: gemstone_profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gemstone_profiles ALTER COLUMN id SET DEFAULT nextval('public.gemstone_profiles_id_seq'::regclass);


--
-- Name: gemstone_subcategories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gemstone_subcategories ALTER COLUMN id SET DEFAULT nextval('public.gemstone_subcategories_id_seq'::regclass);


--
-- Name: gemstones id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gemstones ALTER COLUMN id SET DEFAULT nextval('public.gemstones_id_seq'::regclass);


--
-- Name: households id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.households ALTER COLUMN id SET DEFAULT nextval('public.households_id_seq'::regclass);


--
-- Name: item_styles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_styles ALTER COLUMN id SET DEFAULT nextval('public.item_styles_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: loose_gemstones id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loose_gemstones ALTER COLUMN id SET DEFAULT nextval('public.loose_gemstones_id_seq'::regclass);


--
-- Name: merchants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchants ALTER COLUMN id SET DEFAULT nextval('public.merchants_id_seq'::regclass);


--
-- Name: metal_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metal_categories ALTER COLUMN id SET DEFAULT nextval('public.metal_categories_id_seq'::regclass);


--
-- Name: metal_colors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metal_colors ALTER COLUMN id SET DEFAULT nextval('public.metal_colors_id_seq'::regclass);


--
-- Name: metal_purities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metal_purities ALTER COLUMN id SET DEFAULT nextval('public.metal_purities_id_seq'::regclass);


--
-- Name: metals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metals ALTER COLUMN id SET DEFAULT nextval('public.metals_id_seq'::regclass);


--
-- Name: miscellaneous_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.miscellaneous_items ALTER COLUMN id SET DEFAULT nextval('public.miscellaneous_items_id_seq'::regclass);


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
-- Name: pieces id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pieces ALTER COLUMN id SET DEFAULT nextval('public.pieces_id_seq'::regclass);


--
-- Name: product_eras id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_eras ALTER COLUMN id SET DEFAULT nextval('public.product_eras_id_seq'::regclass);


--
-- Name: product_jewelry_metals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_jewelry_metals ALTER COLUMN id SET DEFAULT nextval('public.product_jewelry_metals_id_seq'::regclass);


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
-- Name: gemstone_profiles gemstone_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gemstone_profiles
    ADD CONSTRAINT gemstone_profiles_pkey PRIMARY KEY (id);


--
-- Name: gemstone_subcategories gemstone_subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gemstone_subcategories
    ADD CONSTRAINT gemstone_subcategories_pkey PRIMARY KEY (id);


--
-- Name: gemstones gemstones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gemstones
    ADD CONSTRAINT gemstones_pkey PRIMARY KEY (id);


--
-- Name: households households_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.households
    ADD CONSTRAINT households_pkey PRIMARY KEY (id);


--
-- Name: item_styles item_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_styles
    ADD CONSTRAINT item_styles_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: loose_gemstones loose_gemstones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loose_gemstones
    ADD CONSTRAINT loose_gemstones_pkey PRIMARY KEY (id);


--
-- Name: merchants merchants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchants
    ADD CONSTRAINT merchants_pkey PRIMARY KEY (id);


--
-- Name: metal_categories metal_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metal_categories
    ADD CONSTRAINT metal_categories_pkey PRIMARY KEY (id);


--
-- Name: metal_colors metal_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metal_colors
    ADD CONSTRAINT metal_colors_pkey PRIMARY KEY (id);


--
-- Name: metal_purities metal_purities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metal_purities
    ADD CONSTRAINT metal_purities_pkey PRIMARY KEY (id);


--
-- Name: metals metals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metals
    ADD CONSTRAINT metals_pkey PRIMARY KEY (id);


--
-- Name: miscellaneous_items miscellaneous_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.miscellaneous_items
    ADD CONSTRAINT miscellaneous_items_pkey PRIMARY KEY (id);


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
-- Name: pieces pieces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pieces
    ADD CONSTRAINT pieces_pkey PRIMARY KEY (id);


--
-- Name: product_eras product_eras_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_eras
    ADD CONSTRAINT product_eras_pkey PRIMARY KEY (id);


--
-- Name: product_jewelry_metals product_jewelry_metals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_jewelry_metals
    ADD CONSTRAINT product_jewelry_metals_pkey PRIMARY KEY (id);


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
-- Name: index_gemstones_items_on_gemstone_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gemstones_items_on_gemstone_id ON public.gemstones_items USING btree (gemstone_id);


--
-- Name: index_gemstones_items_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gemstones_items_on_item_id ON public.gemstones_items USING btree (item_id);


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
-- Name: index_item_styles_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_item_styles_on_name ON public.item_styles USING btree (name);


--
-- Name: index_items_on_item_style_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_item_style_id ON public.items USING btree (item_style_id);


--
-- Name: index_items_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_merchant_id ON public.items USING btree (merchant_id);


--
-- Name: index_jewelry_pieces_metals_on_jewelry_piece_id_and_metal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_jewelry_pieces_metals_on_jewelry_piece_id_and_metal_id ON public.jewelry_pieces_metals USING btree (jewelry_piece_id, metal_id);


--
-- Name: index_jewelry_pieces_metals_on_metal_id_and_jewelry_piece_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_jewelry_pieces_metals_on_metal_id_and_jewelry_piece_id ON public.jewelry_pieces_metals USING btree (metal_id, jewelry_piece_id);


--
-- Name: index_loose_gemstones_on_gemstone_profile_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_loose_gemstones_on_gemstone_profile_id ON public.loose_gemstones USING btree (gemstone_profile_id);


--
-- Name: index_loose_gemstones_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_loose_gemstones_on_item_id ON public.loose_gemstones USING btree (item_id);


--
-- Name: index_merchants_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_merchants_on_name ON public.merchants USING btree (name);


--
-- Name: index_metal_categories_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_metal_categories_on_name ON public.metal_categories USING btree (name);


--
-- Name: index_metal_colors_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_metal_colors_on_name ON public.metal_colors USING btree (name);


--
-- Name: index_metal_purities_on_value; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_metal_purities_on_value ON public.metal_purities USING btree (value);


--
-- Name: index_metals_on_metal_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_metals_on_metal_category_id ON public.metals USING btree (metal_category_id);


--
-- Name: index_metals_on_metal_color_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_metals_on_metal_color_id ON public.metals USING btree (metal_color_id);


--
-- Name: index_metals_on_metal_purity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_metals_on_metal_purity_id ON public.metals USING btree (metal_purity_id);


--
-- Name: index_metals_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_metals_on_name ON public.metals USING btree (name);


--
-- Name: index_metals_on_piece_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_metals_on_piece_id ON public.metals USING btree (piece_id);


--
-- Name: index_miscellaneous_items_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_miscellaneous_items_on_item_id ON public.miscellaneous_items USING btree (item_id);


--
-- Name: index_mounted_gemstones_on_gemstone_profile_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mounted_gemstones_on_gemstone_profile_id ON public.mounted_gemstones USING btree (gemstone_profile_id);


--
-- Name: index_mounted_gemstones_on_piece_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mounted_gemstones_on_piece_id ON public.mounted_gemstones USING btree (piece_id);


--
-- Name: index_mountings_on_gemstone_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mountings_on_gemstone_id ON public.mountings USING btree (gemstone_id);


--
-- Name: index_mountings_on_piece_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mountings_on_piece_id ON public.mountings USING btree (piece_id);


--
-- Name: index_people_on_household_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_people_on_household_id ON public.people USING btree (household_id);


--
-- Name: index_phone_numbers_on_phoneable_type_and_phoneable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_phone_numbers_on_phoneable_type_and_phoneable_id ON public.phone_numbers USING btree (phoneable_type, phoneable_id);


--
-- Name: index_pieces_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pieces_on_item_id ON public.pieces USING btree (item_id);


--
-- Name: index_product_eras_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_product_eras_on_name ON public.product_eras USING btree (name);


--
-- Name: index_product_jewelry_metals_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_product_jewelry_metals_on_name ON public.product_jewelry_metals USING btree (name);


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
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_merchant_id ON public.users USING btree (merchant_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: mountings fk_rails_05253c703d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mountings
    ADD CONSTRAINT fk_rails_05253c703d FOREIGN KEY (gemstone_id) REFERENCES public.gemstones(id);


--
-- Name: pieces fk_rails_11375f5187; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pieces
    ADD CONSTRAINT fk_rails_11375f5187 FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: store_transactions fk_rails_13591f4845; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_transactions
    ADD CONSTRAINT fk_rails_13591f4845 FOREIGN KEY (store_transaction_category_id) REFERENCES public.store_transaction_categories(id);


--
-- Name: users fk_rails_2cc2ae8b0c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_2cc2ae8b0c FOREIGN KEY (merchant_id) REFERENCES public.merchants(id);


--
-- Name: metals fk_rails_34251d0b2b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metals
    ADD CONSTRAINT fk_rails_34251d0b2b FOREIGN KEY (metal_purity_id) REFERENCES public.metal_purities(id);


--
-- Name: mountings fk_rails_450234aa52; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mountings
    ADD CONSTRAINT fk_rails_450234aa52 FOREIGN KEY (piece_id) REFERENCES public.pieces(id);


--
-- Name: miscellaneous_items fk_rails_4fda89efa5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.miscellaneous_items
    ADD CONSTRAINT fk_rails_4fda89efa5 FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: metals fk_rails_636b6dff83; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metals
    ADD CONSTRAINT fk_rails_636b6dff83 FOREIGN KEY (piece_id) REFERENCES public.pieces(id);


--
-- Name: items fk_rails_6d374caf01; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_6d374caf01 FOREIGN KEY (item_style_id) REFERENCES public.item_styles(id);


--
-- Name: loose_gemstones fk_rails_7695fa3c20; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loose_gemstones
    ADD CONSTRAINT fk_rails_7695fa3c20 FOREIGN KEY (gemstone_profile_id) REFERENCES public.gemstone_profiles(id);


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
-- Name: metals fk_rails_9832456671; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metals
    ADD CONSTRAINT fk_rails_9832456671 FOREIGN KEY (metal_color_id) REFERENCES public.metal_colors(id);


--
-- Name: store_transaction_line_items fk_rails_af4a850152; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_transaction_line_items
    ADD CONSTRAINT fk_rails_af4a850152 FOREIGN KEY (store_transaction_id) REFERENCES public.store_transactions(id);


--
-- Name: items fk_rails_ba3b0b4b5e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_ba3b0b4b5e FOREIGN KEY (merchant_id) REFERENCES public.merchants(id);


--
-- Name: store_transaction_line_items fk_rails_ba768cee4d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_transaction_line_items
    ADD CONSTRAINT fk_rails_ba768cee4d FOREIGN KEY (product_id) REFERENCES public.items(id);


--
-- Name: loose_gemstones fk_rails_c0dd357d2a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loose_gemstones
    ADD CONSTRAINT fk_rails_c0dd357d2a FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: metals fk_rails_f645012efd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metals
    ADD CONSTRAINT fk_rails_f645012efd FOREIGN KEY (metal_category_id) REFERENCES public.metal_categories(id);


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
('20201026211514'),
('20201027025910'),
('20201027122009'),
('20201027122712'),
('20201027233045'),
('20201027234852'),
('20201028141119'),
('20201028144401'),
('20201028144501'),
('20201031194123'),
('20201103183352'),
('20201103185250'),
('20201105000549'),
('20201105022515'),
('20201105145510'),
('20201105155804'),
('20201105161323'),
('20201105161803'),
('20201105164955'),
('20201105165427'),
('20201106231246'),
('20201106234314'),
('20201106235234'),
('20201107001150'),
('20201107210225'),
('20201107215018'),
('20201107231942'),
('20201107232042'),
('20201113144451'),
('20201113224326'),
('20201113230428'),
('20201113230833'),
('20201113230923'),
('20201114200621'),
('20201114201523'),
('20201114202130'),
('20201116223912'),
('20201119004709'),
('20201119010101'),
('20201119171356'),
('20201119225818'),
('20201120013645'),
('20201207203217'),
('20201207204047'),
('20201217165240'),
('20201217173609'),
('20201217175731'),
('20201217181100'),
('20201217182046'),
('20201217202015'),
('20201217210128'),
('20201219012013'),
('20210108194339'),
('20210108230709'),
('20210108231535'),
('20210108233431');


