PGDMP     8    2                z            dbproje    15.1    15.1 O    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16519    dbproje    DATABASE     {   CREATE DATABASE dbproje WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE dbproje;
                postgres    false            ?            1255    16699    futbolcuarttir()    FUNCTION     ?   CREATE FUNCTION public.futbolcuarttir() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
 begin
 update toplamfutbolcu set sayi=sayi+1;
 return new;
 end;
 $$;
 '   DROP FUNCTION public.futbolcuarttir();
       public          postgres    false            ?            1255    16701    futbolcuazalt()    FUNCTION     ?   CREATE FUNCTION public.futbolcuazalt() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
 begin
 update toplamfutbolcu set sayi=sayi-1;
 return new;
 end;
 $$;
 &   DROP FUNCTION public.futbolcuazalt();
       public          postgres    false            ?            1255    16705    makskadrodegeri()    FUNCTION     ?   CREATE FUNCTION public.makskadrodegeri() RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
DECLARE
makskadrodegeri integer; 
BEGIN 
makskadrodegeri:=(SELECT MAX("kadrodegeri")FROM "takimlar"); 
RETURN makskadrodegeri; 
END; 
$$;
 (   DROP FUNCTION public.makskadrodegeri();
       public          postgres    false            ?            1255    16703 	   makspyd()    FUNCTION     ?   CREATE FUNCTION public.makspyd() RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
DECLARE
makspyd integer; 
BEGIN 
makspyd:=(SELECT MAX("piyasadegeri")FROM "futbolcular"); 
RETURN makspyd; 
END; 
$$;
     DROP FUNCTION public.makspyd();
       public          postgres    false            ?            1255    16704 	   maksyas()    FUNCTION     ?   CREATE FUNCTION public.maksyas() RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
DECLARE
maksyas integer; 
BEGIN 
maksyas:=(SELECT MAX("yasi")FROM "futbolcular"); 
RETURN maksyas; 
END; 
$$;
     DROP FUNCTION public.maksyas();
       public          postgres    false            ?            1255    16707    minyas()    FUNCTION     ?   CREATE FUNCTION public.minyas() RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
DECLARE
minyas integer; 
BEGIN 
minyas:=(SELECT MAX("yasi")FROM "futbolcular"); 
RETURN minyas; 
END; 
$$;
    DROP FUNCTION public.minyas();
       public          postgres    false            ?            1255    16706    minyasort()    FUNCTION     ?   CREATE FUNCTION public.minyasort() RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
DECLARE
minyasort integer; 
BEGIN 
minyasort:=(SELECT MAX("yasortalamasi")FROM "takimlar"); 
RETURN minyasort; 
END; 
$$;
 "   DROP FUNCTION public.minyasort();
       public          postgres    false            ?            1255    16692    takimarttir()    FUNCTION     ?   CREATE FUNCTION public.takimarttir() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update toplamtakim set sayi=sayi+1;
return new;
end;
$$;
 $   DROP FUNCTION public.takimarttir();
       public          postgres    false            ?            1255    16694    takimazalt()    FUNCTION     ?   CREATE FUNCTION public.takimazalt() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update toplamtakim set sayi=sayi-1;
return new;
end;
$$;
 #   DROP FUNCTION public.takimazalt();
       public          postgres    false            ?            1259    16520    asistkralligi    TABLE     ?   CREATE TABLE public.asistkralligi (
    insanid integer NOT NULL,
    lidadi character varying NOT NULL,
    oyuncuadi character varying NOT NULL,
    oyuncutakimi character varying NOT NULL,
    asistsayisi integer NOT NULL
);
 !   DROP TABLE public.asistkralligi;
       public         heap    postgres    false            ?            1259    16682    futbolcular    TABLE     \  CREATE TABLE public.futbolcular (
    insanid integer NOT NULL,
    adi character varying NOT NULL,
    yasi integer NOT NULL,
    ulkesi character varying NOT NULL,
    gorevi character varying NOT NULL,
    takimi character varying NOT NULL,
    mevkisi character varying NOT NULL,
    boyu integer NOT NULL,
    piyasadegeri integer NOT NULL
);
    DROP TABLE public.futbolcular;
       public         heap    postgres    false            ?            1259    16562    golkralligi    TABLE     ?   CREATE TABLE public.golkralligi (
    insanid integer NOT NULL,
    ligadi character varying NOT NULL,
    oyuncuadi character varying NOT NULL,
    oyuncutakimi character varying NOT NULL,
    golsayisi integer NOT NULL
);
    DROP TABLE public.golkralligi;
       public         heap    postgres    false            ?            1259    16527    insan    TABLE     ?   CREATE TABLE public.insan (
    insanid integer NOT NULL,
    adi character varying NOT NULL,
    yasi integer NOT NULL,
    ulkesi character varying NOT NULL,
    gorevi character varying NOT NULL
);
    DROP TABLE public.insan;
       public         heap    postgres    false            ?            1259    16555    hakemler    TABLE     ?   CREATE TABLE public.hakemler (
    insanid integer,
    ligi character varying NOT NULL,
    yonettigimacsayisi character varying NOT NULL
)
INHERITS (public.insan);
    DROP TABLE public.hakemler;
       public         heap    postgres    false    215            ?            1259    16569 
   istatistik    TABLE     ?   CREATE TABLE public.istatistik (
    insanid integer NOT NULL,
    futbolcuadi character varying NOT NULL,
    oynadigimacsayisi integer NOT NULL,
    gol integer NOT NULL,
    asist integer NOT NULL,
    oduller character varying NOT NULL
);
    DROP TABLE public.istatistik;
       public         heap    postgres    false            ?            1259    16576    ligler    TABLE       CREATE TABLE public.ligler (
    ligid integer NOT NULL,
    ligadi character varying NOT NULL,
    ulkesi character varying NOT NULL,
    oyuncusayisi integer NOT NULL,
    takimsayisi integer NOT NULL,
    toplampiyasadegeri integer NOT NULL,
    ortalamayas integer NOT NULL
);
    DROP TABLE public.ligler;
       public         heap    postgres    false            ?            1259    16583 
   puandurumu    TABLE     _  CREATE TABLE public.puandurumu (
    ligid integer NOT NULL,
    ligadi character varying NOT NULL,
    sezon integer NOT NULL,
    puani integer NOT NULL,
    oynananmacsayisi integer NOT NULL,
    galibiyet integer NOT NULL,
    beraberlik integer NOT NULL,
    maglubiyet integer NOT NULL,
    averaj integer NOT NULL,
    sira integer NOT NULL
);
    DROP TABLE public.puandurumu;
       public         heap    postgres    false            ?            1259    16590    sakatliklar    TABLE       CREATE TABLE public.sakatliklar (
    insanid integer NOT NULL,
    futbolcuadi character varying NOT NULL,
    takimi character varying NOT NULL,
    sakatlik character varying NOT NULL,
    yas integer NOT NULL,
    yaklasikiyilesmetarihi date NOT NULL
);
    DROP TABLE public.sakatliklar;
       public         heap    postgres    false            ?            1259    16597    sampiyonlar    TABLE     ?   CREATE TABLE public.sampiyonlar (
    takimid integer NOT NULL,
    sezon character varying NOT NULL,
    lig character varying NOT NULL,
    sampiyontakim character varying NOT NULL
);
    DROP TABLE public.sampiyonlar;
       public         heap    postgres    false            ?            1259    16604    statlar    TABLE     ?   CREATE TABLE public.statlar (
    statid integer NOT NULL,
    adi character varying NOT NULL,
    takim character varying NOT NULL,
    kapasite integer NOT NULL
);
    DROP TABLE public.statlar;
       public         heap    postgres    false            ?            1259    16611    takimlar    TABLE     l  CREATE TABLE public.takimlar (
    takimid integer NOT NULL,
    takimadi character varying NOT NULL,
    oyuncusayisi character varying NOT NULL,
    yasortalamasi integer NOT NULL,
    kadrodegeri integer NOT NULL,
    ulkesi character varying NOT NULL,
    ligi character varying NOT NULL,
    stat character varying NOT NULL,
    ligsirasi integer NOT NULL
);
    DROP TABLE public.takimlar;
       public         heap    postgres    false            ?            1259    16548    teknikdirektorler    TABLE     ?   CREATE TABLE public.teknikdirektorler (
    insanid integer,
    takimi character varying NOT NULL,
    odulleri character varying NOT NULL
)
INHERITS (public.insan);
 %   DROP TABLE public.teknikdirektorler;
       public         heap    postgres    false    215            ?            1259    16696    toplamfutbolcu    TABLE     9   CREATE TABLE public.toplamfutbolcu (
    sayi integer
);
 "   DROP TABLE public.toplamfutbolcu;
       public         heap    postgres    false            ?            1259    16689    toplamtakim    TABLE     6   CREATE TABLE public.toplamtakim (
    sayi integer
);
    DROP TABLE public.toplamtakim;
       public         heap    postgres    false            ?            1259    16619    uefakuluplersiralamsi    TABLE     ?   CREATE TABLE public.uefakuluplersiralamsi (
    takimid integer NOT NULL,
    kulupadi character varying NOT NULL,
    ulkesi character varying NOT NULL,
    son5yilinpuani integer NOT NULL,
    toplampuan integer NOT NULL,
    sira integer NOT NULL
);
 )   DROP TABLE public.uefakuluplersiralamsi;
       public         heap    postgres    false            ?            1259    16626    ulkeler    TABLE     ?   CREATE TABLE public.ulkeler (
    ulkeid integer NOT NULL,
    ulkeadi character varying NOT NULL,
    millitakimlari character varying NOT NULL
);
    DROP TABLE public.ulkeler;
       public         heap    postgres    false            ?            1259    16633    yilinfutbolcusu    TABLE        CREATE TABLE public.yilinfutbolcusu (
    insanid integer NOT NULL,
    yil integer NOT NULL,
    futbolcuadi character varying NOT NULL,
    ozamankikulubu character varying NOT NULL,
    ozamankiyasi integer NOT NULL,
    ozamankipyd integer NOT NULL
);
 #   DROP TABLE public.yilinfutbolcusu;
       public         heap    postgres    false            m          0    16520    asistkralligi 
   TABLE DATA           ^   COPY public.asistkralligi (insanid, lidadi, oyuncuadi, oyuncutakimi, asistsayisi) FROM stdin;
    public          postgres    false    214   Qa       |          0    16682    futbolcular 
   TABLE DATA           n   COPY public.futbolcular (insanid, adi, yasi, ulkesi, gorevi, takimi, mevkisi, boyu, piyasadegeri) FROM stdin;
    public          postgres    false    229   na       q          0    16562    golkralligi 
   TABLE DATA           Z   COPY public.golkralligi (insanid, ligadi, oyuncuadi, oyuncutakimi, golsayisi) FROM stdin;
    public          postgres    false    218   ?a       p          0    16555    hakemler 
   TABLE DATA           `   COPY public.hakemler (insanid, adi, yasi, ulkesi, gorevi, ligi, yonettigimacsayisi) FROM stdin;
    public          postgres    false    217   ?a       n          0    16527    insan 
   TABLE DATA           C   COPY public.insan (insanid, adi, yasi, ulkesi, gorevi) FROM stdin;
    public          postgres    false    215   b       r          0    16569 
   istatistik 
   TABLE DATA           b   COPY public.istatistik (insanid, futbolcuadi, oynadigimacsayisi, gol, asist, oduller) FROM stdin;
    public          postgres    false    219   0b       s          0    16576    ligler 
   TABLE DATA           s   COPY public.ligler (ligid, ligadi, ulkesi, oyuncusayisi, takimsayisi, toplampiyasadegeri, ortalamayas) FROM stdin;
    public          postgres    false    220   Mb       t          0    16583 
   puandurumu 
   TABLE DATA           ?   COPY public.puandurumu (ligid, ligadi, sezon, puani, oynananmacsayisi, galibiyet, beraberlik, maglubiyet, averaj, sira) FROM stdin;
    public          postgres    false    221   jb       u          0    16590    sakatliklar 
   TABLE DATA           j   COPY public.sakatliklar (insanid, futbolcuadi, takimi, sakatlik, yas, yaklasikiyilesmetarihi) FROM stdin;
    public          postgres    false    222   ?b       v          0    16597    sampiyonlar 
   TABLE DATA           I   COPY public.sampiyonlar (takimid, sezon, lig, sampiyontakim) FROM stdin;
    public          postgres    false    223   ?b       w          0    16604    statlar 
   TABLE DATA           ?   COPY public.statlar (statid, adi, takim, kapasite) FROM stdin;
    public          postgres    false    224   ?b       x          0    16611    takimlar 
   TABLE DATA           ~   COPY public.takimlar (takimid, takimadi, oyuncusayisi, yasortalamasi, kadrodegeri, ulkesi, ligi, stat, ligsirasi) FROM stdin;
    public          postgres    false    225   ?b       o          0    16548    teknikdirektorler 
   TABLE DATA           a   COPY public.teknikdirektorler (insanid, adi, yasi, ulkesi, gorevi, takimi, odulleri) FROM stdin;
    public          postgres    false    216   Wc       ~          0    16696    toplamfutbolcu 
   TABLE DATA           .   COPY public.toplamfutbolcu (sayi) FROM stdin;
    public          postgres    false    231   tc       }          0    16689    toplamtakim 
   TABLE DATA           +   COPY public.toplamtakim (sayi) FROM stdin;
    public          postgres    false    230   ?c       y          0    16619    uefakuluplersiralamsi 
   TABLE DATA           l   COPY public.uefakuluplersiralamsi (takimid, kulupadi, ulkesi, son5yilinpuani, toplampuan, sira) FROM stdin;
    public          postgres    false    226   ?c       z          0    16626    ulkeler 
   TABLE DATA           B   COPY public.ulkeler (ulkeid, ulkeadi, millitakimlari) FROM stdin;
    public          postgres    false    227   ?c       {          0    16633    yilinfutbolcusu 
   TABLE DATA           o   COPY public.yilinfutbolcusu (insanid, yil, futbolcuadi, ozamankikulubu, ozamankiyasi, ozamankipyd) FROM stdin;
    public          postgres    false    228   ?c       ?           2606    16526     asistkralligi asistkralligi_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.asistkralligi
    ADD CONSTRAINT asistkralligi_pkey PRIMARY KEY (insanid);
 J   ALTER TABLE ONLY public.asistkralligi DROP CONSTRAINT asistkralligi_pkey;
       public            postgres    false    214            ?           2606    16688    futbolcular futbolcular_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.futbolcular
    ADD CONSTRAINT futbolcular_pkey PRIMARY KEY (insanid);
 F   ALTER TABLE ONLY public.futbolcular DROP CONSTRAINT futbolcular_pkey;
       public            postgres    false    229            ?           2606    16568    golkralligi golkralligi_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.golkralligi
    ADD CONSTRAINT golkralligi_pkey PRIMARY KEY (insanid);
 F   ALTER TABLE ONLY public.golkralligi DROP CONSTRAINT golkralligi_pkey;
       public            postgres    false    218            ?           2606    16561    hakemler hakemler_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.hakemler
    ADD CONSTRAINT hakemler_pkey PRIMARY KEY (insanid);
 @   ALTER TABLE ONLY public.hakemler DROP CONSTRAINT hakemler_pkey;
       public            postgres    false    217            ?           2606    16533    insan insan_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.insan
    ADD CONSTRAINT insan_pkey PRIMARY KEY (insanid);
 :   ALTER TABLE ONLY public.insan DROP CONSTRAINT insan_pkey;
       public            postgres    false    215            ?           2606    16575    istatistik istatistik_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.istatistik
    ADD CONSTRAINT istatistik_pkey PRIMARY KEY (insanid);
 D   ALTER TABLE ONLY public.istatistik DROP CONSTRAINT istatistik_pkey;
       public            postgres    false    219            ?           2606    16582    ligler ligler_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.ligler
    ADD CONSTRAINT ligler_pkey PRIMARY KEY (ligid);
 <   ALTER TABLE ONLY public.ligler DROP CONSTRAINT ligler_pkey;
       public            postgres    false    220            ?           2606    16589    puandurumu puandurumu_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.puandurumu
    ADD CONSTRAINT puandurumu_pkey PRIMARY KEY (ligid);
 D   ALTER TABLE ONLY public.puandurumu DROP CONSTRAINT puandurumu_pkey;
       public            postgres    false    221            ?           2606    16596    sakatliklar sakatliklar_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.sakatliklar
    ADD CONSTRAINT sakatliklar_pkey PRIMARY KEY (insanid);
 F   ALTER TABLE ONLY public.sakatliklar DROP CONSTRAINT sakatliklar_pkey;
       public            postgres    false    222            ?           2606    16603    sampiyonlar sampiyonlar_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.sampiyonlar
    ADD CONSTRAINT sampiyonlar_pkey PRIMARY KEY (takimid);
 F   ALTER TABLE ONLY public.sampiyonlar DROP CONSTRAINT sampiyonlar_pkey;
       public            postgres    false    223            ?           2606    16610    statlar statlar_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.statlar
    ADD CONSTRAINT statlar_pkey PRIMARY KEY (statid);
 >   ALTER TABLE ONLY public.statlar DROP CONSTRAINT statlar_pkey;
       public            postgres    false    224            ?           2606    16617    takimlar takimlar_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.takimlar
    ADD CONSTRAINT takimlar_pkey PRIMARY KEY (takimid);
 @   ALTER TABLE ONLY public.takimlar DROP CONSTRAINT takimlar_pkey;
       public            postgres    false    225            ?           2606    16554 (   teknikdirektorler teknikdirektorler_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.teknikdirektorler
    ADD CONSTRAINT teknikdirektorler_pkey PRIMARY KEY (insanid);
 R   ALTER TABLE ONLY public.teknikdirektorler DROP CONSTRAINT teknikdirektorler_pkey;
       public            postgres    false    216            ?           2606    16625 0   uefakuluplersiralamsi uefakuluplersiralamsi_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.uefakuluplersiralamsi
    ADD CONSTRAINT uefakuluplersiralamsi_pkey PRIMARY KEY (takimid);
 Z   ALTER TABLE ONLY public.uefakuluplersiralamsi DROP CONSTRAINT uefakuluplersiralamsi_pkey;
       public            postgres    false    226            ?           2606    16632    ulkeler ulkeler_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ulkeler
    ADD CONSTRAINT ulkeler_pkey PRIMARY KEY (ulkeid);
 >   ALTER TABLE ONLY public.ulkeler DROP CONSTRAINT ulkeler_pkey;
       public            postgres    false    227            ?           2606    16639 $   yilinfutbolcusu yilinfutbolcusu_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.yilinfutbolcusu
    ADD CONSTRAINT yilinfutbolcusu_pkey PRIMARY KEY (insanid);
 N   ALTER TABLE ONLY public.yilinfutbolcusu DROP CONSTRAINT yilinfutbolcusu_pkey;
       public            postgres    false    228            ?           1259    16681    fki_futbolcuistatistik_fk    INDEX     S   CREATE INDEX fki_futbolcuistatistik_fk ON public.istatistik USING btree (insanid);
 -   DROP INDEX public.fki_futbolcuistatistik_fk;
       public            postgres    false    219            ?           1259    16669    fki_hakeminsan_fk    INDEX     I   CREATE INDEX fki_hakeminsan_fk ON public.hakemler USING btree (insanid);
 %   DROP INDEX public.fki_hakeminsan_fk;
       public            postgres    false    217            ?           1259    16645    fki_puandurumlig_fk    INDEX     K   CREATE INDEX fki_puandurumlig_fk ON public.puandurumu USING btree (ligid);
 '   DROP INDEX public.fki_puandurumlig_fk;
       public            postgres    false    221            ?           1259    16663    fki_tdinsan_fk    INDEX     O   CREATE INDEX fki_tdinsan_fk ON public.teknikdirektorler USING btree (insanid);
 "   DROP INDEX public.fki_tdinsan_fk;
       public            postgres    false    216            ?           1259    16651    fki_uefakuluptakim_fk    INDEX     Z   CREATE INDEX fki_uefakuluptakim_fk ON public.uefakuluplersiralamsi USING btree (takimid);
 )   DROP INDEX public.fki_uefakuluptakim_fk;
       public            postgres    false    226            ?           1259    16675    fki_yilinfutbolcusu_fk    INDEX     U   CREATE INDEX fki_yilinfutbolcusu_fk ON public.yilinfutbolcusu USING btree (insanid);
 *   DROP INDEX public.fki_yilinfutbolcusu_fk;
       public            postgres    false    228            ?           2620    16700    futbolcular futbolcuarttirr    TRIGGER     y   CREATE TRIGGER futbolcuarttirr AFTER INSERT ON public.futbolcular FOR EACH ROW EXECUTE FUNCTION public.futbolcuarttir();
 4   DROP TRIGGER futbolcuarttirr ON public.futbolcular;
       public          postgres    false    234    229            ?           2620    16702    futbolcular futbolcuazaltt    TRIGGER     w   CREATE TRIGGER futbolcuazaltt AFTER DELETE ON public.futbolcular FOR EACH ROW EXECUTE FUNCTION public.futbolcuazalt();
 3   DROP TRIGGER futbolcuazaltt ON public.futbolcular;
       public          postgres    false    236    229            ?           2620    16693    takimlar takimarttirr    TRIGGER     p   CREATE TRIGGER takimarttirr AFTER INSERT ON public.takimlar FOR EACH ROW EXECUTE FUNCTION public.takimarttir();
 .   DROP TRIGGER takimarttirr ON public.takimlar;
       public          postgres    false    232    225            ?           2620    16695    takimlar takimazaltt    TRIGGER     n   CREATE TRIGGER takimazaltt AFTER DELETE ON public.takimlar FOR EACH ROW EXECUTE FUNCTION public.takimazalt();
 -   DROP TRIGGER takimazaltt ON public.takimlar;
       public          postgres    false    225    233            ?           2606    16664    hakemler hakeminsan_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.hakemler
    ADD CONSTRAINT hakeminsan_fk FOREIGN KEY (insanid) REFERENCES public.insan(insanid) NOT VALID;
 @   ALTER TABLE ONLY public.hakemler DROP CONSTRAINT hakeminsan_fk;
       public          postgres    false    3252    217    215            ?           2606    16640    puandurumu puandurumlig_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.puandurumu
    ADD CONSTRAINT puandurumlig_fk FOREIGN KEY (ligid) REFERENCES public.ligler(ligid) NOT VALID;
 D   ALTER TABLE ONLY public.puandurumu DROP CONSTRAINT puandurumlig_fk;
       public          postgres    false    221    220    3265            ?           2606    16658    teknikdirektorler tdinsan_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.teknikdirektorler
    ADD CONSTRAINT tdinsan_fk FOREIGN KEY (insanid) REFERENCES public.insan(insanid) NOT VALID;
 F   ALTER TABLE ONLY public.teknikdirektorler DROP CONSTRAINT tdinsan_fk;
       public          postgres    false    216    3252    215            ?           2606    16646 '   uefakuluplersiralamsi uefakuluptakim_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.uefakuluplersiralamsi
    ADD CONSTRAINT uefakuluptakim_fk FOREIGN KEY (takimid) REFERENCES public.takimlar(takimid) NOT VALID;
 Q   ALTER TABLE ONLY public.uefakuluplersiralamsi DROP CONSTRAINT uefakuluptakim_fk;
       public          postgres    false    226    3276    225            m      x?????? ? ?      |   [   x?E?A@0????HKw?ieH?????-????UBF?`Urzk?X??"??lA?Vn???S??U?A?pY??r놵???L??}??}      q      x?????? ? ?      p      x?????? ? ?      n      x?????? ? ?      r      x?????? ? ?      s      x?????? ? ?      t      x?????? ? ?      u      x?????? ? ?      v      x?????? ? ?      w      x?????? ? ?      x   i   x???1?0F???aP?R????%c??z??tyz??bї???Y!~??W?}?*??Q6??{???mG???tB"Xj;?y?y?e???>ޱt|?φ?~a?.?      o      x?????? ? ?      ~      x?3?????? a ?      }      x?3?????? v ?      y      x?????? ? ?      z      x?????? ? ?      {      x?????? ? ?     