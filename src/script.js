const coletivos = [
  {
    sigla: 'ME', cor: '#F28C6B',
    nome: 'Mulheres Empoderadas',
    lider: 'Valeria',
    area: 'Empoderamento',
    local: 'SJBVista — Centro',
    contato: '(19) 99800-0001',
    encontros: 'Toda terceira sabado, 15h',
    desc: 'Espaco de fortalecimento feminino, autoestima e suporte mutuo para mulheres de todas as idades. Realizamos rodas de conversa, oficinas de desenvolvimento pessoal e acoes de visibilidade para mulheres de SJBVista.',
    eventos: [
      { dia:'09', mes:'JUN', titulo:'Validacao FLORESCER', hora:'19h — IFSP' },
      { dia:'19', mes:'JUL', titulo:'Oficina de Empreendedorismo', hora:'14h — Online' }
    ]
  },
  {
    sigla: 'RS', cor: '#B07CC6',
    nome: 'Roda Sagrada de Mulheres',
    lider: 'Elaine Menato',
    area: 'Espiritualidade',
    local: 'SJBVista — Bela Vista',
    contato: '(19) 99800-0002',
    encontros: 'Toda lua nova, 17h',
    desc: 'Encontros de cura, ancestralidade e reconexao com o feminino sagrado por meio de rodas e rituais. Trabalhamos com medicina de plantas, meditacao, danca circular e escuta ativa.',
    eventos: [
      { dia:'14', mes:'JUN', titulo:'Roda de Conversa — Saude da Mulher', hora:'15h — Praca da Matriz' }
    ]
  },
  {
    sigla: 'BM', cor: '#8B5A7A',
    nome: 'Baque Mulher SJBVista',
    lider: 'Karina Mattos',
    area: 'Cultura',
    local: 'SJBVista — Jardim Europa',
    contato: '(19) 99800-0003',
    encontros: 'Quartas, 19h',
    desc: 'Coletivo de musica e percussao feminina. Promovemos a cultura afro-brasileira, a sororidade e a ocupacao dos espacos urbanos por mulheres artistas e percussionistas.',
    eventos: [
      { dia:'21', mes:'JUN', titulo:'Show de Baque Mulher — Solsticio', hora:'18h — Anfiteatro' }
    ]
  },
  {
    sigla: 'FI', cor: '#D96B4D',
    nome: 'FeminIF',
    lider: 'Fernanda Oliveira',
    area: 'Universitario',
    local: 'IFSP — Campus SJBVista',
    contato: '(19) 99800-0004',
    encontros: 'Quintas, 12h — IFSP',
    desc: 'Coletivo feminista estudantil do IFSP-SBV. Trabalhamos por equidade de genero dentro e fora do campus, promovendo debates, eventos culturais e apoio a estudantes.',
    eventos: [
      { dia:'07', mes:'JUL', titulo:'Avaliacao comunitaria FLORESCER', hora:'19h45 — IFSP' }
    ]
  },
  {
    sigla: 'MC', cor: '#E8B28A',
    corTexto: '#5A2E52',
    nome: 'Mulheres de Coracao SJBVista',
    lider: 'Cristina Cornelio',
    area: 'Apoio mutuo',
    local: 'SJBVista — Vila Nova',
    contato: '(19) 99800-0005',
    encontros: 'Sextas, 18h — Sede propria',
    desc: 'Rede de apoio mutuo para mulheres em situacao de vulnerabilidade. Oferecemos escuta, encaminhamentos, doacao de cestas basicas e acompanhamento de casos.',
    eventos: []
  }
];

let filtroAtivo = 'Todos';
let telaAnteriorPerfil = 'home';

function irPara(id) {
  document.querySelectorAll('.tela').forEach(t => t.classList.remove('ativa'));
  const tela = document.getElementById(id);
  if (tela) { tela.classList.add('ativa'); tela.scrollTop = 0; }
}

function irNav(pagina) {
  const mapa = {
    'home':       'tela-home',
    'coletivos':  'tela-coletivos',
    'mapa':       'tela-mapa',
    'eventos':    'tela-eventos',
    'emergencia': 'tela-emergencia'
  };
  if (mapa[pagina]) { irPara(mapa[pagina]); renderColetivos(); }
  atualizarNav(pagina);
}

function atualizarNav(pagina) {
  document.querySelectorAll('.nav-item').forEach(btn => btn.classList.remove('ativo'));
  const todos = document.querySelectorAll('.nav-item');
  const idx = { home:0, coletivos:1, mapa:2, eventos:3, emergencia:4 };
  const telaAtiva = document.querySelector('.tela.ativa');
  if (!telaAtiva) return;
  telaAtiva.querySelectorAll('.nav-item').forEach(btn => btn.classList.remove('ativo'));
  const i = idx[pagina];
  if (i !== undefined) {
    const navItems = telaAtiva.querySelectorAll('.nav-item');
    if (navItems[i]) navItems[i].classList.add('ativo');
  }
}

function irPerfil(idx) {
  const c = coletivos[idx];
  const telaAtual = document.querySelector('.tela.ativa');
  if (telaAtual) telaAnteriorPerfil = telaAtual.id;

  document.getElementById('perfil-avatar').textContent = c.sigla;
  document.getElementById('perfil-avatar').style.background = c.cor;
  if (c.corTexto) document.getElementById('perfil-avatar').style.color = c.corTexto;
  else document.getElementById('perfil-avatar').style.color = '#fff';
  document.getElementById('perfil-nome').textContent = c.nome;
  document.getElementById('perfil-lider').textContent = 'Lideranca: ' + c.lider;
  document.getElementById('perfil-area').textContent = c.area;
  document.getElementById('perfil-desc').textContent = c.desc;
  document.getElementById('perfil-local').textContent = c.local;
  document.getElementById('perfil-contato').textContent = c.contato;
  document.getElementById('perfil-encontros').textContent = c.encontros;

  const header = document.querySelector('.perfil-header');
  if (header) {
    const cores = { Empoderamento:'#5A2E52', Espiritualidade:'#8B5A7A', Cultura:'#6B3D5C', Universitario:'#B07CC6', 'Apoio mutuo':'#D96B4D' };
    header.style.background = cores[c.area] || '#5A2E52';
  }

  const perfilTag = document.getElementById('perfil-area');
  if (perfilTag) perfilTag.style.borderColor = c.cor;

  const eventosEl = document.getElementById('perfil-eventos');
  if (c.eventos.length === 0) {
    eventosEl.innerHTML = '<p style="font-size:0.82rem;color:var(--texto-sec)">Nenhum evento agendado no momento.</p>';
  } else {
    eventosEl.innerHTML = c.eventos.map(e => `
      <div style="display:flex;gap:12px;align-items:flex-start;padding:10px 0;border-bottom:1px solid var(--creme)">
        <div style="background:var(--ameixa);color:var(--creme);border-radius:6px;padding:6px 8px;text-align:center;flex-shrink:0;min-width:42px">
          <div style="font-weight:700;font-size:1.1rem;line-height:1">${e.dia}</div>
          <div style="font-size:0.6rem;font-weight:600;text-transform:uppercase;margin-top:2px;opacity:.8">${e.mes}</div>
        </div>
        <div>
          <div style="font-weight:600;font-size:0.85rem;color:var(--ameixa)">${e.titulo}</div>
          <div style="font-size:0.75rem;color:var(--texto-sec);margin-top:2px">${e.hora}</div>
        </div>
      </div>`).join('');
  }
  irPara('tela-perfil');
}

function voltarPerfil() {
  irPara(telaAnteriorPerfil || 'tela-home');
}

function renderColetivos() {
  const container = document.getElementById('lista-coletivos');
  if (!container) return;
  const busca = (document.getElementById('input-busca') || {}).value || '';
  const lista = coletivos.filter(c => {
    const matchArea = filtroAtivo === 'Todos' || c.area === filtroAtivo;
    const matchBusca = !busca || c.nome.toLowerCase().includes(busca.toLowerCase()) || c.area.toLowerCase().includes(busca.toLowerCase());
    return matchArea && matchBusca;
  });
  if (lista.length === 0) {
    container.innerHTML = '<p style="font-size:0.85rem;color:var(--texto-sec);padding:8px 0">Nenhum coletivo encontrado para esta busca.</p>';
    return;
  }
  container.innerHTML = lista.map((c, i) => {
    const idx = coletivos.indexOf(c);
    return `<div class="card-coletivo" onclick="irPerfil(${idx})">
      <div class="card-coletivo-header" style="background:${c.cor}">
        <div class="avatar" style="background:rgba(255,255,255,0.25);color:#fff">${c.sigla}</div>
        <div>
          <div class="card-nome">${c.nome}</div>
          <div class="card-lider">Lideranca: ${c.lider}</div>
        </div>
      </div>
      <div class="card-corpo">
        <span class="card-tag" style="color:${c.cor}">${c.area}</span>
        <p class="card-desc">${c.desc.substring(0,110)}...</p>
        <div class="card-rodape">
          <span class="card-local">
            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="var(--malva)" stroke-width="2" stroke-linecap="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg>
            ${c.local}
          </span>
          <button class="btn-ver" onclick="event.stopPropagation();irPerfil(${idx})">Ver perfil</button>
        </div>
      </div>
    </div>`;
  }).join('');
}

function setFiltro(area, btn) {
  filtroAtivo = area;
  document.querySelectorAll('.filtro-btn').forEach(b => b.classList.remove('ativo'));
  btn.classList.add('ativo');
  renderColetivos();
}

function filtrarColetivos() { renderColetivos(); }

function fazerLogin() {
  const email = document.getElementById('login-email').value;
  const senha = document.getElementById('login-senha').value;
  if (!email || !senha) { mostrarToast('Preencha e-mail e senha'); return; }
  mostrarToast('Entrando na plataforma...');
  setTimeout(() => irPara('tela-painel'), 800);
}

function mostrarToast(msg) {
  const t = document.getElementById('toast');
  t.textContent = msg;
  t.classList.add('visivel');
  setTimeout(() => t.classList.remove('visivel'), 2200);
}

renderColetivos();
