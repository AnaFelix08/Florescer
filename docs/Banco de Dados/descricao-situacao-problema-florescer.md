# Situação-Problema

Coletivos de mulheres em São João da Boa Vista não possuem um canal centralizado para se organizar, divulgar suas atividades e eventos, e manter contato com a comunidade. As informações ficam dispersas entre redes sociais pessoais, grupos de WhatsApp e comunicação informal, dificultando a visibilidade das ações e a gestão administrativa desses coletivos.

O projeto FLORESCER propõe uma plataforma web que centraliza o cadastro de coletivos, suas lideranças, eventos organizados e contatos de emergência, com um sistema de administração que controla o acesso e a validação das informações.

## Principais Regras de Negócio

- **Usuários e perfis**: todo usuário do sistema (Usuario) se especializa em dois perfis: Administradora (equipe gestora da plataforma) ou Liderança (representante de um coletivo). Um usuário pertence a exatamente um desses perfis.
- **Nível de acesso**: cada Administradora possui um nível de acesso (Adm_Nivel_Acesso) que define suas permissões dentro do sistema.
- **Gestão de coletivos**: cada coletivo é gerenciado por exatamente uma Administradora (1,1), mas uma Administradora pode gerenciar vários coletivos (0,n).
- **Representação do coletivo**: cada coletivo é representado por exatamente uma Liderança (1,1), mas uma Liderança pode representar mais de um coletivo (1,n).
- **Contatos de emergência**: cada Administradora controla uma lista de contatos de emergência (0,n), classificados por tipo (CoE_Tipo).
- **Status do coletivo**: cada coletivo possui um status (Col_Status), permitindo controle de ativação/aprovação pela administração.
- **Organização de eventos**: um coletivo pode organizar vários eventos (1,n), mas todo evento deve estar vinculado a pelo menos um coletivo organizador (0,n) — permitindo, inclusive, eventos organizados em parceria entre coletivos.
- **Dados obrigatórios do coletivo**: nome, descrição, área de atuação, cidade e status são essenciais para identificação e categorização na plataforma.
- **Dados obrigatórios do evento**: título, data, local e modalidade (presencial/online) são necessários para publicação do evento.
