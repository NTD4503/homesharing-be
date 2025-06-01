--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5

-- Started on 2025-06-01 08:03:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE rentroomdb;
--
-- TOC entry 3613 (class 1262 OID 16384)
-- Name: rentroomdb; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE rentroomdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


\connect rentroomdb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 217 (class 1259 OID 16389)
-- Name: amenities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.amenities (
    amenity_id integer NOT NULL,
    amenity_name character varying(255) NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16392)
-- Name: amenities_amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.amenities_amenities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3614 (class 0 OID 0)
-- Dependencies: 218
-- Name: amenities_amenities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.amenities_amenities_id_seq OWNED BY public.amenities.amenity_id;


--
-- TOC entry 219 (class 1259 OID 16393)
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    comment_id integer NOT NULL,
    post_id character varying(50) NOT NULL,
    content text NOT NULL,
    rating real NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_id integer NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 16399)
-- Name: comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3615 (class 0 OID 0)
-- Dependencies: 220
-- Name: comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_comment_id_seq OWNED BY public.comments.comment_id;


--
-- TOC entry 221 (class 1259 OID 16400)
-- Name: contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contacts (
    contact_id integer NOT NULL,
    full_name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 222 (class 1259 OID 16406)
-- Name: contact_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contact_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 222
-- Name: contact_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contact_contact_id_seq OWNED BY public.contacts.contact_id;


--
-- TOC entry 255 (class 1259 OID 24909)
-- Name: conversations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conversations (
    id integer NOT NULL,
    user1_id integer NOT NULL,
    user2_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 24908)
-- Name: conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conversations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 254
-- Name: conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conversations_id_seq OWNED BY public.conversations.id;


--
-- TOC entry 223 (class 1259 OID 16407)
-- Name: favorites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.favorites (
    favorite_id integer NOT NULL,
    user_id integer NOT NULL,
    post_id character varying(50) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 224 (class 1259 OID 16411)
-- Name: favorites_favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.favorites_favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 224
-- Name: favorites_favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.favorites_favorite_id_seq OWNED BY public.favorites.favorite_id;


--
-- TOC entry 225 (class 1259 OID 16412)
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


--
-- TOC entry 226 (class 1259 OID 16415)
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 226
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- TOC entry 227 (class 1259 OID 16416)
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


--
-- TOC entry 228 (class 1259 OID 16419)
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 228
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- TOC entry 257 (class 1259 OID 24930)
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    conversation_id integer NOT NULL,
    sender_id integer NOT NULL,
    text text NOT NULL,
    image_url character varying(255) NOT NULL,
    is_read boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 24929)
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 256
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- TOC entry 229 (class 1259 OID 16420)
-- Name: post_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.post_type (
    post_type_id integer NOT NULL,
    post_type_name character varying(50) NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 16423)
-- Name: post_type_post_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.post_type_post_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3622 (class 0 OID 0)
-- Dependencies: 230
-- Name: post_type_post_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.post_type_post_type_id_seq OWNED BY public.post_type.post_type_id;


--
-- TOC entry 231 (class 1259 OID 16424)
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    post_id character varying(50) NOT NULL,
    room_id integer NOT NULL,
    user_id integer NOT NULL,
    post_type_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    expired_in date,
    is_approved boolean DEFAULT false NOT NULL,
    is_blocked boolean DEFAULT false NOT NULL,
    available boolean DEFAULT true NOT NULL,
    delete_flag boolean DEFAULT false NOT NULL,
    date_range character varying(50),
    time_frame text[]
);


--
-- TOC entry 232 (class 1259 OID 16434)
-- Name: purchase_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_history (
    history_id integer NOT NULL,
    user_id integer,
    service_id integer,
    service_expiry_date timestamp with time zone,
    purchase_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 233 (class 1259 OID 16438)
-- Name: purchase_history_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_history_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3623 (class 0 OID 0)
-- Dependencies: 233
-- Name: purchase_history_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_history_history_id_seq OWNED BY public.purchase_history.history_id;


--
-- TOC entry 234 (class 1259 OID 16439)
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    role_id integer NOT NULL,
    role_name character varying(50) NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 16442)
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3624 (class 0 OID 0)
-- Dependencies: 235
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;


--
-- TOC entry 236 (class 1259 OID 16443)
-- Name: room; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.room (
    room_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    location character varying(255) NOT NULL,
    location_codes character varying[] DEFAULT '{0,0,0}'::character varying[] NOT NULL,
    lat numeric(10,7),
    lng numeric(10,7)
);


--
-- TOC entry 237 (class 1259 OID 16449)
-- Name: room_amenities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.room_amenities (
    rooms_amenities_id integer NOT NULL,
    amenity_id integer NOT NULL,
    room_id integer NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 16452)
-- Name: room_detail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.room_detail (
    room_detail_id integer NOT NULL,
    room_id integer NOT NULL,
    room_type_id integer NOT NULL,
    capacity integer NOT NULL,
    area integer NOT NULL,
    gender character varying(255) DEFAULT 'M'::character varying NOT NULL,
    price integer
);


--
-- TOC entry 239 (class 1259 OID 16456)
-- Name: room_detail_room_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.room_detail_room_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3625 (class 0 OID 0)
-- Dependencies: 239
-- Name: room_detail_room_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.room_detail_room_detail_id_seq OWNED BY public.room_detail.room_detail_id;


--
-- TOC entry 240 (class 1259 OID 16457)
-- Name: room_images; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.room_images (
    room_images_id integer NOT NULL,
    room_id integer NOT NULL,
    image_url character varying(255) NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 16460)
-- Name: room_images_room_images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.room_images_room_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3626 (class 0 OID 0)
-- Dependencies: 241
-- Name: room_images_room_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.room_images_room_images_id_seq OWNED BY public.room_images.room_images_id;


--
-- TOC entry 242 (class 1259 OID 16461)
-- Name: room_room_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.room_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3627 (class 0 OID 0)
-- Dependencies: 242
-- Name: room_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.room_room_id_seq OWNED BY public.room.room_id;


--
-- TOC entry 243 (class 1259 OID 16462)
-- Name: room_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.room_type (
    room_type_id integer NOT NULL,
    room_type_name character varying(50) NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 16465)
-- Name: room_type_room_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.room_type_room_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3628 (class 0 OID 0)
-- Dependencies: 244
-- Name: room_type_room_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.room_type_room_type_id_seq OWNED BY public.room_type.room_type_id;


--
-- TOC entry 245 (class 1259 OID 16466)
-- Name: rooms_amenities_rooms_amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rooms_amenities_rooms_amenities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3629 (class 0 OID 0)
-- Dependencies: 245
-- Name: rooms_amenities_rooms_amenities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rooms_amenities_rooms_amenities_id_seq OWNED BY public.room_amenities.rooms_amenities_id;


--
-- TOC entry 246 (class 1259 OID 16467)
-- Name: services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services (
    service_id integer NOT NULL,
    service_name character varying(255) NOT NULL,
    price_per_day integer NOT NULL,
    price_per_week integer NOT NULL,
    price_per_month integer NOT NULL,
    advantages text,
    title_color character varying(255),
    auto_approval boolean DEFAULT false,
    prominent_badge boolean DEFAULT false,
    period character varying(255),
    num_purchases integer DEFAULT 0
);


--
-- TOC entry 247 (class 1259 OID 16475)
-- Name: services_service_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 247
-- Name: services_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;


--
-- TOC entry 248 (class 1259 OID 16476)
-- Name: transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transactions (
    transaction_id integer NOT NULL,
    user_id integer NOT NULL,
    amount bigint NOT NULL,
    transaction_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    transaction_code character varying(100),
    transaction_info character varying(255),
    status character varying(255) NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 16482)
-- Name: transactions_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transactions_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 249
-- Name: transactions_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transactions_transaction_id_seq OWNED BY public.transactions.transaction_id;


--
-- TOC entry 250 (class 1259 OID 16483)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    hashed_password character varying(255) NOT NULL,
    phone character varying(50) NOT NULL,
    role_id integer NOT NULL,
    avatar character varying(255),
    balance integer DEFAULT 0,
    is_blocked boolean DEFAULT false NOT NULL,
    service_expiry_date timestamp with time zone,
    service_id integer DEFAULT 4 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 251 (class 1259 OID 16492)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 251
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 252 (class 1259 OID 16493)
-- Name: viewing_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.viewing_requests (
    request_id integer NOT NULL,
    post_id character varying(50) NOT NULL,
    request_date date NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    time_frame character varying(255) NOT NULL,
    user_id integer NOT NULL,
    is_approved boolean DEFAULT false NOT NULL,
    note character varying(255)
);


--
-- TOC entry 253 (class 1259 OID 16501)
-- Name: viewing_requests_request_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.viewing_requests_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 253
-- Name: viewing_requests_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.viewing_requests_request_id_seq OWNED BY public.viewing_requests.request_id;


--
-- TOC entry 3309 (class 2604 OID 16502)
-- Name: amenities amenity_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.amenities ALTER COLUMN amenity_id SET DEFAULT nextval('public.amenities_amenities_id_seq'::regclass);


--
-- TOC entry 3310 (class 2604 OID 16503)
-- Name: comments comment_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN comment_id SET DEFAULT nextval('public.comments_comment_id_seq'::regclass);


--
-- TOC entry 3312 (class 2604 OID 16504)
-- Name: contacts contact_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contacts ALTER COLUMN contact_id SET DEFAULT nextval('public.contact_contact_id_seq'::regclass);


--
-- TOC entry 3348 (class 2604 OID 24912)
-- Name: conversations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversations ALTER COLUMN id SET DEFAULT nextval('public.conversations_id_seq'::regclass);


--
-- TOC entry 3314 (class 2604 OID 16505)
-- Name: favorites favorite_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites ALTER COLUMN favorite_id SET DEFAULT nextval('public.favorites_favorite_id_seq'::regclass);


--
-- TOC entry 3316 (class 2604 OID 16506)
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- TOC entry 3317 (class 2604 OID 16507)
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- TOC entry 3351 (class 2604 OID 24933)
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- TOC entry 3318 (class 2604 OID 16508)
-- Name: post_type post_type_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_type ALTER COLUMN post_type_id SET DEFAULT nextval('public.post_type_post_type_id_seq'::regclass);


--
-- TOC entry 3324 (class 2604 OID 16509)
-- Name: purchase_history history_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_history ALTER COLUMN history_id SET DEFAULT nextval('public.purchase_history_history_id_seq'::regclass);


--
-- TOC entry 3326 (class 2604 OID 16510)
-- Name: roles role_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);


--
-- TOC entry 3327 (class 2604 OID 16511)
-- Name: room room_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room ALTER COLUMN room_id SET DEFAULT nextval('public.room_room_id_seq'::regclass);


--
-- TOC entry 3329 (class 2604 OID 16512)
-- Name: room_amenities rooms_amenities_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_amenities ALTER COLUMN rooms_amenities_id SET DEFAULT nextval('public.rooms_amenities_rooms_amenities_id_seq'::regclass);


--
-- TOC entry 3330 (class 2604 OID 16513)
-- Name: room_detail room_detail_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_detail ALTER COLUMN room_detail_id SET DEFAULT nextval('public.room_detail_room_detail_id_seq'::regclass);


--
-- TOC entry 3332 (class 2604 OID 16514)
-- Name: room_images room_images_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_images ALTER COLUMN room_images_id SET DEFAULT nextval('public.room_images_room_images_id_seq'::regclass);


--
-- TOC entry 3333 (class 2604 OID 16515)
-- Name: room_type room_type_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_type ALTER COLUMN room_type_id SET DEFAULT nextval('public.room_type_room_type_id_seq'::regclass);


--
-- TOC entry 3334 (class 2604 OID 16516)
-- Name: services service_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);


--
-- TOC entry 3338 (class 2604 OID 16517)
-- Name: transactions transaction_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions ALTER COLUMN transaction_id SET DEFAULT nextval('public.transactions_transaction_id_seq'::regclass);


--
-- TOC entry 3340 (class 2604 OID 16518)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 3345 (class 2604 OID 16519)
-- Name: viewing_requests request_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.viewing_requests ALTER COLUMN request_id SET DEFAULT nextval('public.viewing_requests_request_id_seq'::regclass);


--
-- TOC entry 3567 (class 0 OID 16389)
-- Dependencies: 217
-- Data for Name: amenities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.amenities VALUES (1, 'Wifi');
INSERT INTO public.amenities VALUES (2, 'Điều hòa');
INSERT INTO public.amenities VALUES (3, 'Chỗ để xe');
INSERT INTO public.amenities VALUES (4, 'TV');
INSERT INTO public.amenities VALUES (5, 'Tủ lạnh');
INSERT INTO public.amenities VALUES (6, 'Máy giặt');
INSERT INTO public.amenities VALUES (7, 'Gần chợ ');
INSERT INTO public.amenities VALUES (8, 'Dọn vệ sinh');
INSERT INTO public.amenities VALUES (9, 'Ban công');
INSERT INTO public.amenities VALUES (11, 'Chổ phơi đồ');
INSERT INTO public.amenities VALUES (14, 'Công viên');


--
-- TOC entry 3569 (class 0 OID 16393)
-- Dependencies: 219
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.comments VALUES (20, 'd92abd59-e26f-478f-a967-91ebc795b34e', 'sạch đẹp rộng thoáng', 5, '2025-05-22 07:41:57.345771+00', 44);
INSERT INTO public.comments VALUES (21, 'd92abd59-e26f-478f-a967-91ebc795b34e', 'xấu', 2, '2025-05-22 07:42:16.377057+00', 44);
INSERT INTO public.comments VALUES (22, 'd92abd59-e26f-478f-a967-91ebc795b34e', 'quá xấu', 1, '2025-05-22 07:42:21.421121+00', 44);
INSERT INTO public.comments VALUES (23, 'd92abd59-e26f-478f-a967-91ebc795b34e', 'lừa đảo', 1, '2025-05-22 07:42:25.639248+00', 44);
INSERT INTO public.comments VALUES (11, 'e74b816c-d50e-46e9-9eae-db82ef8d40f1', 'Phòng rất đẹp!', 5, '2025-04-30 08:00:24.073+00', 26);
INSERT INTO public.comments VALUES (12, 'e74b816c-d50e-46e9-9eae-db82ef8d40f1', 'Phòng oke nhé.', 5, '2025-04-30 08:00:58.349+00', 28);
INSERT INTO public.comments VALUES (14, 'e74b816c-d50e-46e9-9eae-db82ef8d40f1', 'Phòng rất oke nhé', 4, '2025-05-11 08:37:48.238+00', 29);
INSERT INTO public.comments VALUES (15, '7f68d143-b166-40d3-9de4-50777cd51967', 'phòng rất oke nhé', 4, '2025-05-23 13:00:06.395+00', 18);
INSERT INTO public.comments VALUES (18, '25302fe2-e1e2-45cc-967e-d48737696b42', 'Phòng rất oke nhá!<br>', 4, '2025-05-11 14:17:48.512+00', 29);


--
-- TOC entry 3571 (class 0 OID 16400)
-- Dependencies: 221
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.contacts VALUES (10, 'Dattt', '211212@gmail.com', '012346564', 'app ổn quá nhể', '2025-05-22 16:03:56.52533+00');
INSERT INTO public.contacts VALUES (1, 'John Doe', 'johndoe@example.com', '123456789', 'Hello, I''m interested in your products.', '2025-04-21 08:47:06.827+00');
INSERT INTO public.contacts VALUES (9, 'Hoàng', 'hoang@gmail.com', '123456789', 'Nothin''', '2025-04-28 06:23:55.124+00');


--
-- TOC entry 3605 (class 0 OID 24909)
-- Dependencies: 255
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3573 (class 0 OID 16407)
-- Dependencies: 223
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.favorites VALUES (79, 49, '87d5287d-f319-40ed-918d-43026d43067d', '2025-05-22 15:54:22.34089+00');


--
-- TOC entry 3575 (class 0 OID 16412)
-- Dependencies: 225
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.knex_migrations VALUES (16, '20240228074810_create_room_type_table.js', 1, '2024-03-03 09:53:09.84+00');
INSERT INTO public.knex_migrations VALUES (17, '20240228074823_create_post_type_table.js', 2, '2024-03-03 09:53:45.661+00');
INSERT INTO public.knex_migrations VALUES (18, '20240228075221_create_roles_table.js', 3, '2024-03-03 09:54:01.008+00');
INSERT INTO public.knex_migrations VALUES (19, '20240228084527_create_room_table.js', 4, '2024-03-03 09:54:32.269+00');
INSERT INTO public.knex_migrations VALUES (20, '20240228075509_create_users_table.js', 5, '2024-03-03 09:55:20.916+00');
INSERT INTO public.knex_migrations VALUES (21, '20240228075549_create_posts_table.js', 6, '2024-03-03 09:55:31.14+00');
INSERT INTO public.knex_migrations VALUES (27, '20240228075232_create_room_detail_table.js', 7, '2024-03-03 09:56:30.941+00');
INSERT INTO public.knex_migrations VALUES (28, '20240228075239_create_amenities_table.js', 7, '2024-03-03 09:56:30.946+00');
INSERT INTO public.knex_migrations VALUES (29, '20240228075246_create_rooms_amenities_table.js', 7, '2024-03-03 09:56:30.953+00');
INSERT INTO public.knex_migrations VALUES (30, '20240228075253_create_room_images_table.js', 7, '2024-03-03 09:56:30.959+00');
INSERT INTO public.knex_migrations VALUES (31, '20240228075300_create_viewing_requests_table.js', 7, '2024-03-03 09:56:30.967+00');
INSERT INTO public.knex_migrations VALUES (32, '20240228075308_create_favorites_table.js', 7, '2024-03-03 09:56:30.974+00');
INSERT INTO public.knex_migrations VALUES (33, '20240228075313_create_comments_table.js', 7, '2024-03-03 09:56:30.982+00');
INSERT INTO public.knex_migrations VALUES (34, '20240306021719_add_expired_in_to_posts_table.js', 8, '2024-03-06 02:17:45.29+00');
INSERT INTO public.knex_migrations VALUES (37, '20240306022657_create_transactions_table.js', 9, '2024-03-06 02:36:50.339+00');
INSERT INTO public.knex_migrations VALUES (38, '20240306022732_add_balance_to_users_table.js', 9, '2024-03-06 02:36:50.342+00');
INSERT INTO public.knex_migrations VALUES (40, '20240306133330_alter_users_table.js', 10, '2024-03-08 06:56:23.873+00');
INSERT INTO public.knex_migrations VALUES (41, '20240317024222_add_user_id_to_comment_table.js', 11, '2024-03-17 02:50:11.007+00');
INSERT INTO public.knex_migrations VALUES (42, '20240318135813_change_room_detail_table.js', 12, '2024-03-18 14:03:44.785+00');
INSERT INTO public.knex_migrations VALUES (45, '20240324064949_add_is_approved_to_posts_table.js', 13, '2024-03-24 08:41:17.863+00');
INSERT INTO public.knex_migrations VALUES (47, '20240324065000_add_location_codes_to_room_table.js', 14, '2024-03-26 13:29:57.881+00');
INSERT INTO public.knex_migrations VALUES (48, '20240328145043_add_time_frame_to_viewing_requests_table.js', 15, '2024-03-28 14:51:17.028+00');
INSERT INTO public.knex_migrations VALUES (49, '20240329030142_add_user_id_to_viewing_requests_table.js', 16, '2024-03-29 03:03:25.834+00');
INSERT INTO public.knex_migrations VALUES (50, '20240403084803_refactor_transaction_table.js', 17, '2024-04-03 08:52:11.565+00');
INSERT INTO public.knex_migrations VALUES (56, '20240406022139_service_expired_and_is_blocked_to_users_table.js', 18, '2024-04-06 02:32:01.412+00');
INSERT INTO public.knex_migrations VALUES (58, '20240406023026_drop_available_in_room_table.js', 19, '2024-04-06 02:33:39.978+00');
INSERT INTO public.knex_migrations VALUES (60, '20240406031625_create_services_table.js', 20, '2024-04-06 03:38:00.869+00');
INSERT INTO public.knex_migrations VALUES (61, '20240406033139_alter_users_table.js', 21, '2024-04-06 03:42:09.785+00');
INSERT INTO public.knex_migrations VALUES (62, '20240407130824_rename_rooms_amenities_table.js', 22, '2024-04-07 13:08:40.448+00');
INSERT INTO public.knex_migrations VALUES (63, '20240409134002_add_is_approved_to_viewing_requests_table.js', 23, '2024-04-09 13:41:04.83+00');
INSERT INTO public.knex_migrations VALUES (64, '20240414134513_add_period_to_services_table.js', 24, '2024-04-14 13:47:21.054+00');
INSERT INTO public.knex_migrations VALUES (65, '20240405152608_add_is_block_to_posts_table.js', 25, '2024-04-18 08:08:05.565+00');
INSERT INTO public.knex_migrations VALUES (66, '20240421022355_add_note_to_viewing_requests_table.js', 26, '2024-04-21 02:25:55.284+00');
INSERT INTO public.knex_migrations VALUES (67, '20240421083325_create_contact_table.js', 27, '2024-04-21 08:37:04.045+00');
INSERT INTO public.knex_migrations VALUES (68, '20240505022400_add_delete_flag_to_posts_table.js', 28, '2024-05-05 02:27:25.52+00');
INSERT INTO public.knex_migrations VALUES (69, '20240507135540_add_created_at_to_users.js', 29, '2024-05-07 13:57:02.411+00');
INSERT INTO public.knex_migrations VALUES (70, '20240507142219_add_num_purchases_to_services.js', 30, '2024-05-07 14:24:00.777+00');
INSERT INTO public.knex_migrations VALUES (72, '20240512024303_create_purchase_history_table.js', 31, '2024-05-12 03:22:42.001+00');
INSERT INTO public.knex_migrations VALUES (74, '20240519022554_add_is_cancelled_to_viewing_requests_table.js', 32, '2024-05-19 02:58:09.516+00');
INSERT INTO public.knex_migrations VALUES (76, '20240522080405_refactor_transactions_table.js', 33, '2024-05-22 08:22:09.552+00');
INSERT INTO public.knex_migrations VALUES (77, '20250525033109_add_lat_lng_to_room.js', 34, '2025-05-28 03:46:21.6322+00');
INSERT INTO public.knex_migrations VALUES (84, '20250528010838_create_conversations.js', 35, '2025-05-28 03:47:39.296+00');
INSERT INTO public.knex_migrations VALUES (85, '20250528010846_create_messages.js', 35, '2025-05-28 03:47:39.302+00');


--
-- TOC entry 3577 (class 0 OID 16416)
-- Dependencies: 227
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.knex_migrations_lock VALUES (1, 0);


--
-- TOC entry 3607 (class 0 OID 24930)
-- Dependencies: 257
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3579 (class 0 OID 16420)
-- Dependencies: 229
-- Data for Name: post_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.post_type VALUES (1, 'Cho thuê');
INSERT INTO public.post_type VALUES (2, 'Tìm ở ghép');


--
-- TOC entry 3581 (class 0 OID 16424)
-- Dependencies: 231
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES ('69e04776-536d-49c6-91d2-32dce6be9bf6', 33, 40, 1, '2025-05-25 05:22:36.282805+00', '2025-06-25', true, true, true, false, NULL, NULL);
INSERT INTO public.posts VALUES ('e74b816c-d50e-46e9-9eae-db82ef8d40f1', 17, 18, 1, '2025-04-29 15:30:19.611+00', '2025-07-02', true, false, true, false, '17/05/2025 - 29/05/2025', '{"6:00 - 8:00","8:00 - 10:00","16:00 - 18:00"}');
INSERT INTO public.posts VALUES ('7f68d143-b166-40d3-9de4-50777cd51967', 25, 31, 2, '2025-05-04 14:50:16.488+00', '2025-07-02', true, false, true, false, NULL, NULL);
INSERT INTO public.posts VALUES ('87d5287d-f319-40ed-918d-43026d43067d', 29, 40, 1, '2025-05-20 10:58:51.362568+00', '2025-05-25', true, true, false, false, NULL, NULL);
INSERT INTO public.posts VALUES ('5e97e2ce-081e-406a-8d3e-665e9cbbee20', 31, 40, 1, '2025-05-22 07:52:45.350198+00', '2025-05-25', true, false, false, false, NULL, NULL);
INSERT INTO public.posts VALUES ('d92abd59-e26f-478f-a967-91ebc795b34e', 30, 44, 1, '2025-05-22 07:41:05.960803+00', '2025-05-25', true, true, false, false, NULL, NULL);
INSERT INTO public.posts VALUES ('9eebb4c4-4225-4f89-ab14-83da1ab2c750', 24, 26, 1, '2025-05-04 10:02:35.606+00', '2025-07-02', true, false, true, false, NULL, NULL);
INSERT INTO public.posts VALUES ('81463626-db42-4a7d-b153-01b55dd2d141', 23, 28, 2, '2025-05-04 09:53:12.618+00', '2025-07-02', true, false, true, false, NULL, NULL);
INSERT INTO public.posts VALUES ('b7bf0b6a-9a96-4a2d-ae60-1143a736753c', 26, 32, 1, '2025-05-26 06:40:17.062+00', '2025-06-26', true, false, false, false, NULL, NULL);
INSERT INTO public.posts VALUES ('c14d78db-eb36-45a3-b302-fc973bc82b2d', 18, 18, 1, '2025-05-04 08:51:10.848+00', '2025-05-14', true, false, false, false, '04/05/2025 - 14/05/2025', '{"6:00 - 8:00","8:00 - 10:00"}');
INSERT INTO public.posts VALUES ('b2d03599-c7b6-4a71-a0ef-aa9033a6deb3', 34, 40, 1, '2025-05-25 05:27:44.931215+00', '2025-06-25', true, true, true, false, NULL, NULL);
INSERT INTO public.posts VALUES ('87f3c0ef-fbc6-430c-8042-6c53ffc29a98', 19, 18, 1, '2025-05-04 08:56:20.68+00', '2025-07-02', true, false, true, false, NULL, NULL);
INSERT INTO public.posts VALUES ('25302fe2-e1e2-45cc-967e-d48737696b42', 20, 18, 1, '2025-05-04 09:03:54.728+00', '2025-07-02', true, false, true, false, '08/05/2025 - 15/05/2025', '{"6:00 - 8:00","12:00 - 14:00"}');
INSERT INTO public.posts VALUES ('d9ba0ee7-94a6-4bda-b81d-072d9a15d81e', 27, 29, 2, '2025-05-05 12:41:35.906+00', '2025-07-02', true, false, true, false, NULL, NULL);
INSERT INTO public.posts VALUES ('f6a20676-a266-4139-8edf-3900b6e5ca03', 28, 18, 1, '2025-05-16 14:43:35.717+00', '2025-07-02', true, false, true, false, NULL, NULL);
INSERT INTO public.posts VALUES ('b701f8ef-8aa0-4243-918e-e669b553d194', 22, 29, 2, '2025-05-04 09:41:34.639+00', '2025-07-02', true, false, true, false, NULL, NULL);
INSERT INTO public.posts VALUES ('363f7354-3bad-4a11-8911-4e5c99c69961', 21, 29, 2, '2025-05-04 09:24:50.315+00', '2025-07-02', true, false, true, false, NULL, NULL);
INSERT INTO public.posts VALUES ('f8ea0b70-fe32-44d9-b717-fbbbf7636062', 32, 40, 1, '2025-05-25 05:01:47.952419+00', '2025-06-25', true, false, true, false, NULL, NULL);


--
-- TOC entry 3582 (class 0 OID 16434)
-- Dependencies: 232
-- Data for Name: purchase_history; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.purchase_history VALUES (16, 49, 1, '2025-05-23 09:17:14.343+00', '2025-05-22 09:17:14.550877+00');
INSERT INTO public.purchase_history VALUES (17, 49, 1, '2025-05-23 09:17:30.502+00', '2025-05-22 09:17:30.289994+00');
INSERT INTO public.purchase_history VALUES (18, 49, 1, '2025-05-23 09:17:35.942+00', '2025-05-22 09:17:35.910115+00');
INSERT INTO public.purchase_history VALUES (19, 49, 3, '2025-05-24 10:46:02.382+00', '2025-05-23 10:46:02.550916+00');
INSERT INTO public.purchase_history VALUES (20, 49, 3, '2025-05-24 10:46:36.526+00', '2025-05-23 10:46:36.54482+00');
INSERT INTO public.purchase_history VALUES (21, 49, 1, '2025-05-24 10:46:49.725+00', '2025-05-23 10:46:49.136686+00');
INSERT INTO public.purchase_history VALUES (22, 40, 1, '2025-05-24 10:50:35.733+00', '2025-05-23 10:50:36.357092+00');
INSERT INTO public.purchase_history VALUES (23, 40, 1, '2025-05-24 10:50:40.877+00', '2025-05-23 10:50:41.261662+00');
INSERT INTO public.purchase_history VALUES (24, 40, 2, '2025-05-24 10:51:05.037+00', '2025-05-23 10:51:04.897033+00');
INSERT INTO public.purchase_history VALUES (25, 40, 1, '2025-05-24 10:51:10.333+00', '2025-05-23 10:51:09.95152+00');
INSERT INTO public.purchase_history VALUES (2, 18, 1, '2025-05-13 03:53:41.247+00', '2025-04-12 03:53:41.276+00');
INSERT INTO public.purchase_history VALUES (3, 30, 2, '2025-05-19 05:07:12.855+00', '2025-05-12 05:07:12.87+00');
INSERT INTO public.purchase_history VALUES (4, 18, 2, '2025-05-17 13:20:13.059+00', '2025-05-16 13:20:13.077+00');
INSERT INTO public.purchase_history VALUES (5, 18, 3, '2025-05-22 13:32:30.531+00', '2025-04-21 13:32:30.566+00');
INSERT INTO public.purchase_history VALUES (6, 18, 3, '2025-05-22 13:32:36.745+00', '2025-04-21 13:32:36.755+00');
INSERT INTO public.purchase_history VALUES (7, 18, 2, '2025-05-22 13:42:03.769+00', '2025-04-21 13:42:03.786+00');
INSERT INTO public.purchase_history VALUES (8, 18, 2, '2025-05-22 13:42:09.001+00', '2025-04-21 13:42:09.015+00');
INSERT INTO public.purchase_history VALUES (9, 18, 3, '2025-05-22 13:43:04.193+00', '2025-04-21 13:43:04.205+00');
INSERT INTO public.purchase_history VALUES (10, 18, 3, '2025-05-22 13:43:41.889+00', '2025-04-21 13:43:41.906+00');
INSERT INTO public.purchase_history VALUES (11, 18, 3, '2025-05-22 13:43:48.48+00', '2025-04-21 13:43:48.489+00');
INSERT INTO public.purchase_history VALUES (12, 18, 3, '2025-05-22 13:44:02.169+00', '2025-04-21 13:44:02.188+00');
INSERT INTO public.purchase_history VALUES (13, 18, 3, '2025-05-22 13:53:30.677+00', '2025-04-21 13:53:30.69+00');
INSERT INTO public.purchase_history VALUES (14, 18, 3, '2025-05-22 13:53:35.543+00', '2025-05-21 13:53:35.553+00');
INSERT INTO public.purchase_history VALUES (15, 18, 4, '2025-06-09 06:13:10.495+00', '2025-05-08 06:13:10.514+00');
INSERT INTO public.purchase_history VALUES (26, 40, 1, '2025-05-31 07:48:05.775+00', '2025-05-30 07:48:05.760914+00');


--
-- TOC entry 3584 (class 0 OID 16439)
-- Dependencies: 234
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.roles VALUES (1, 'admin');
INSERT INTO public.roles VALUES (2, 'Chủ trọ');
INSERT INTO public.roles VALUES (3, 'Người thuê');


--
-- TOC entry 3586 (class 0 OID 16443)
-- Dependencies: 236
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.room VALUES (18, 'Cho thuê phòng trọ khép kín, rộng 25m2 giá cho thuê 2,7 triệu/tháng', 'Phòng trọ khép kín, 25m2.<br> Có bình nóng lạnh, điều hòa, khu bếp nấu ăn, phơi quần áo, internet, camera an ninh.', '68 ngõ 1 Đường Phan Đình Giót, Phường Phương Liệt, Quận Thanh Xuân, Hà Nội', '{201,1493,1A0707}', 20.9897808, 105.8386083);
INSERT INTO public.room VALUES (19, 'Chính chủ cho thuê nhà nguyên căn', 'Cho thuê nhà 40m2x4 tầng, 3pn, 3wc. Gần đường, gần trường, gần chợ.

Ngõ xe ba gác, cách đường ô tô 10m.

Nhà hướng Đông Nam sạch sẽ thoáng mát

Nội thất: full đồ

Tình trạng: Vào ở ngay', '11 Khương Trung, Phường Khương Trung, Quận Thanh Xuân, Thành phố Hà Nội', '{201,1493,1A0704}', 20.9985791, 105.8164760);
INSERT INTO public.room VALUES (17, 'Cho thuê phòng gần đại học kinh tế quốc dân', 'Chính chủ cho thuê phòng 27m2 , VSKK, có cửa sổ, ban công thoáng mát , 5 phút đi bộ đến NEU , ở 2 người thoải mái. Giá 3;5 triệu.

Đồ có sẵn: điều hòa , nóng lạnh, giường tủ, bàn ghế, kệ bếp, máy giặt chung.

An ninh tốt, yên tĩnh. Địa chỉ : ngõ 377 Giải Phóng.

Liên hệ : 0398879912', 'Ngõ 178 Đường Giải Phóng, Phường Phương Liệt, Quận Thanh Xuân, Thành phố Hà Nội', '{201,1493,1A0707}', 20.9951191, 105.8372700);
INSERT INTO public.room VALUES (23, 'Tìm nam ở ghép tại Quận Nam Từ Liêm', 'Phòng có diện tích là 25m, hợp đồng 6 tháng gia hạn 1 lần, cọc là 3tr8 (chưa chia)<br><br>Phòng có đủ nội thất (Giường, tủ quần áo, bếp, máy giặt, bạn công, chỗ phơi đồ, tủ lạnh, nồi, bát đũa , điều hòa)<br><br>Có chỗ để xe máy rộng rãi, có thang máy, an ninh tốt đảm bảo, có cam ở hành lang và chỗ để xe.<br><br>Vì là đầu tháng nên đặc biệt khuyến mãi cho bạn đến sớm nhất 200K<br><br>Điện: 2.500k/số ; Nước: 30k/số<br><br>Bản thân: Nam 2002 sinh viên<br><br>Yêu cầu: Nam 2000 trở lên, không xăm, không hút thuốc.', '6 Mễ Trì Hạ, Phường Mễ Trì, Quận Nam Từ Liêm, Thành phố Hà Nội', '{201,3440,13003}', 21.0128501, 105.7793299);
INSERT INTO public.room VALUES (27, 'Full nội thất - an ninh - giờ giấc tự do', '- Chính chủ cho thuê, phòng mới xây, thoáng mát và an ninh.<br><br>- Trung tâm Q.1, gần chợ, siêu thị, nhà thuốc và trường học (ĐH Khoa Học Tự Nhiên, ĐH Sài Gòn, ĐH Sư Phạm,... ).<br><br>- Lối đi riêng, giờ giấc tự do.<br><br>- Full nội thất: giường nệm, máy lạnh, tủ lạnh, tủ quần áo,.. sân phơi và WC riêng (nóng lạnh đầy đủ)<br><br>- Ưu tiên học sinh, sinh viên, nhân viên VP.<br><br>- Liên hệ cô Hòa: 0909.62.83.95', '212b/78 Đường Nguyễn Trãi, Phường Nguyễn Cư Trinh, Quận 1, Hồ Chí Minh', '{202,1442,20107}', 10.7664276, 106.6835650);
INSERT INTO public.room VALUES (28, 'Cho Thuê Căn Hộ Studio Khu Vực Ngũ Hành Sơn', 'Khu vực nằm gần trục đường chính Lê Văn Hiến<br><br>Gần chợ Bắc Mỹ An<br><br>Phòng rộng rãi thoáng mát<br><br>Full nội thất<br><br>', ' Đường Đa Mặn 5, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Đà Nẵng', '{203,1529,40403}', 16.0315390, 108.2431426);
INSERT INTO public.room VALUES (26, 'Cho thuê toàn bộ toà nhà 6,5 tầng mặt tiền 114 Hoàng Hoa Thám ngay trung tâm quận Hải Châu và Thanh Khê', 'Cho thuê toàn bộ toà nhà 6,5 tầng mặt tiền 114 Hoàng Hoa Thám ngay trung tâm quận Hải Châu và Thanh Khê<br><br>- Địa chỉ: 114, Đường Hoàng Hoa Thám, Phường Hải Châu I, Quận Hải Châu, Đà Nẵng<br><br>- Diện tích đất: 118,8m2 (ngang 7,2m). Diện tích sàn: 640m2.<br><br>- Có thang máy, sân để ô tô 2 chiếc, 6 máy lạnh Daikin inverter 2 ngựa, 2 máy lạnh Daikin inverter, 2 ngựa âm trần, 2 toilet/tầng. Màng rèm, đèn, cửa kính...hầu như đầy đủ không cần phải đầu tư gì thêm.<br><br>- Toà nhà mới xây đầy đủ công năng, trống suốt, sạch sẽ<br><br>- Giá 90 triệu/tháng. Có thương lượng.<br><br>- Liên hệ chủ nhà: O9O25O 5616 - O93 494499O', 'Phan Đình Phùng, Phường Hải Châu  I, Quận Hải Châu, Thành phố Đà Nẵng', '{203,1526,40103}', 16.0703846, 108.2201862);
INSERT INTO public.room VALUES (21, 'Phòng cho thuê tại số 13 Lê Thanh Nghị full đồ 1tr750k', 'Biệt thự ở ghép "full tiện ích" giá chỉ 1 triệu 750k<br><br>Homestay dịch vụ tiện ích<br><br>Vệ sinh sạch sẽ<br><br>An ninh đảm bảo<br><br>Tự do giờ giấc<br><br>Miễn phí wifi<br><br>Sẵn máy lạnh, giường, tủ, quạt...<br><br>Tự do giờ giấc, sử dụng khóa vân tay, có camera an ninh <br><br>Điện nước chia ra, theo giá nhà nước<br><br>Điện nước tính theo bình quân đầu người theo từng phòng, giá theo hoá đơn thực tế nhà nước.', '13 Lê Thanh Nghị, Phường Bách Khoa, Quận Hai Bà Trưng, Hà Nội', '{201,1488,1A0302}', 21.0020275, 105.8431695);
INSERT INTO public.room VALUES (25, 'Tìm bạn ở ghép giá rẻ sv ở quận 12', 'Cần tìm một bạn ở ghép phòng rộng, mới, sạch sẽ, thoáng mát<br><br>Có chổ để xe, wifi, máy lạnh<br><br>Điện 3k5 trên 1 số, nước 100k/1 người<br><br>Tiền phòng 1tr5/ người / tháng<br><br>Bạn nào có nhu cầu liên hệ mình nhé<br><br>Zalo 0385395597', '7A/82 Tô Ngọc Vân, Phường Thạnh Xuân, Quận 12, Thành phố Hồ Chí Minh', '{202,1545,21209}', 10.8650324, 106.6725918);
INSERT INTO public.room VALUES (24, 'Cho thuê nguyên căn nhà 4 tầng, 3 phòng ngủ. khép kín.', 'Cho thuê nhà chính chủ, 3 phòng ngủ, sạch sẽ, đẹp, yên tĩnh.

Diện tích: 25m2

Ô tô vào sát nhà, thuận tiện giao thông, hợp ở và kinh doanh

Giá thuê: 12tr/tháng

Liên hệ: Trần Lan - 0934475869', '1/14/118 Đào Tấn, Phường Ngọc Khánh, Quận Ba Đình, Thành phố Hà Nội', '{201,1484,1A0108}', 21.0340418, 105.8034722);
INSERT INTO public.room VALUES (33, '123', '1234', '360 Giải Phóng, Phường Phương Liệt, Quận Thanh Xuân, Hà Nội', '{201,1493,1A0707}', 20.9858419, 105.8407123);
INSERT INTO public.room VALUES (34, '1111', '1111', 'số 1 Thái Văn Lung, Phường Bến Nghé, Quận 1, Hồ Chí Minh', '{202,1442,20101}', 10.7792185, 106.7046591);
INSERT INTO public.room VALUES (22, 'Tìm người ở cùng Homestay cao cấp cho sinh viên chỉ 2.3 tr/tháng (bao điện) ở gần các trường Đại Học', 'Rất phù hợp với sinh viên.<br><br>- Tổng DT sàn 144m², gồm 4 tầng + 01 phòng sinh hoạt chung.<br><br>- Diện tích phòng riêng là 50m².<br><br>- Phong cách thiết kế hiện đại, tiện nghi công năng đầy đủ, WC riêng cho mỗi tầng.<br><br>- Trang bị full nội thất.<br><br>- Đầy đủ tiện nghi.<br><br>- Phòng ốc mới, sạch sẽ và thoáng mát, CÓ ĐIỀU HÒA.<br><br>- Phòng SHC có đầy đủ thiết bị dụng cụ tự phục vụ như ăn nhẹ, coffee, đọc sách, làm việc, chơi nhạc, sinh hoạt nhóm hoặc hoặc tiếp khách. Luôn cho bạn cảm giác thoải mái và yên tâm như chính nhà mình.<br><br>- Vệ sinh phòng và khuôn viên 03 lần/tuần.<br><br>- Tự do giờ giấc, môi trường sống văn minh, thanh lịch.<br><br>- Vị trí thuận lợi:gần các trường Đại Học<br><br>- Giá: 2.3 tr/tháng (bao điện và phí quản lí), tiền cọc 1.5 tháng.<br><br>Hợp đồng dài hạn.', '15 Lê Thanh Nghị, Phường Bạch Mai, Quận Hai Bà Trưng, Thành phố Hà Nội', '{201,1488,1A0303}', 21.0031167, 105.8473596);
INSERT INTO public.room VALUES (30, 'Gần BKX', 'Full đồ nội thất: điều hoà, nóng lạnh, Tủ bếp, Kệ bếp, ...', '26A, 178 Giải Phóng, Phường Phương Liệt, Quận Thanh Xuân, Hà Nội', '{201,1493,1A0707}', 20.9951936, 105.8377828);
INSERT INTO public.room VALUES (31, 'Gần BKX', 'Full đồ nội thất: điều hoà, nóng lạnh, Tủ bếp, Kệ bếp, ...', '26A, 178 Giải phóng, Phường Phương Liệt, Quận Thanh Xuân, Hà Nội', '{201,1493,1A0707}', 20.9951936, 105.8377828);
INSERT INTO public.room VALUES (29, 'Gần đại học thủy lợi', 'đủ nội thất, chỉ cần xách vali đến ở', 'ngõ 33, Phường Cát Linh, Quận Đống Đa, Hà Nội', '{201,1482,11001}', 21.0301823, 105.8265123);
INSERT INTO public.room VALUES (32, 'căn hộ 2501', '3 ngủ, 1 master, 1 khách, 1 vs', '360 Giải Phóng, Phường Phương Liệt, Quận Thanh Xuân, Hà Nội', '{201,1493,1A0707}', 20.9858419, 105.8407123);
INSERT INTO public.room VALUES (20, 'Cho thuê CC Mini mới, Full nội thất, giá ưu đãi tại ngõ 121 Thịnh Quang, Đống Đa, Hà Nội', 'Bạn đang tìm kiếm một không gian sống nhỏ gọn nhưng có phòng ngủ và phòng khách riêng, đầy đủ tiện nghi và giá cả phải chăng? Xin giới thiệu căn hộ mini tinh tế của chúng tôi, chắc chắn bạn sẽ cảm thấy hài lòng với các đặc điểm sau:<br><br>Vị trí: Ngõ 121 Thịnh Quang, Đống Đa, Hà Nội. Rất gần ngã tư sở, đường Láng, Thái Thịnh và Yên Lãng.<br><br>Giá cả: Giá chỉ từ 6tr đến 6.5tr tùy phòng.<br><br>Ưu tiên: Chúng tôi chân thành chào đón các nữ thuê nhà, đảm bảo môi trường sống hòa thuận.<br><br>Bố trí: Nhà có 7 tầng, tầng 1 để xe, Có Thang máy. Mỗi căn hộ sở hữu thiết kế hiện đại với 1 phòng ngủ, 1 phòng khách và nhà vệ sinh trên diện tích 32m².<br><br>Tiện nghi: Được trang bị đầy đủ các tiện ích cần thiết: điều hòa, bình nóng lạnh, tivi, tủ lạnh, tủ quần áo, tủ bếp trên dưới, bếp từ, bộ ghế sofa, máy giặt riêng. Bạn chỉ cần xách vali đến và ở.<br><br>Dịch vụ vệ sinh: Chúng tôi duy trì không gian chung sạch sẽ với 3 buổi vệ sinh mỗi tuần.<br><br>Biện pháp an toàn: Hệ thống phòng cháy chữa cháy đúng tiêu chuẩn, hiện đại.<br><br>Tòa nhà thông minh: Tòa nhà được trang bị các thiết bị thông minh như: khóa của vân tay, thẻ từ, camera an ninh, website quản lý thông báo phí dịch vụ hàng tháng.<br><br>Thông tin liên hệ: Liên hệ Zalo: 0344 350 998.', 'Ngõ 121 Thịnh Quang, Phường Thịnh Quang, Quận Đống Đa, Thành phố Hà Nội', '{201,1486,1A0415}', 21.0057096, 105.8147620);


--
-- TOC entry 3587 (class 0 OID 16449)
-- Dependencies: 237
-- Data for Name: room_amenities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.room_amenities VALUES (285, 1, 24);
INSERT INTO public.room_amenities VALUES (286, 2, 24);
INSERT INTO public.room_amenities VALUES (287, 3, 24);
INSERT INTO public.room_amenities VALUES (190, 1, 19);
INSERT INTO public.room_amenities VALUES (191, 5, 19);
INSERT INTO public.room_amenities VALUES (192, 2, 19);
INSERT INTO public.room_amenities VALUES (193, 6, 19);
INSERT INTO public.room_amenities VALUES (194, 4, 19);
INSERT INTO public.room_amenities VALUES (195, 2, 20);
INSERT INTO public.room_amenities VALUES (196, 6, 20);
INSERT INTO public.room_amenities VALUES (197, 3, 20);
INSERT INTO public.room_amenities VALUES (198, 1, 20);
INSERT INTO public.room_amenities VALUES (199, 5, 20);
INSERT INTO public.room_amenities VALUES (203, 2, 22);
INSERT INTO public.room_amenities VALUES (204, 6, 22);
INSERT INTO public.room_amenities VALUES (205, 5, 22);
INSERT INTO public.room_amenities VALUES (206, 1, 22);
INSERT INTO public.room_amenities VALUES (207, 4, 22);
INSERT INTO public.room_amenities VALUES (208, 3, 22);
INSERT INTO public.room_amenities VALUES (209, 1, 23);
INSERT INTO public.room_amenities VALUES (210, 5, 23);
INSERT INTO public.room_amenities VALUES (211, 6, 23);
INSERT INTO public.room_amenities VALUES (212, 2, 23);
INSERT INTO public.room_amenities VALUES (213, 3, 23);
INSERT INTO public.room_amenities VALUES (214, 4, 23);
INSERT INTO public.room_amenities VALUES (288, 4, 24);
INSERT INTO public.room_amenities VALUES (289, 5, 24);
INSERT INTO public.room_amenities VALUES (290, 6, 24);
INSERT INTO public.room_amenities VALUES (361, 1, 27);
INSERT INTO public.room_amenities VALUES (362, 5, 27);
INSERT INTO public.room_amenities VALUES (363, 9, 27);
INSERT INTO public.room_amenities VALUES (364, 11, 27);
INSERT INTO public.room_amenities VALUES (365, 14, 27);
INSERT INTO public.room_amenities VALUES (366, 7, 27);
INSERT INTO public.room_amenities VALUES (182, 1, 17);
INSERT INTO public.room_amenities VALUES (183, 2, 17);
INSERT INTO public.room_amenities VALUES (367, 4, 27);
INSERT INTO public.room_amenities VALUES (368, 3, 27);
INSERT INTO public.room_amenities VALUES (369, 6, 27);
INSERT INTO public.room_amenities VALUES (370, 2, 27);
INSERT INTO public.room_amenities VALUES (371, 8, 27);
INSERT INTO public.room_amenities VALUES (233, 1, 25);
INSERT INTO public.room_amenities VALUES (234, 5, 25);
INSERT INTO public.room_amenities VALUES (235, 2, 25);
INSERT INTO public.room_amenities VALUES (236, 6, 25);
INSERT INTO public.room_amenities VALUES (378, 3, 18);
INSERT INTO public.room_amenities VALUES (185, 5, 17);
INSERT INTO public.room_amenities VALUES (186, 6, 17);
INSERT INTO public.room_amenities VALUES (379, 6, 18);
INSERT INTO public.room_amenities VALUES (380, 7, 18);
INSERT INTO public.room_amenities VALUES (381, 9, 18);
INSERT INTO public.room_amenities VALUES (382, 11, 18);
INSERT INTO public.room_amenities VALUES (383, 14, 18);
INSERT INTO public.room_amenities VALUES (389, 2, 28);
INSERT INTO public.room_amenities VALUES (390, 1, 28);
INSERT INTO public.room_amenities VALUES (391, 5, 28);
INSERT INTO public.room_amenities VALUES (392, 3, 28);
INSERT INTO public.room_amenities VALUES (393, 6, 28);
INSERT INTO public.room_amenities VALUES (394, 8, 28);
INSERT INTO public.room_amenities VALUES (395, 9, 28);
INSERT INTO public.room_amenities VALUES (336, 1, 26);
INSERT INTO public.room_amenities VALUES (337, 2, 26);
INSERT INTO public.room_amenities VALUES (338, 5, 26);
INSERT INTO public.room_amenities VALUES (339, 7, 26);
INSERT INTO public.room_amenities VALUES (340, 14, 26);
INSERT INTO public.room_amenities VALUES (400, 1, 30);
INSERT INTO public.room_amenities VALUES (401, 9, 30);
INSERT INTO public.room_amenities VALUES (402, 5, 30);
INSERT INTO public.room_amenities VALUES (403, 2, 30);
INSERT INTO public.room_amenities VALUES (404, 6, 30);
INSERT INTO public.room_amenities VALUES (405, 11, 30);
INSERT INTO public.room_amenities VALUES (406, 3, 30);
INSERT INTO public.room_amenities VALUES (407, 8, 30);
INSERT INTO public.room_amenities VALUES (408, 1, 31);
INSERT INTO public.room_amenities VALUES (409, 5, 31);
INSERT INTO public.room_amenities VALUES (410, 9, 31);
INSERT INTO public.room_amenities VALUES (411, 2, 31);
INSERT INTO public.room_amenities VALUES (412, 6, 31);
INSERT INTO public.room_amenities VALUES (413, 11, 31);
INSERT INTO public.room_amenities VALUES (414, 3, 31);
INSERT INTO public.room_amenities VALUES (415, 8, 31);
INSERT INTO public.room_amenities VALUES (424, 2, 29);
INSERT INTO public.room_amenities VALUES (425, 6, 29);
INSERT INTO public.room_amenities VALUES (426, 11, 29);
INSERT INTO public.room_amenities VALUES (427, 1, 21);
INSERT INTO public.room_amenities VALUES (428, 2, 21);
INSERT INTO public.room_amenities VALUES (429, 3, 21);
INSERT INTO public.room_amenities VALUES (430, 5, 21);
INSERT INTO public.room_amenities VALUES (431, 6, 21);
INSERT INTO public.room_amenities VALUES (432, 1, 32);
INSERT INTO public.room_amenities VALUES (433, 5, 32);
INSERT INTO public.room_amenities VALUES (434, 9, 32);
INSERT INTO public.room_amenities VALUES (435, 2, 32);
INSERT INTO public.room_amenities VALUES (436, 6, 32);
INSERT INTO public.room_amenities VALUES (437, 11, 32);
INSERT INTO public.room_amenities VALUES (438, 1, 33);
INSERT INTO public.room_amenities VALUES (439, 5, 33);
INSERT INTO public.room_amenities VALUES (440, 9, 33);
INSERT INTO public.room_amenities VALUES (441, 1, 34);
INSERT INTO public.room_amenities VALUES (442, 5, 34);
INSERT INTO public.room_amenities VALUES (443, 9, 34);


--
-- TOC entry 3588 (class 0 OID 16452)
-- Dependencies: 238
-- Data for Name: room_detail; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.room_detail VALUES (26, 27, 2, 2, 30, 'ALL', 4000000);
INSERT INTO public.room_detail VALUES (21, 22, 4, 6, 50, 'ALL', 2300000);
INSERT INTO public.room_detail VALUES (19, 20, 3, 3, 32, 'FM', 7000000);
INSERT INTO public.room_detail VALUES (22, 23, 2, 1, 25, 'M', 4500000);
INSERT INTO public.room_detail VALUES (25, 26, 1, 5, 120, 'ALL', 12000000);
INSERT INTO public.room_detail VALUES (23, 24, 1, 6, 25, 'FM', 1200000);
INSERT INTO public.room_detail VALUES (16, 17, 2, 3, 27, 'ALL', 3600000);
INSERT INTO public.room_detail VALUES (18, 19, 1, 5, 40, 'ALL', 5500000);
INSERT INTO public.room_detail VALUES (24, 25, 2, 1, 20, 'M', 900000);
INSERT INTO public.room_detail VALUES (17, 18, 2, 2, 25, 'FM', 2700000);
INSERT INTO public.room_detail VALUES (27, 28, 3, 2, 40, 'ALL', 4500000);
INSERT INTO public.room_detail VALUES (29, 31, 4, 4, 30, 'ALL', 4000000);
INSERT INTO public.room_detail VALUES (28, 29, 2, 1, 20, 'FM', 121221);
INSERT INTO public.room_detail VALUES (20, 21, 2, 1, 22, 'ALL', 1750000);
INSERT INTO public.room_detail VALUES (30, 32, 1, 6, 110, 'ALL', 11000000);
INSERT INTO public.room_detail VALUES (31, 33, 1, 6, 123, 'ALL', 123);
INSERT INTO public.room_detail VALUES (32, 34, 1, 6, 11, 'ALL', 111111);


--
-- TOC entry 3590 (class 0 OID 16457)
-- Dependencies: 240
-- Data for Name: room_images; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.room_images VALUES (104, 19, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714812980/images/c8427954-47fd-421a-99b0-5efaa83ddc07.jpg');
INSERT INTO public.room_images VALUES (105, 19, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714812979/images/d264c202-336b-4d35-aada-acd9dd9d852d.jpg');
INSERT INTO public.room_images VALUES (106, 19, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714812979/images/9fe96922-e527-4f9d-8f2b-21bf3930053d.jpg');
INSERT INTO public.room_images VALUES (107, 19, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714812979/images/eb37e888-e935-46ce-b7ed-23c22b9a6cc8.jpg');
INSERT INTO public.room_images VALUES (108, 19, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714812979/images/e856358b-b04a-4cc3-8821-822416a7dca9.jpg');
INSERT INTO public.room_images VALUES (109, 20, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714813433/images/e7fa299d-82fe-444f-9ffc-6ee2ba173525.jpg');
INSERT INTO public.room_images VALUES (110, 20, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714813433/images/b352ac7a-34c2-4f90-9413-777ab0bded43.jpg');
INSERT INTO public.room_images VALUES (111, 20, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714813434/images/3a898d20-e10d-43ef-a29e-936f0171040e.jpg');
INSERT INTO public.room_images VALUES (112, 20, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714813434/images/14070548-fa15-4733-8f21-8a6b22e415a5.jpg');
INSERT INTO public.room_images VALUES (113, 20, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714813433/images/8d003c5c-a89f-40d0-870d-647e150ef86d.jpg');
INSERT INTO public.room_images VALUES (278, 28, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1718549014/images/c28fac28-1b0b-4529-88a6-a885ffcf36ee.jpg');
INSERT INTO public.room_images VALUES (279, 28, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1718549013/images/97554a4f-85c9-4013-bb7c-6d5079a2a8e4.jpg');
INSERT INTO public.room_images VALUES (280, 28, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1718549013/images/4d4834ed-e0a4-47ca-bedc-c460bd111e1e.jpg');
INSERT INTO public.room_images VALUES (117, 22, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714815693/images/bd405d3d-bc88-420e-a0b5-206ff2b7cc90.jpg');
INSERT INTO public.room_images VALUES (118, 22, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714815694/images/7fef31ca-cf6a-404f-87e9-c0d299928204.jpg');
INSERT INTO public.room_images VALUES (119, 22, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714815694/images/1f9c9fb8-3cdc-4d6a-8152-37fde3658f57.jpg');
INSERT INTO public.room_images VALUES (120, 22, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714815694/images/7baca471-ff5c-4e60-a487-52c755cbf055.jpg');
INSERT INTO public.room_images VALUES (121, 22, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714815693/images/aa8b4074-d848-41cf-881a-dea6b457203d.jpg');
INSERT INTO public.room_images VALUES (122, 22, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714815694/images/358d9494-05c7-4e94-a397-46339ec8fca4.jpg');
INSERT INTO public.room_images VALUES (123, 23, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714816391/images/60d101b2-6365-4023-832e-851aac4b8b4f.jpg');
INSERT INTO public.room_images VALUES (124, 23, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714816391/images/be3a7884-0d4b-47af-a2e5-76f41690c415.jpg');
INSERT INTO public.room_images VALUES (125, 23, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714816391/images/535a2663-3d9c-459d-a65f-0d161c487d5c.jpg');
INSERT INTO public.room_images VALUES (126, 23, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714816392/images/30ee9f00-a8be-460f-b6be-c7b68d83d9d9.jpg');
INSERT INTO public.room_images VALUES (127, 23, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714816391/images/2719e711-3fc2-4801-8cf7-6203d9a6348c.jpg');
INSERT INTO public.room_images VALUES (281, 28, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1718549014/images/f65066d5-50c0-480b-9f6b-c565e324654f.jpg');
INSERT INTO public.room_images VALUES (97, 17, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714461309/images/378b5268-2955-48b7-9399-3fbb1dd28e1e.jpg');
INSERT INTO public.room_images VALUES (98, 17, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714404615/images/260c120c-b6d4-4992-9dc9-f7c50fdee7ee.jpg');
INSERT INTO public.room_images VALUES (99, 17, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714461288/images/c2068d98-1f6d-479f-92a0-4d9a9457fbbb.jpg');
INSERT INTO public.room_images VALUES (143, 25, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714834215/images/522bc6cc-ca4e-4f79-a1a9-d3d40feb2da9.jpg');
INSERT INTO public.room_images VALUES (144, 25, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714834213/images/299dbd7f-d937-4daa-b798-52ea0096ddc6.jpg');
INSERT INTO public.room_images VALUES (145, 25, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714834214/images/3ecb1836-ddfe-416c-9ebd-7ad605557eb5.jpg');
INSERT INTO public.room_images VALUES (146, 25, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714834213/images/89015e37-8d9d-4d87-8221-56dd2a89f4fa.jpg');
INSERT INTO public.room_images VALUES (239, 26, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1716705616/images/0ce3f196-f7ac-425c-8da2-9ae6ec72f1e7.jpg');
INSERT INTO public.room_images VALUES (240, 26, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1716705616/images/28aa57e2-8e4f-4c68-9791-33030e7f5cc6.jpg');
INSERT INTO public.room_images VALUES (241, 26, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1716705616/images/bca110a4-2aa4-47de-ba3d-a6b9000abff0.jpg');
INSERT INTO public.room_images VALUES (242, 26, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1716705616/images/f3160286-9df6-4bbb-bef6-9e9948d63376.jpg');
INSERT INTO public.room_images VALUES (243, 26, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1716705616/images/f3cdbae5-be7b-40d5-a306-e4f874924dee.jpg');
INSERT INTO public.room_images VALUES (244, 26, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1716705616/images/ff38c3b9-9180-40e1-b00e-37b007a15b5e.jpg');
INSERT INTO public.room_images VALUES (261, 27, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1717591295/images/62a6ce8b-0b99-4762-b505-f72e787af149.jpg');
INSERT INTO public.room_images VALUES (262, 27, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1717591295/images/feb2a640-568e-45ba-938c-2d442841f55d.jpg');
INSERT INTO public.room_images VALUES (195, 24, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714816953/images/83a927a7-8e88-447f-9b7f-5267f88f42c1.jpg');
INSERT INTO public.room_images VALUES (196, 24, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714816953/images/8535041c-acf9-41b5-aae0-a796b2a4f8a0.jpg');
INSERT INTO public.room_images VALUES (197, 24, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714816953/images/da111eef-714f-49a8-a385-c41eb1641970.jpg');
INSERT INTO public.room_images VALUES (198, 24, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714816953/images/da253e69-21f4-40d1-84d5-b609246d2b67.jpg');
INSERT INTO public.room_images VALUES (199, 24, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714816954/images/ec1a380a-820d-46e8-bfb0-acc77fd97c47.jpg');
INSERT INTO public.room_images VALUES (263, 27, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1717591293/images/923690c4-15fb-4112-adc2-e1f8e3af60b7.jpg');
INSERT INTO public.room_images VALUES (264, 27, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1717591293/images/c42c0bf2-a6b8-447f-ae1b-3a15e3ce112b.jpg');
INSERT INTO public.room_images VALUES (265, 27, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1717591295/images/366063e6-5100-44ad-a8dc-dbdc0d12e43a.jpg');
INSERT INTO public.room_images VALUES (270, 18, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714812669/images/0c3de10b-696f-48ce-8de4-bb308c0c407e.jpg');
INSERT INTO public.room_images VALUES (271, 18, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714812669/images/a26a7d03-dc90-44fd-8277-cba9095e8bf9.jpg');
INSERT INTO public.room_images VALUES (272, 18, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714812670/images/fc6af26c-061b-400d-805a-9f15ae07e0c2.jpg');
INSERT INTO public.room_images VALUES (273, 18, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1716474597/images/f92b829e-a4d3-4442-afa8-dc0bcbb23c66.jpg');
INSERT INTO public.room_images VALUES (283, 30, 'https://res.cloudinary.com/dul6bnxlj/image/upload/v1747899661/images/64cbec02-88c9-48fc-aa4e-9c85998ac25d.jpg');
INSERT INTO public.room_images VALUES (284, 30, 'https://res.cloudinary.com/dul6bnxlj/image/upload/v1747899661/images/29b65c74-35c1-4e46-b89c-06bde45f71ea.jpg');
INSERT INTO public.room_images VALUES (285, 30, 'https://res.cloudinary.com/dul6bnxlj/image/upload/v1747899664/images/a5122bc0-210c-454f-b883-a4cca998004d.jpg');
INSERT INTO public.room_images VALUES (286, 30, 'https://res.cloudinary.com/dul6bnxlj/image/upload/v1747899661/images/fc8af1a5-1392-40ec-9623-cfc7dd3b769d.jpg');
INSERT INTO public.room_images VALUES (287, 31, 'https://res.cloudinary.com/dul6bnxlj/image/upload/v1747900359/images/2549f247-450d-4bf6-a8fa-12448d6fe47a.jpg');
INSERT INTO public.room_images VALUES (288, 31, 'https://res.cloudinary.com/dul6bnxlj/image/upload/v1747900364/images/d41b88d2-e6b1-4bc8-9846-09774c210284.jpg');
INSERT INTO public.room_images VALUES (289, 31, 'https://res.cloudinary.com/dul6bnxlj/image/upload/v1747900359/images/62e618e0-dd31-4375-ac90-5f5086276c5a.jpg');
INSERT INTO public.room_images VALUES (290, 31, 'https://res.cloudinary.com/dul6bnxlj/image/upload/v1747900360/images/21b5d135-00f8-472b-9f50-9094fac17c5a.jpg');
INSERT INTO public.room_images VALUES (293, 29, 'https://res.cloudinary.com/dul6bnxlj/image/upload/v1747900633/images/9b90d09a-68b7-47c1-a365-a5f3e182b75b.jpg');
INSERT INTO public.room_images VALUES (294, 29, 'https://res.cloudinary.com/dul6bnxlj/image/upload/v1747900637/images/15412bf1-20cc-4bde-908d-2b35fda115f1.jpg');
INSERT INTO public.room_images VALUES (295, 21, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714814689/images/05862ad3-cd5b-4ab1-9b3f-9b1f5fc4db92.jpg');
INSERT INTO public.room_images VALUES (296, 21, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714814689/images/322a9961-3725-4e01-8722-71c5184dca9c.jpg');
INSERT INTO public.room_images VALUES (297, 21, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714814689/images/6af069d2-4f8b-4dc0-9c82-0c1bdff938cb.jpg');
INSERT INTO public.room_images VALUES (298, 21, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1716818566/images/d07a417c-1da4-4374-9688-0045509fc9f4.jpg');
INSERT INTO public.room_images VALUES (299, 32, 'https://res.cloudinary.com/dul6bnxlj/image/upload/v1748149307/images/80bca5df-8120-4b9f-940e-caafe5ba71b6.jpg');
INSERT INTO public.room_images VALUES (300, 33, 'https://res.cloudinary.com/dul6bnxlj/image/upload/v1748150555/images/d087e074-df9f-4148-99e4-e5dfe5994f27.jpg');
INSERT INTO public.room_images VALUES (301, 34, 'https://res.cloudinary.com/dul6bnxlj/image/upload/v1748150864/images/f871c6dd-6b2a-46b5-8ea0-29442dbe62a8.jpg');


--
-- TOC entry 3593 (class 0 OID 16462)
-- Dependencies: 243
-- Data for Name: room_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.room_type VALUES (1, 'Cho thuê nguyên căn');
INSERT INTO public.room_type VALUES (2, 'Phòng trọ');
INSERT INTO public.room_type VALUES (3, 'Căn hộ mini');
INSERT INTO public.room_type VALUES (4, 'Homestay');


--
-- TOC entry 3596 (class 0 OID 16467)
-- Dependencies: 246
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.services VALUES (4, 'VIP 4', 0, 0, 0, '- Tiếp cận khách hàng khá tốt.<br><br>- Xuất hiện sau các loại tin VIP.', '#0879FA', false, false, '3 day', 21);
INSERT INTO public.services VALUES (3, 'VIP 3', 20000, 120000, 480000, '- Lượt xem nhiều gấp 5 lần so với tin thường<br><br>- Tiếp cận khách hàng tốt.<br><br>- Xuất hiện sau VIP 2 và trước tin thường.<br><br>- Xuất hiện thêm ở mục tin nổi bật xuyên suốt khu vực chuyên mục đó. ', '#F56526', false, true, '1 week', 60);
INSERT INTO public.services VALUES (2, 'VIP 2', 40000, 250000, 1000000, '- Lượt xem nhiều gấp 15 lần so với tin thường<br><br>- Tiếp cận rất nhiều khách hàng.<br><br>- Xuất hiện sau VIP 1 và trước VIP 3, tin thường.<br><br>- Xuất hiện thêm ở mục tin nổi bật xuyên suốt khu vực chuyên mục đó. ', '#EC5A9E', false, true, '2 week', 35);
INSERT INTO public.services VALUES (1, 'VIP 1', 80000, 500000, 1800000, '- Lượt xem nhiều gấp 30 lần so với tin thường<br><br>- Ưu việt, tiếp cận tối đa khách hàng.<br><br>- Xuất hiện vị trí đầu tiên ở trang chủ<br><br>- Đứng trên tất cả các loại tin VIP khác<br><br>- Xuất hiện đầu tiên ở mục tin nổi bật xuyên suốt khu vực chuyên mục đó. ', '#cd321d', true, true, '1 month', 20);


--
-- TOC entry 3598 (class 0 OID 16476)
-- Dependencies: 248
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.transactions VALUES (31, 18, 10000, '2025-05-22 09:12:17.864+00', '10625', NULL, 'CANCELLED');
INSERT INTO public.transactions VALUES (32, 18, 10000, '2025-05-22 13:49:04.037+00', '99247', 'ND:CT DEN:220T24511GFZ1REH Thanh toan QR-CSJOIE0A135 Thanh toan 10000', 'PAID');
INSERT INTO public.transactions VALUES (33, 18, 10000, '2025-05-26 03:05:45.738+00', '9661', '', 'CANCELLED');


--
-- TOC entry 3600 (class 0 OID 16483)
-- Dependencies: 250
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (39, 'Hai', '1@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '123456789', 1, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1713001231/images/dad26239-6735-4630-8b69-f2a54c63acd8.jpg', 0, false, NULL, 4, '2025-05-20 09:48:20.587573+00');
INSERT INTO public.users VALUES (41, 'Dat', 'test1@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '123456789000', 3, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1713001231/images/dad26239-6735-4630-8b69-f2a54c63acd8.jpg', 0, false, NULL, 4, '2025-05-20 11:06:12.483952+00');
INSERT INTO public.users VALUES (42, 'Dat', 'test12@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '123456789000', 1, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1713001231/images/dad26239-6735-4630-8b69-f2a54c63acd8.jpg', 0, false, NULL, 4, '2025-05-20 11:06:50.106029+00');
INSERT INTO public.users VALUES (30, 'Phạm Mai Anh', 'hoangithub147@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0965231526', 2, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1715490264/images/903d1fe2-7cbb-48d2-a7a4-ffc7b70fe4ff.jpg', 0, false, NULL, 4, '2025-05-07 13:57:02.396+00');
INSERT INTO public.users VALUES (31, 'Nguyễn Văn Long', 'forbluestack147@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0952364852', 3, NULL, 0, false, NULL, 4, '2025-05-07 13:57:02.396+00');
INSERT INTO public.users VALUES (44, 'hoanggg', '2@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '012346445', 2, NULL, 0, false, NULL, 4, '2025-05-22 07:33:51.059207+00');
INSERT INTO public.users VALUES (33, 'Đinh Thanh Hải', 'dthk164@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '09253621458', 3, NULL, 0, false, NULL, 4, '2025-05-07 13:57:02.396+00');
INSERT INTO public.users VALUES (34, 'Lê Thúy Nga', 'dinhthanhhai.2001@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0236596521', 2, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1715089619/images/39b61a2d-1a49-4aa4-bf64-f7680f8c36b7.jpg', 0, false, NULL, 4, '2025-05-07 13:57:02.396+00');
INSERT INTO public.users VALUES (36, 'Nguyễn Thùy Linh', 'thuylinh@email.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0923652362', 3, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1715090337/images/aa6968bd-0e03-4540-a75d-f8cbd56621be.jpg', 0, false, NULL, 4, '2025-05-07 13:58:58.116+00');
INSERT INTO public.users VALUES (37, 'Duy Tùng', 'tungnd@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0236215952', 3, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1716694617/images/2f05e7d8-f8dd-4c07-8d88-ccf84252dee4.jpg', 0, false, NULL, 4, '2025-05-26 03:36:59.336+00');
INSERT INTO public.users VALUES (29, 'Mai Ngọc Lan', 'lehoangtptn@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0912345672', 3, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1714465361/images/053f1562-2d9f-4fa2-b641-9ffdb0dd54c3.jpg', 0, false, NULL, 4, '2025-05-07 13:57:02.396+00');
INSERT INTO public.users VALUES (18, 'Lê Hoàng', 'thetanerea147@gmail.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', '0896321525', 2, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1718201403/images/170108ab-9d00-4942-acbe-3d8df817ee36.jpg', 10000, false, NULL, 4, '2025-05-07 13:57:02.396+00');
INSERT INTO public.users VALUES (32, 'Lê Ngọc Anh', 'forgradu1@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0823612456', 2, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1716704177/images/5bb38b22-3e21-4d5b-aff4-743c580032ab.jpg', 0, false, NULL, 4, '2025-05-07 13:57:02.396+00');
INSERT INTO public.users VALUES (38, 'Trần Bình', 'binhtran@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0159852301', 3, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1716993908/images/5d360d65-1ded-4bb0-964c-ec27dd39d334.jpg', 0, false, NULL, 4, '2025-05-29 14:45:09.224+00');
INSERT INTO public.users VALUES (25, 'Quản trị viên', '@admin', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0985247101', 1, 'https://res.cloudinary.com/ds25tddiq/image/upload/v1713001231/images/dad26239-6735-4630-8b69-f2a54c63acd8.jpg', 0, false, NULL, 4, '2025-05-07 13:57:02.396+00');
INSERT INTO public.users VALUES (26, 'Nguyễn Mai Linh', 'darkbuhlemai@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0987654321', 2, NULL, 0, false, NULL, 4, '2025-05-07 13:57:02.396+00');
INSERT INTO public.users VALUES (27, 'Trần Văn An', 'forriot147@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0369258147', 2, NULL, 0, false, NULL, 4, '2025-05-07 13:57:02.396+00');
INSERT INTO public.users VALUES (40, 'Nguyễn Tiến Đạt', 'nguyendat12501@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0866933201', 2, 'https://res.cloudinary.com/dul6bnxlj/image/upload/v1748591181/images/3e978f82-4b2c-4875-b097-f5a966bd189b.jpg', 140000, false, '2025-05-31 07:48:05.775+00', 1, '2025-05-20 10:55:36.75351+00');
INSERT INTO public.users VALUES (49, 'hai1', '123@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0234567160', 2, '', 140000, false, NULL, 4, '2025-05-22 09:12:05.457747+00');
INSERT INTO public.users VALUES (28, 'Lê Thị Hương', 'forshopify147@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0246813579', 3, NULL, 0, false, NULL, 4, '2025-05-07 13:57:02.396+00');


--
-- TOC entry 3602 (class 0 OID 16493)
-- Dependencies: 252
-- Data for Name: viewing_requests; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.viewing_requests VALUES (31, 'd9ba0ee7-94a6-4bda-b81d-072d9a15d81e', '2025-05-24', '2025-05-23 11:22:47.040009+00', '18:00 - 20:00', 41, false, 'được không?');
INSERT INTO public.viewing_requests VALUES (32, '87d5287d-f319-40ed-918d-43026d43067d', '2025-05-23', '2025-05-23 11:28:32.25995+00', '18:00 - 20:00', 41, false, 'nhanh nhanh nhá');
INSERT INTO public.viewing_requests VALUES (30, 'e74b816c-d50e-46e9-9eae-db82ef8d40f1', '2025-06-17', '2025-05-15 07:41:52.738+00', '16:00 - 18:00', 29, false, '');


--
-- TOC entry 3634 (class 0 OID 0)
-- Dependencies: 218
-- Name: amenities_amenities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.amenities_amenities_id_seq', 15, true);


--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 220
-- Name: comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_comment_id_seq', 23, true);


--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 222
-- Name: contact_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contact_contact_id_seq', 10, true);


--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 254
-- Name: conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conversations_id_seq', 16, true);


--
-- TOC entry 3638 (class 0 OID 0)
-- Dependencies: 224
-- Name: favorites_favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.favorites_favorite_id_seq', 80, true);


--
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 226
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 85, true);


--
-- TOC entry 3640 (class 0 OID 0)
-- Dependencies: 228
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- TOC entry 3641 (class 0 OID 0)
-- Dependencies: 256
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.messages_id_seq', 28, true);


--
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 230
-- Name: post_type_post_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.post_type_post_type_id_seq', 1, false);


--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 233
-- Name: purchase_history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_history_history_id_seq', 26, true);


--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 235
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 3, true);


--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 239
-- Name: room_detail_room_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.room_detail_room_detail_id_seq', 32, true);


--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 241
-- Name: room_images_room_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.room_images_room_images_id_seq', 301, true);


--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 242
-- Name: room_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.room_room_id_seq', 34, true);


--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 244
-- Name: room_type_room_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.room_type_room_type_id_seq', 1, false);


--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 245
-- Name: rooms_amenities_rooms_amenities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rooms_amenities_rooms_amenities_id_seq', 443, true);


--
-- TOC entry 3650 (class 0 OID 0)
-- Dependencies: 247
-- Name: services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.services_service_id_seq', 1, false);


--
-- TOC entry 3651 (class 0 OID 0)
-- Dependencies: 249
-- Name: transactions_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transactions_transaction_id_seq', 33, true);


--
-- TOC entry 3652 (class 0 OID 0)
-- Dependencies: 251
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_id_seq', 54, true);


--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 253
-- Name: viewing_requests_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.viewing_requests_request_id_seq', 32, true);


--
-- TOC entry 3356 (class 2606 OID 16521)
-- Name: amenities amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.amenities
    ADD CONSTRAINT amenities_pkey PRIMARY KEY (amenity_id);


--
-- TOC entry 3358 (class 2606 OID 16523)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);


--
-- TOC entry 3360 (class 2606 OID 16525)
-- Name: contacts contact_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contact_pkey PRIMARY KEY (contact_id);


--
-- TOC entry 3394 (class 2606 OID 24916)
-- Name: conversations conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- TOC entry 3396 (class 2606 OID 24928)
-- Name: conversations conversations_user1_id_user2_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_user1_id_user2_id_unique UNIQUE (user1_id, user2_id);


--
-- TOC entry 3362 (class 2606 OID 16527)
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (favorite_id);


--
-- TOC entry 3366 (class 2606 OID 16529)
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- TOC entry 3364 (class 2606 OID 16531)
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3398 (class 2606 OID 24940)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 16533)
-- Name: post_type post_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_type
    ADD CONSTRAINT post_type_pkey PRIMARY KEY (post_type_id);


--
-- TOC entry 3370 (class 2606 OID 16535)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (post_id);


--
-- TOC entry 3372 (class 2606 OID 16537)
-- Name: purchase_history purchase_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_history
    ADD CONSTRAINT purchase_history_pkey PRIMARY KEY (history_id);


--
-- TOC entry 3374 (class 2606 OID 16539)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- TOC entry 3380 (class 2606 OID 16541)
-- Name: room_detail room_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_detail
    ADD CONSTRAINT room_detail_pkey PRIMARY KEY (room_detail_id);


--
-- TOC entry 3382 (class 2606 OID 16543)
-- Name: room_images room_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_images
    ADD CONSTRAINT room_images_pkey PRIMARY KEY (room_images_id);


--
-- TOC entry 3376 (class 2606 OID 16545)
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (room_id);


--
-- TOC entry 3384 (class 2606 OID 16547)
-- Name: room_type room_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_type
    ADD CONSTRAINT room_type_pkey PRIMARY KEY (room_type_id);


--
-- TOC entry 3378 (class 2606 OID 16549)
-- Name: room_amenities rooms_amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_amenities
    ADD CONSTRAINT rooms_amenities_pkey PRIMARY KEY (rooms_amenities_id);


--
-- TOC entry 3386 (class 2606 OID 16551)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- TOC entry 3388 (class 2606 OID 16553)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 3390 (class 2606 OID 16555)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3392 (class 2606 OID 16557)
-- Name: viewing_requests viewing_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.viewing_requests
    ADD CONSTRAINT viewing_requests_pkey PRIMARY KEY (request_id);


--
-- TOC entry 3399 (class 2606 OID 16558)
-- Name: comments comments_post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_foreign FOREIGN KEY (post_id) REFERENCES public.posts(post_id);


--
-- TOC entry 3400 (class 2606 OID 16563)
-- Name: comments comments_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 3418 (class 2606 OID 24917)
-- Name: conversations conversations_user1_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_user1_id_foreign FOREIGN KEY (user1_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3419 (class 2606 OID 24922)
-- Name: conversations conversations_user2_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_user2_id_foreign FOREIGN KEY (user2_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3401 (class 2606 OID 16568)
-- Name: favorites favorites_post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_post_id_foreign FOREIGN KEY (post_id) REFERENCES public.posts(post_id);


--
-- TOC entry 3402 (class 2606 OID 16573)
-- Name: favorites favorites_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 3420 (class 2606 OID 24941)
-- Name: messages messages_conversation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_conversation_id_foreign FOREIGN KEY (conversation_id) REFERENCES public.conversations(id) ON DELETE CASCADE;


--
-- TOC entry 3421 (class 2606 OID 24946)
-- Name: messages messages_sender_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_sender_id_foreign FOREIGN KEY (sender_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3403 (class 2606 OID 16578)
-- Name: posts posts_post_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_post_type_id_foreign FOREIGN KEY (post_type_id) REFERENCES public.post_type(post_type_id);


--
-- TOC entry 3404 (class 2606 OID 16583)
-- Name: posts posts_room_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_room_id_foreign FOREIGN KEY (room_id) REFERENCES public.room(room_id);


--
-- TOC entry 3405 (class 2606 OID 16588)
-- Name: posts posts_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 3406 (class 2606 OID 16593)
-- Name: purchase_history purchase_history_service_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_history
    ADD CONSTRAINT purchase_history_service_id_foreign FOREIGN KEY (service_id) REFERENCES public.services(service_id);


--
-- TOC entry 3407 (class 2606 OID 16598)
-- Name: purchase_history purchase_history_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_history
    ADD CONSTRAINT purchase_history_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 3410 (class 2606 OID 16603)
-- Name: room_detail room_detail_room_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_detail
    ADD CONSTRAINT room_detail_room_id_foreign FOREIGN KEY (room_id) REFERENCES public.room(room_id);


--
-- TOC entry 3411 (class 2606 OID 16608)
-- Name: room_detail room_detail_room_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_detail
    ADD CONSTRAINT room_detail_room_type_id_foreign FOREIGN KEY (room_type_id) REFERENCES public.room_type(room_type_id);


--
-- TOC entry 3412 (class 2606 OID 16613)
-- Name: room_images room_images_room_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_images
    ADD CONSTRAINT room_images_room_id_foreign FOREIGN KEY (room_id) REFERENCES public.room(room_id);


--
-- TOC entry 3408 (class 2606 OID 16618)
-- Name: room_amenities rooms_amenities_amenities_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_amenities
    ADD CONSTRAINT rooms_amenities_amenities_id_foreign FOREIGN KEY (amenity_id) REFERENCES public.amenities(amenity_id);


--
-- TOC entry 3409 (class 2606 OID 16623)
-- Name: room_amenities rooms_amenities_room_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_amenities
    ADD CONSTRAINT rooms_amenities_room_id_foreign FOREIGN KEY (room_id) REFERENCES public.room(room_id);


--
-- TOC entry 3413 (class 2606 OID 16628)
-- Name: transactions transactions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 3414 (class 2606 OID 16633)
-- Name: users users_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(role_id);


--
-- TOC entry 3415 (class 2606 OID 16638)
-- Name: users users_service_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_service_id_foreign FOREIGN KEY (service_id) REFERENCES public.services(service_id);


--
-- TOC entry 3416 (class 2606 OID 16643)
-- Name: viewing_requests viewing_requests_post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.viewing_requests
    ADD CONSTRAINT viewing_requests_post_id_foreign FOREIGN KEY (post_id) REFERENCES public.posts(post_id);


--
-- TOC entry 3417 (class 2606 OID 16648)
-- Name: viewing_requests viewing_requests_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.viewing_requests
    ADD CONSTRAINT viewing_requests_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id);


-- Completed on 2025-06-01 08:03:42

--
-- PostgreSQL database dump complete
--

