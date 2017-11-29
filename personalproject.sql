PGDMP     3    3            
    u            PersonalProject    9.6.4    9.6.3 "    o           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            p           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            q           1262    24585    PersonalProject    DATABASE     �   CREATE DATABASE "PersonalProject" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
 !   DROP DATABASE "PersonalProject";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            r           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            s           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    24614    events    TABLE     �  CREATE TABLE events (
    id integer NOT NULL,
    user_id integer,
    title text NOT NULL,
    description text NOT NULL,
    date text NOT NULL,
    starttime text NOT NULL,
    endtime text NOT NULL,
    venue text,
    address text NOT NULL,
    city text NOT NULL,
    zipcode text NOT NULL,
    imageurl text NOT NULL,
    category text NOT NULL,
    perks text,
    quantofvols integer
);
    DROP TABLE public.events;
       public         postgres    false    3            �            1259    24612    events_id_seq    SEQUENCE     o   CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.events_id_seq;
       public       postgres    false    188    3            t           0    0    events_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE events_id_seq OWNED BY events.id;
            public       postgres    false    187            �            1259    24651    rosters    TABLE     i   CREATE TABLE rosters (
    id integer NOT NULL,
    event_id integer,
    phone character varying(20)
);
    DROP TABLE public.rosters;
       public         postgres    false    3            �            1259    24656    subscriptions    TABLE     c   CREATE TABLE subscriptions (
    id integer NOT NULL,
    event_id integer,
    user_id integer
);
 !   DROP TABLE public.subscriptions;
       public         postgres    false    3            �            1259    24659    subscriptions_id_seq    SEQUENCE     v   CREATE SEQUENCE subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.subscriptions_id_seq;
       public       postgres    false    3    190            u           0    0    subscriptions_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE subscriptions_id_seq OWNED BY subscriptions.id;
            public       postgres    false    191            �            1259    24603    users    TABLE     D  CREATE TABLE users (
    id integer NOT NULL,
    firstname character varying(20),
    lastname character varying(35),
    email character varying(100),
    city character varying(100),
    state character varying(100),
    zipcode character varying(5),
    bio character varying(500),
    auth_id text,
    picture text
);
    DROP TABLE public.users;
       public         postgres    false    3            �            1259    24601    users_id_seq    SEQUENCE     n   CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    186    3            v           0    0    users_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE users_id_seq OWNED BY users.id;
            public       postgres    false    185            �           2604    24617 	   events id    DEFAULT     X   ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);
 8   ALTER TABLE public.events ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    188    187    188            �           2604    24661    subscriptions id    DEFAULT     f   ALTER TABLE ONLY subscriptions ALTER COLUMN id SET DEFAULT nextval('subscriptions_id_seq'::regclass);
 ?   ALTER TABLE public.subscriptions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    190            �           2604    24606    users id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    186    185    186            i          0    24614    events 
   TABLE DATA                     public       postgres    false    188   �"       w           0    0    events_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('events_id_seq', 492, true);
            public       postgres    false    187            j          0    24651    rosters 
   TABLE DATA                     public       postgres    false    189   �1       k          0    24656    subscriptions 
   TABLE DATA                     public       postgres    false    190   �1       x           0    0    subscriptions_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('subscriptions_id_seq', 47, true);
            public       postgres    false    191            g          0    24603    users 
   TABLE DATA                     public       postgres    false    186   �2       y           0    0    users_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('users_id_seq', 13, true);
            public       postgres    false    185            �           2606    24622    events events_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
       public         postgres    false    188    188            �           2606    24655    rosters rosters_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY rosters
    ADD CONSTRAINT rosters_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.rosters DROP CONSTRAINT rosters_pkey;
       public         postgres    false    189    189            �           2606    24663     subscriptions subscriptions_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.subscriptions DROP CONSTRAINT subscriptions_pkey;
       public         postgres    false    190    190            �           2606    24611    users users_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    186    186            �           2606    24623    events events_user_id_fkey    FK CONSTRAINT     k   ALTER TABLE ONLY events
    ADD CONSTRAINT events_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);
 D   ALTER TABLE ONLY public.events DROP CONSTRAINT events_user_id_fkey;
       public       postgres    false    186    188    2023            �           2606    24668 )   subscriptions subscriptions_event_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_event_id_fkey FOREIGN KEY (event_id) REFERENCES events(id);
 S   ALTER TABLE ONLY public.subscriptions DROP CONSTRAINT subscriptions_event_id_fkey;
       public       postgres    false    190    2025    188            �           2606    24673 (   subscriptions subscriptions_user_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);
 R   ALTER TABLE ONLY public.subscriptions DROP CONSTRAINT subscriptions_user_id_fkey;
       public       postgres    false    190    2023    186            i   4  x��ms�6���S �|wcI���N���C����vr}ՁH��	,@J�}��)Zv�4��Τ��Ȇ(\�@���/^�z���|�����M�Ǭ�����R�J�P��Ȣ�:�7��C��,eI��ur��C#�=f�,w��?�t�e�cQ@�6�a!L
g�Q���F+�w��������t�:f?_����S�8{Q^j�"x��`g:�������쵰��pu�'eY|7EJo�r	�����@g�m14\����P��v4���ț�
m���1��}�h�ލ����[L{�M���f�ܤ�YvQ!ʛ�0���=��Y�X9��4�=�;������7�F:>fK����d:r_��rȚ]T2��`�ƙv��\��g!B��iU�c����a<c�P��cVj�M�s��r�y^A�����Gqs�-�C�̡:fW��l�� a[�[���2x�SW/1�g��uE<��
������R!3�+�C�3�3�8�wvC�e���!�xN���c��<�{i0~5��<D2Q��
7�9���;�K�Vbe5l�z�q��;�ߠjb0�u813Y�X�~�9�J��Y���!{S2io�������ci*0#+x .ΝQ{ϊ~f2�4m�������FK���s���_����){�|�^���0quy����Ì[��<'�5�5G�bkGE�K�h5�������@q���\=h��G8;TW[
0�:����a���&�<R)�!�Ɛ�Hy��Pތ�G�#�=���<R)��� ��Hy��%)��G�{ �Hy�<R�(��Hz$=��CH�'��Hz�Do鷁I�kF�_bq!�򵍜�?�B�[pz�wo;��H�ʜ�3�a�����������ݏ���K99��z��pq�(�������^��[�94��TN�/�(�%x���F�U� �_�X�FV��D�^���l��,[797B������J:� �������A�d˻^����M���W�����6um��[���W�?3��_E�7��n���J�q#m�
�����]�<ag�,�����������$�֦Cb�)�J�^m�h#��6�c��.i%��]mK��XA+�=�Gxb�Z�������w���ԫ��X�¸.�5��8h�3�b�Zf\YwfRA�݊L��4�`��z��.)t*x����b�4�N�] �5)#��h����(hQ��~1�.�^�'�h�� mK�:3	ֹ�Y�+��֍�27U��(��{�r��0R�< �� *7���u���Q�? ��D�M���`]��i�y1����lɲw��'~6��J�͑/����aj���U�h<�ݏ���Za'��H*��8���S���it�_:��Ӻ�3�t�Mά�2��LI�$Ӯ�tJ2%��L�.�ɔdJ2��L�$S�)ɴ�2]�LI�$Ӯ�tI2%��L�.�ɔdJ2��L�ɔdJ2��L}�)ɔd�u��F'`���c�e�cm]PŘ��M�0E�5����:�)O���	OC{��F��c�7�K�A"�XL�G<�P�m�2�{�$o��Jd��6r��w�_�Ov����1�H("^�rw	5-�������B�:��D�XtL��[�{9OF���w"ǝ��xB���t�D��tfD��t�D��tD��t�D��tVD��t&��0��t��9>E:8 �"1Җ�17�v�u�Ba��y+��O��:���?k�Ƴ��f�ky���"�� \&s��\�g�Ր]�r#�������f�n�ۡ(���
,�<N�*�/��Yx��b��'S7�U�
�xRJ�)��±]`x��V�Eo�}z��czS��cz3��czs��cz��czK��cz+��_zS�����O�zLo|�������Z����	C� �zբ��_a�<��:%:��ohI���0����ߊ�h��%�=�u"�P��{��F�rt�H������=W����N�b2���*#�R�Â_��LS��L3��Ls��L��LK��L+��L3�0��O�z�i	��?:?܊T]�X�8P�U������r���qB�8���TE6��	���i��R�a8°snR������9��=�:���>g1���P�&cH�b2�Vbƽp=��`��f��"XO���r��֪��U�u���`�Ȳ=*>��Hm�h�v�r��ueKv���K��i;���_��>�Ϋ����1�?_�Nq�}�5K֫�p�*��4 [�p�k��bg$ϙQ�|r� nGP`�N�����Ϥ���^P;�Ϯ�����#��'p��2��GT�&�fvJ��	��e"vl��>P8��;7<(e �s_屒6yv�t6���Ҩ79�p�h=��$���fNV
*�����(�,riO*�.p;��|�N���qX732(�9�V�,�ۼ��sꙡ�
N�q&i�Kw�3(OV��ù��Y:o&Y���Ħ\M��n'�TO��tμq-�Fxyiv�]��v���A����1�!ov�no�{/��jq؀�Џ�b'2�#h�p�MX`�wm1��#�ܠ�j狍[�[�Wa8���M����L�ӕ�T��w�����<u�*�����ٚMH�$bq�E<%��I���DL"&�[�s1��D�o/H�$bq�E�$��I���DL"&�Z�s�DL"&�[�>��DL")b�DL"'�l%<WH�V�v��l��_�NHOp?�����4t����u�`��`� ۛ@�:u�rep�fs*�T��*~�c 8ϴXsǐ���ۘ������/�l�=æ��(��3��SB�U43B�U4sB�U4B�U4KB�U4+B�Q4��t�Oh��fLh��fr̖wИ�N��R� �����*��X��R	7�8�M	v�c�_��\>?��m��O8���g��kL�|�{Y���]�y���Ѻgf����1�K��zuJ�ߍ7ٓ����PRD���V �)�9��9�9�9��9�%�9��7��G{N�'�='8&�='Hc2}'8����b}��}�|���Q�]�G�wI|3ߕG|5_��>j�c����N��c�;Ł�f���b�g�q���B�<��+�{�#�,�#vp�q=�
ni�1Ł�&</v�P��R��8,ӕa��t �pX;�l��oq��A�9���Gs�]0>~�.J<�bb9�{�jL�͸��f"�U�*O�?���7���v�Z����R�o)'��[���7���*�E�~4`EhY�d��q���X�p�(�IJ�7o��B�P2^2�������}Fn�������ޠ:���*¯��nh�)�ގ_����-�6$Ň�(�]M�A��Ph;�C1��`8����,��C��ဗ,Ӡ)�@�7��9p9d8]N'�_��i�O��B+
����L����F���i�_��	~I��&�����0���}"�Dɏ��%?!�O����?Q�v����(i��F���Z����$[7�zg����]�F��#�px:Ä��W"9|'�4:��C\�������ޜ���� o~3o�'K��7��7;��-��������2O��/}���'{_�`�&z��z7a������z~���S��j��w�^ܟ}�׃�|���˪��'����+�#�E4�:j��k�a�����G�>k�#���r�.���r_���t/כ
����*�G�,֍�C}��������=��? u�'�?�՗����>�����k�����W�G�VJޣ�}�~QQ�>�S(�����t�{�å�|���T��Ն׽������׷�}����E|�y��vC~�&X7ϟ?�F��x�vO�ٳ�|x��      j   
   x���          k   �   x���=o�0��=��F�<p>�Iԉ�!R�J|���f�BQ��ua�������m�����O�o���4^���2�j�u2܇���<��aJ�����iw�U��N��E���D�V*D�������4يn���"�Q���&0L*� &"�h�05��T��g|�XF�����S�/���?u]TQPMAن���<
b���0�PM�t`~���&0Sr`J�%�M��E      g   �  x�ݖ]��0���+��3l���Ko�e[�c[w�f'��$xِv��7�n�ut.��!!�	���O�6ȾU���d'T�KZ�K$}VPP!]�}tI��6�wQ%�t	�k�`�W"�{���l����E�g!��<:F��hR���+��l�fv�~��m�Q�i���rr=�+"BR�+P��`����&��DsP@h�	����7�V��-/_��4��{GK���`s�L5E����}/NA���B�XZU��Sct������y���1Ƶ�ݣZZh)�g+k��cٯ�D�4�!N�b���;��VH)Z�5Gs����?{ݣ����\���EU�?���%m�{�S�w�>Qռ��c�lf�5OF���nR� �����:��s�Ջ�F6h�_q�g�.cy��yƚ��!2	Whc�?�`8��d0���$���o�q�����I>�],y���R�Q���K�����g��|Dg}�o�i�v�|�֩�U5����3���O>qj,     