# Projeto Final — Desenvolvimento Ágil com Scrum · Etapa 1
**Disciplina:** Engenharia de Software · Prof. Gaio Belitardo de Oliveira
**Data:** 26/05/2026
**Projeto:** FLORESCER — Plataforma digital para coletivos femininos de SJdBV

---

## Atividade 1 — Definição dos Papéis

| Papel | Integrante |
|---|---|
| **Product Owner (PO)** | Ana Clara Felix |
| **Dev — Requisitos e modelagem** | Ana Carolina Moreira Ferreira |
| **Dev — UX e acessibilidade** | Bianca de Oliveira Schiavo |
| **Dev — Back-end e banco de dados** | Emily Pereira Amorim |

---

## Atividade 2 — Problema Escolhido

**Projeto:** FLORESCER — plataforma digital para centralização e visibilidade de coletivos femininos de São João da Boa Vista e região.

**Cliente:** coletivos femininos parceiros — Mulheres Empoderadas, Roda Sagrada de Mulheres, Baque Mulher, FeminIF e Mulheres de Coração SJBVista.

**Dor real:** os coletivos existem e atuam, mas são invisíveis digitalmente. Mulheres em situação de vulnerabilidade não conseguem encontrá-los. As lideranças não têm tempo nem suporte técnico para manter presença digital de forma descentralizada.

---

## Atividade 3 — Visão do Produto e Personas

### Visão do produto

Para mulheres em situação de vulnerabilidade e lideranças de coletivos femininos de São João da Boa Vista, o **FLORESCER** é uma plataforma web que centraliza, organiza e dá visibilidade aos coletivos femininos da região. Ao contrário das redes sociais comerciais, o FLORESCER oferece um ponto de referência permanente, acessível e autônomo, que não depende de algoritmos nem de suporte técnico externo para funcionar.

### Personas

**Persona 1 — Maria, 34 anos · Usuária em busca de apoio**
Mora em SJdBV, passou por situação de violência doméstica e não sabe a quem recorrer. Usa celular com dados limitados, tem baixo letramento digital. Precisa encontrar rapidamente um coletivo próximo que possa acolhê-la, sem precisar navegar por várias redes sociais.

**Persona 2 — Valéria, 45 anos · Liderança de coletivo**
Fundadora do coletivo Mulheres Empoderadas. Trabalha o dia todo, não tem equipe de comunicação. Precisa de um painel simples para atualizar os eventos e o contato do coletivo sem depender de outra pessoa. Tem medo de que a plataforma fique desatualizada ou seja abandonada.

**Persona 3 — Fernanda, 28 anos · Voluntária e apoiadora**
Estudante universitária que quer se engajar em causas feministas locais. Usa redes sociais com facilidade mas não encontra informações consolidadas sobre coletivos da cidade. Precisa de um mapa ou lista que mostre o que existe e como participar.

---

## Atividade 4 — Product Backlog Inicial (User Stories)

| ID | User Story |
|---|---|
| US01 | Como **usuária em busca de apoio**, eu quero **ver uma lista de coletivos femininos da região** para **encontrar uma organização que possa me ajudar**. |
| US02 | Como **usuária em busca de apoio**, eu quero **visualizar os coletivos em um mapa interativo** para **saber quais ficam perto de mim**. |
| US03 | Como **usuária em busca de apoio**, eu quero **acessar a página de perfil de um coletivo** para **conhecer sua história, área de atuação e formas de contato**. |
| US04 | Como **usuária em busca de apoio**, eu quero **ver uma lista de contatos de emergência e apoio** para **saber para quem ligar em caso de violência**. |
| US05 | Como **usuária em busca de apoio**, eu quero **buscar coletivos por nome ou área de atuação** para **encontrar rapidamente o que preciso**. |
| US06 | Como **liderança de coletivo**, eu quero **cadastrar meu coletivo na plataforma** para **ter visibilidade digital sem depender de redes sociais**. |
| US07 | Como **liderança de coletivo**, eu quero **atualizar as informações do meu coletivo pelo painel administrativo** para **manter os dados sempre corretos sem precisar de ajuda técnica**. |
| US08 | Como **liderança de coletivo**, eu quero **cadastrar e editar eventos e reuniões** para **divulgar as atividades do coletivo na plataforma**. |
| US09 | Como **liderança de coletivo**, eu quero **fazer login com e-mail e senha** para **acessar o painel de forma segura**. |
| US10 | Como **voluntária**, eu quero **ver um calendário de eventos dos coletivos** para **saber quando posso participar de atividades**. |
| US11 | Como **voluntária**, eu quero **compartilhar o perfil de um coletivo pelo WhatsApp** para **divulgar a iniciativa na minha rede**. |
| US12 | Como **administradora da plataforma**, eu quero **aprovar ou recusar o cadastro de novos coletivos** para **garantir a qualidade e segurança das informações**. |
| US13 | Como **usuária**, eu quero **acessar a plataforma pelo celular sem dificuldade** para **usar sem precisar de computador**. |
| US14 | Como **usuária com deficiência visual**, eu quero **que a plataforma siga padrões WCAG 2.1** para **conseguir navegar com leitor de tela**. |
| US15 | Como **liderança de coletivo**, eu quero **receber notificação por e-mail quando meu cadastro for aprovado** para **saber que já estou visível na plataforma**. |

---

## Atividade 5 — Priorização

### Método 1 — Matriz MoSCoW

| Classificação | User Stories |
|---|---|
| **Must Have** — o sistema não funciona sem isso | US01, US02, US03, US04, US06, US07, US09, US13 |
| **Should Have** — importante, mas não bloqueia o MVP | US05, US08, US10, US12, US14 |
| **Could Have** — desejável se sobrar tempo | US11, US15 |
| **Won't Have** — fora do escopo por enquanto | Canal de denúncia anônima · Chat entre usuárias e coletivos · Integração automática com redes sociais |

---

### Método 2 — Valor vs. Esforço

| ID | User Story (resumo) | Valor (1–5) | Esforço (1–5) | Quadrante |
|---|---|:---:|:---:|---|
| US04 | Contatos de emergência | 5 | 1 | Quick Win |
| US01 | Listar coletivos | 5 | 2 | Quick Win |
| US03 | Página de perfil do coletivo | 5 | 2 | Quick Win |
| US09 | Login da liderança | 5 | 2 | Quick Win |
| US13 | Responsividade mobile | 5 | 2 | Quick Win |
| US06 | Cadastro de coletivo | 5 | 3 | Quick Win |
| US07 | Painel administrativo | 5 | 3 | Quick Win |
| US05 | Busca por nome/área | 4 | 2 | Quick Win |
| US02 | Mapa interativo | 5 | 4 | Grande Projeto |
| US08 | Cadastro de eventos | 4 | 3 | Grande Projeto |
| US14 | Acessibilidade WCAG 2.1 | 4 | 4 | Grande Projeto |
| US12 | Moderação de cadastros | 4 | 3 | Grande Projeto |
| US10 | Calendário de eventos | 3 | 3 | Preenchimento |
| US11 | Compartilhar pelo WhatsApp | 3 | 1 | Preenchimento |
| US15 | Notificação por e-mail | 2 | 2 | Preenchimento |

---

## Backlog Refatorado e Ordenado — Fila Única

| Posição | ID | User Story (resumo) | MoSCoW | Valor | Esforço |
|:---:|---|---|:---:|:---:|:---:|
| 1 | US04 | Contatos de emergência | Must | 5 | 1 |
| 2 | US01 | Listar coletivos | Must | 5 | 2 |
| 3 | US03 | Página de perfil do coletivo | Must | 5 | 2 |
| 4 | US09 | Login da liderança | Must | 5 | 2 |
| 5 | US13 | Responsividade mobile | Must | 5 | 2 |
| 6 | US06 | Cadastro de coletivo | Must | 5 | 3 |
| 7 | US07 | Painel administrativo | Must | 5 | 3 |
| 8 | US05 | Busca por nome/área | Should | 4 | 2 |
| 9 | US02 | Mapa interativo | Must | 5 | 4 |
| 10 | US08 | Cadastro de eventos | Should | 4 | 3 |
| 11 | US12 | Moderação de cadastros | Should | 4 | 3 |
| 12 | US14 | Acessibilidade WCAG 2.1 | Should | 4 | 4 |
| 13 | US10 | Calendário de eventos | Could | 3 | 3 |
| 14 | US11 | Compartilhar pelo WhatsApp | Could | 3 | 1 |
| 15 | US15 | Notificação por e-mail | Could | 2 | 2 |