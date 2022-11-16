--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-11-15 21:42:39 -03

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

DROP DATABASE uvv;
--
-- TOC entry 3352 (class 1262 OID 16398)
-- Name: uvv; Type: DATABASE; Schema: -; Owner: cleverton
--

CREATE DATABASE uvv WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'pt_BR.UTF-8';


ALTER DATABASE uvv OWNER TO cleverton;

\connect uvv

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
-- TOC entry 6 (class 2615 OID 16399)
-- Name: hr; Type: SCHEMA; Schema: -; Owner: cleverton
--

CREATE SCHEMA hr;


ALTER SCHEMA hr OWNER TO cleverton;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16425)
-- Name: cargos; Type: TABLE; Schema: hr; Owner: cleverton
--

CREATE TABLE hr.cargos (
    id_cargo character varying(10) NOT NULL,
    cargo character varying(35) NOT NULL,
    salario_minimo numeric(8,2),
    salario_maximo numeric(8,2)
);


ALTER TABLE hr.cargos OWNER TO cleverton;

--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE cargos; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON TABLE hr.cargos IS 'Tabela de Cargos que armazena o cargo propiamente dito, salario_minimo e salario_max';


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN cargos.id_cargo; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.cargos.id_cargo IS 'Id';


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN cargos.cargo; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.cargos.cargo IS 'Nome do Cargo';


--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN cargos.salario_minimo; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.cargos.salario_minimo IS 'Menor salário possivel para um cargo.';


--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN cargos.salario_maximo; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.cargos.salario_maximo IS 'Maior salário possivel para um cargo.';


--
-- TOC entry 213 (class 1259 OID 16417)
-- Name: departamentos; Type: TABLE; Schema: hr; Owner: cleverton
--

CREATE TABLE hr.departamentos (
    id_departamento integer NOT NULL,
    nome character varying(50),
    id_localizacao integer,
    id_gerente character varying
);


ALTER TABLE hr.departamentos OWNER TO cleverton;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE departamentos; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON TABLE hr.departamentos IS 'Tabela que armazena informações sobre os departamentos da empresa';


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN departamentos.id_departamento; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.departamentos.id_departamento IS 'Id';


--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN departamentos.nome; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.departamentos.nome IS 'Nome do Departamento';


--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN departamentos.id_localizacao; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.departamentos.id_localizacao IS 'Foreign Key da localização';


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN departamentos.id_gerente; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.departamentos.id_gerente IS 'Foreign Key do identificador do gerente';


--
-- TOC entry 215 (class 1259 OID 16431)
-- Name: empregados; Type: TABLE; Schema: hr; Owner: cleverton
--

CREATE TABLE hr.empregados (
    id_empregado integer NOT NULL,
    nome character varying(75) NOT NULL,
    email character varying(35) NOT NULL,
    telefone character varying(20),
    data_contratacao date NOT NULL,
    id_cargo character varying(10) NOT NULL,
    salario numeric(8,2),
    comissao numeric(4,2),
    id_departamento integer,
    id_supervisor integer NOT NULL,
    parent_id_empregado integer NOT NULL
);


ALTER TABLE hr.empregados OWNER TO cleverton;

--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE empregados; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON TABLE hr.empregados IS 'Tabela que contem informações pessoais e administrativas como salário/comissão etc';


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN empregados.nome; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.empregados.nome IS 'Nome completo';


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN empregados.email; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.empregados.email IS 'dados do email antes do @';


--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN empregados.telefone; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.empregados.telefone IS 'Telefone +xx (xx) xxxxx-xxxx';


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN empregados.data_contratacao; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.empregados.data_contratacao IS 'Data que o empregado foi admitido';


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN empregados.id_cargo; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.empregados.id_cargo IS 'Foreign Key do identificador do cargo';


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN empregados.salario; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.empregados.salario IS 'Salario do funcionario';


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN empregados.comissao; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.empregados.comissao IS 'Porcetagem de Comissão, Apenas empregados do departamento de vendas!';


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN empregados.id_departamento; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.empregados.id_departamento IS 'Foreign Key que indetifica o departamento do empregado';


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN empregados.id_supervisor; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.empregados.id_supervisor IS 'Foreign Key que identifica o supervisor';


--
-- TOC entry 216 (class 1259 OID 16437)
-- Name: historico_cargos; Type: TABLE; Schema: hr; Owner: cleverton
--

CREATE TABLE hr.historico_cargos (
    id_empregado integer NOT NULL,
    data_inicial date NOT NULL,
    data_final date NOT NULL,
    id_cargo character varying(10) NOT NULL,
    id_departamento integer
);


ALTER TABLE hr.historico_cargos OWNER TO cleverton;

--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE historico_cargos; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON TABLE hr.historico_cargos IS 'Apresenta o historico dos cargos dos funcionarios';


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN historico_cargos.id_empregado; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.historico_cargos.id_empregado IS '& Foreing Key da tabela empregados';


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN historico_cargos.data_inicial; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.historico_cargos.data_inicial IS 'Deve ser menor que a this.data_final';


--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN historico_cargos.data_final; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.historico_cargos.data_final IS 'Ultimo dia do funcionario atuando nesse cargo';


--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN historico_cargos.id_cargo; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.historico_cargos.id_cargo IS 'Foreign Key com o identificador do cargo';


--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN historico_cargos.id_departamento; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.historico_cargos.id_departamento IS 'Foreign key com o identificador do departamento.';


--
-- TOC entry 212 (class 1259 OID 16412)
-- Name: localizacoes; Type: TABLE; Schema: hr; Owner: cleverton
--

CREATE TABLE hr.localizacoes (
    id_localizacao integer NOT NULL,
    endereco character varying(50),
    cep character varying(12),
    cidade character varying(50),
    uf character varying(25),
    id_pais character(1)
);


ALTER TABLE hr.localizacoes OWNER TO cleverton;

--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE localizacoes; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON TABLE hr.localizacoes IS 'tabela com localizacoes uteis para a empresa.';


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN localizacoes.endereco; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.localizacoes.endereco IS 'Endereço (Logradouro,  numero).';


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN localizacoes.cep; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.localizacoes.cep IS 'CEP da localização';


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN localizacoes.cidade; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.localizacoes.cidade IS 'Cidade onde está localizada!';


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN localizacoes.uf; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.localizacoes.uf IS 'Estado da localização.';


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN localizacoes.id_pais; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.localizacoes.id_pais IS 'Foreign Key do pais.';


--
-- TOC entry 211 (class 1259 OID 16407)
-- Name: paises; Type: TABLE; Schema: hr; Owner: cleverton
--

CREATE TABLE hr.paises (
    id_pais character(1) NOT NULL,
    nome character varying(50) NOT NULL,
    id_regiao integer
);


ALTER TABLE hr.paises OWNER TO cleverton;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE paises; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON TABLE hr.paises IS 'Tabela com os paises';


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN paises.nome; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.paises.nome IS 'Nome do pais.';


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN paises.id_regiao; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.paises.id_regiao IS 'Foreign Key da tabela regioes';


--
-- TOC entry 210 (class 1259 OID 16400)
-- Name: regioes; Type: TABLE; Schema: hr; Owner: cleverton
--

CREATE TABLE hr.regioes (
    id_regiao integer NOT NULL,
    nome character varying(25) NOT NULL
);


ALTER TABLE hr.regioes OWNER TO cleverton;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE regioes; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON TABLE hr.regioes IS 'Tabela de regiões';


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN regioes.id_regiao; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.regioes.id_regiao IS 'Identificador da região';


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN regioes.nome; Type: COMMENT; Schema: hr; Owner: cleverton
--

COMMENT ON COLUMN hr.regioes.nome IS 'nome da região';


--
-- TOC entry 3193 (class 2606 OID 16429)
-- Name: cargos id_cargo; Type: CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.cargos
    ADD CONSTRAINT id_cargo PRIMARY KEY (id_cargo);


--
-- TOC entry 3190 (class 2606 OID 16423)
-- Name: departamentos id_departamento; Type: CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.departamentos
    ADD CONSTRAINT id_departamento PRIMARY KEY (id_departamento);


--
-- TOC entry 3198 (class 2606 OID 16441)
-- Name: historico_cargos id_empregado; Type: CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.historico_cargos
    ADD CONSTRAINT id_empregado PRIMARY KEY (id_empregado, data_inicial);


--
-- TOC entry 3196 (class 2606 OID 16435)
-- Name: empregados id_empregados; Type: CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.empregados
    ADD CONSTRAINT id_empregados PRIMARY KEY (id_empregado);


--
-- TOC entry 3187 (class 2606 OID 16416)
-- Name: localizacoes id_localizacao; Type: CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.localizacoes
    ADD CONSTRAINT id_localizacao PRIMARY KEY (id_localizacao);


--
-- TOC entry 3185 (class 2606 OID 16411)
-- Name: paises id_pais; Type: CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.paises
    ADD CONSTRAINT id_pais PRIMARY KEY (id_pais);


--
-- TOC entry 3181 (class 2606 OID 16404)
-- Name: regioes id_regiao; Type: CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.regioes
    ADD CONSTRAINT id_regiao PRIMARY KEY (id_regiao);


--
-- TOC entry 3191 (class 1259 OID 16430)
-- Name: cargos_idx; Type: INDEX; Schema: hr; Owner: cleverton
--

CREATE UNIQUE INDEX cargos_idx ON hr.cargos USING btree (cargo);


--
-- TOC entry 3188 (class 1259 OID 16424)
-- Name: departamentos_idx; Type: INDEX; Schema: hr; Owner: cleverton
--

CREATE UNIQUE INDEX departamentos_idx ON hr.departamentos USING btree (nome);


--
-- TOC entry 3194 (class 1259 OID 16436)
-- Name: empregados_idx; Type: INDEX; Schema: hr; Owner: cleverton
--

CREATE UNIQUE INDEX empregados_idx ON hr.empregados USING btree (email);


--
-- TOC entry 3182 (class 1259 OID 16405)
-- Name: regioes_idx; Type: INDEX; Schema: hr; Owner: cleverton
--

CREATE INDEX regioes_idx ON hr.regioes USING btree (nome);


--
-- TOC entry 3183 (class 1259 OID 16406)
-- Name: regioes_idx1; Type: INDEX; Schema: hr; Owner: cleverton
--

CREATE UNIQUE INDEX regioes_idx1 ON hr.regioes USING btree (nome);


--
-- TOC entry 3203 (class 2606 OID 16467)
-- Name: empregados cargos_empregados_fk; Type: FK CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.empregados
    ADD CONSTRAINT cargos_empregados_fk FOREIGN KEY (id_cargo) REFERENCES hr.cargos(id_cargo);


--
-- TOC entry 3206 (class 2606 OID 16472)
-- Name: historico_cargos cargos_historico_cargos_fk; Type: FK CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.historico_cargos
    ADD CONSTRAINT cargos_historico_cargos_fk FOREIGN KEY (id_cargo) REFERENCES hr.cargos(id_cargo);


--
-- TOC entry 3202 (class 2606 OID 16462)
-- Name: empregados departamentos_empregados_fk; Type: FK CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.empregados
    ADD CONSTRAINT departamentos_empregados_fk FOREIGN KEY (id_departamento) REFERENCES hr.departamentos(id_departamento);


--
-- TOC entry 3205 (class 2606 OID 16457)
-- Name: historico_cargos departamentos_historico_cargos_fk; Type: FK CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.historico_cargos
    ADD CONSTRAINT departamentos_historico_cargos_fk FOREIGN KEY (id_departamento) REFERENCES hr.departamentos(id_departamento);


--
-- TOC entry 3204 (class 2606 OID 16482)
-- Name: empregados empregados_empregados_fk; Type: FK CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.empregados
    ADD CONSTRAINT empregados_empregados_fk FOREIGN KEY (parent_id_empregado) REFERENCES hr.empregados(id_empregado);


--
-- TOC entry 3207 (class 2606 OID 16477)
-- Name: historico_cargos empregados_historico_cargos_fk; Type: FK CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.historico_cargos
    ADD CONSTRAINT empregados_historico_cargos_fk FOREIGN KEY (id_empregado) REFERENCES hr.empregados(id_empregado);


--
-- TOC entry 3201 (class 2606 OID 16452)
-- Name: departamentos localizacoes_departamentos_fk; Type: FK CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.departamentos
    ADD CONSTRAINT localizacoes_departamentos_fk FOREIGN KEY (id_localizacao) REFERENCES hr.localizacoes(id_localizacao);


--
-- TOC entry 3200 (class 2606 OID 16447)
-- Name: localizacoes paises_localizacoes_fk; Type: FK CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.localizacoes
    ADD CONSTRAINT paises_localizacoes_fk FOREIGN KEY (id_pais) REFERENCES hr.paises(id_pais);


--
-- TOC entry 3199 (class 2606 OID 16442)
-- Name: paises regioes_paises_fk; Type: FK CONSTRAINT; Schema: hr; Owner: cleverton
--

ALTER TABLE ONLY hr.paises
    ADD CONSTRAINT regioes_paises_fk FOREIGN KEY (id_regiao) REFERENCES hr.regioes(id_regiao);


-- Completed on 2022-11-15 21:42:40 -03

--
-- PostgreSQL database dump complete
--
