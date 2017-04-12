
---
title: "Introdução ao *Git*"
author: Pedro Vasconcelos, DCC/FCUP
date: Abril 2017
...

# Controlo de Versões

## Controlo de Versões

Sistemas de controlo de versões (VCS) são ferramentas para:

* arquivar ficheiros de um projeto (código-fonte e outros)
* registar alterações durante o desenvolvimento
* desfazer alterações ou recuperar versões anteriores
* sincronizar  diferentes computadores
* colaborar com programadores (locais ou à distância)
* separar "troncos" de desenvolvimento (e.g.\ produção/desenvolvimento)


## Sistemas Locais

Os primeiros *VCS* registavam modificações de ficheiros apenas numa
base de dados local.

\

Exemplos: *SCCS*, *RCS*.

## Sistemas Locais (2)

<p align="center">
![image](images/local-version-control-600.png)
</p>


## Sistemas Locais (3)

Permitem:

* registar e desfazer edições;
* recuperar versões anteriores.

Não permitem:

* sincronização entre computadores;
* colaboração entre programadores.


## Sistemas Centralizados

Os *sistemas centralizados* registam alterações numa base de dados
central; todos os clientes utilizam a mesma base de dados.

\

Exemplos: *CVS*, *SVN*

## Sistemas Centralizados (2)

<p align="center">
![image](images/centralized-800px.png)
</p>



## Sistemas Centralizados (3)

Vantagens sobre os sistemas locais:

* sincronização entre computadores
* colaboração entre programadores

Limitações:

* não permitem trabalhar *off-line*
  (é necessário acesso ao servidor para registar alterações)
* o servidor constitui um *ponto crítico de falha*



## Sistemas Distribuídos

Nos sistemas distribuidos cada cópia do repositório mantém 
também a *base de dados de modificações*.

\

Exemplos: *GNU arch*, *Darcs*, *Mercurial*, *Git*.


## Sistemas Distribuídos (2)

<p align="center">
![image](images/distributed-600.png)
</p>


## Sistemas Distribuidos (3)

Vantagens sobre sistemas centralizados:

* todas as cópias do repositório contêm a historia completa
* permitem registar alterações mesmo sem acesso a rede
* não há um ponto crítico de falha: qualquer cópia
  do repositório contém a história completa
* facilitam a introdução de mudanças experimentais
  separadas das estáveis ("*branching*")

Desvantagens:

* necessitam de mais espaço em disco 
* a utilização pode ser mais complexa do que os sistemas tradicionais


# Git

## O que é o *Git*?

* Um sistema de controlo de versões distribuído 
* Desenvolvido desde 2005 para gestão do código do *kernel* Linux
* Muito usado em projetos *open-source*
* Características:
	* conceção simples mas poderosa
	* adequado a projectos grandes, com
	  muitos ficheiros e com história longa
	* eficiente em espaço e recursos computacionais
	* suporte para desenvolvimento não-linear ("*branching*")
	* completamente distribuído


## Porquê usar?

* Sincronização entre computador pessoal e da universidade
      - diga adeus às *pen drives*
* Permite experimentar modificações sem medo 
      - podemos reverter facilmente se necessário
* Repositório remotos funcionam com *backup* 
* As mensagens de *commits* são um registo histórico do trabalho 
* Não apenas para código:
       - documentação, relatórios, dissertações


## Como funciona

* Usamos o comando `git` para a gestão de repositórios
* Cada repositório mantém um conjunto de ficheiros e diretórios (um
  mini-sistema de ficheiros)
* Podem mudar ao longo do tempo:
    - acrescentar/editar/remover ficheiros
* Quando o utilizador regista uma modificação local (*commit*):
     - guarda uma "fotografia" do estado atual dos ficheiros marcados
	   (*snapshot*)


## Repositórios Locais e Remotos

* Podemos usar *Git* apenas para gerir um repositório local
* Mas o *Git* permite também *sincronizar modificações*
  de/para repositórios remotos
* Um repositório remoto é apenas um repositório *Git* num outro computador
  na internet...
* Contudo existem serviços especializados em  *hosting* de repositórios:
    - GitHub   [https://github.com/](https://github.com/)
    - GitLab   [https://gitlab.com/](https://gitlab.com/)
    - Ambos permitem contas gratuitas (sujeitas a condições de uso)


## Fluxo de trabalho básico


**Modify**

:     modificar os ficheiros no directório de trabalho

**Stage**

:     adicionar *snapshots* dos ficheiros à área de estágio
    (*staging area*)
	
**Commit**

:     registar um *snapshot* juntamente com uma mensagem
descritiva


## Operações básicas

<p align="center">
![image](images/the-three-states.png)
</p>

## *Commit*

* Uma *imagem* do estado atual dos ficheiros
* Uma *mensagem* descritiva da alteração efetuada
* Meta-informação do autor e data

<p align="center">
![image](images/commit-repository-data.png)
</p>

Qualquer *commit* pode ser inspecionado e recuperado se assim
quisermos.


## Ciclo de Vida

Os ficheiros no directório de trabalho podem estar em quatro estados
diferentes em relação à copia local doo repositório.

<p align="center">
![image](images/file-status-lifecycle.png)
</p>


# Utilização do *Git* 

## Configuração inicial 

#### Escolher o nome e e-email

~~~bash
git config --global user.name "Pedro..."
git config --global user.email pbv@dcc.fc.up.pt
~~~


#### Mais configurações (opcionais)

```bash
git config --list
```

#### Obter ajuda

```bash
git help 
```


## Inicializar um repositório local

```bash
mkdir my_project
cd my_project
git init
```

* inicializa um diretório `my_project/.git`
  que vai conter a base de dados do *Git*
* o repositório é inicializado *vazio*
* devemos adicionar ficheiros e/ou diretórios

## Adicionar ficheiros

```bash
git add ficheiro1
git add ficheiro2 
```
\

Vários ficheiros de uma só vez:

```bash
git add ficheiro1 ficheiro2 
```

\

Os ficheiros ficam na *área de estágio* --- temos de fazer um
*commit* para os registar na base de dados do *Git*.

## Primeiro *Commit*

```bash
git commit -m "Inicialização do repositório"
```
\

NB: podemos adicionar mais ficheiros posteriormente.


##  Modificar ficheiros

Depois de modificar algum(s) dos ficheiros 
(e.g.\ usando um editor de texto) devemos:

1. adicionar os ficheiros modificados à àrea de estágio
2. registar um *commit* com uma mensagem descritiva.

```bash
emacs    # editar ficheiros 
...
git add ficheiro1 ficheiro2
git commit -m <mensagem>
```

## Consultar o estado


```bash
git status
  # ver estado da área de trabalho e de estágio
```

`Changes to be commited`

:     ficheiros modificados **que serão incluidos** no próximo *commit*

`Changes not staged for commit`

:     ficheiros modificados mas ainda **não incluidos** no próximo *commit*

`Untracked files`

:     ficheiros na área de trabalho que o *Git* não está a gerir


## Outras consultas


```bash
git diff
 # listar modificações desde o último commit
```

```bash
git log
  # Listar o histórico de commits
```
\

Estes comandos aceitam muitas opções extra; ver ajuda
no manual:

~~~bash
git diff --help
git log --help
~~~



# Sincronização e colaboração

## Repositórios remotos

Em *Git* todos os repositórios têm a mesma estrutura
e suportam os mesmos comandos.

\

Um *repositório remoto* é apenas
um diretório *Git* que está localizado noutro computador.


## Usar um repositório remoto

Para copiar um repositório remoto já inicializado
basta fazer *clone*:

```bash
git clone URL-do-repositório-remoto
```

* O URL de um servidor remoto é tipicamente
  `https://...`  ou `ssh://...`
* Obtemos uma cópia local completa do repositório que podemos 
  consultar e modificar livremente


## Usar um repositório remoto (cont.)

Podemos fazer alterações à copia local dos ficheiros
tal como anteriormente.


```bash
  # editar ficheiros localmente
...
git add ficheiro1
git add ficheiro2
...
git commit -m "mensagem descritiva..."
```

\

Esta modificação foi
**registada apenas no repositório local**
--- nada foi enviado ao servidor remoto!


## Enviar modificações 

Para enviar os seus *commits* locais
para o repositório remoto usamos o comando *push*.

```bash
git push
```

## Receber modificações

Para receber alterações que outros tenham enviado ao repositório remoto
usamos *pull*:

```bash
git pull
```

Este comando descarrega *commits* no repositório remoto feitos desde a
última vez aplica-os ao repositório local.


## Como coordenar com colaboradores

Sugestão para principiantes: 

* crie um repositório no servidor *GitHub/GitLab*
* com um único *branch* de desenvolvimento (*master*)
* serve como o *ponto de sincronismo* entre os colaboradores
* quando estiver mais familiarizado, pode introduzir *branches*
  distintos para desenvolvimento seperado



<!--
## Repositório central

* Servidor *Gitlab*: \
  [https://gitlab01.alunos.dcc.fc.up.pt](https://gitlab01.alunos.dcc.fc.up.pt).
* Interface *web* para projetos em *Git*
* Semelhante ao *Github* mas mantido num servidor do DCC
* Cada aluno tem uma conta pessoal (*login/password* do LabCC)
* *Grupos* de dois alunos para os trabalhos --- criados durante as aulas 
-->

## Conflitos

Se um dos nossos *commits* modificar parte dum ficheiro
que outro colaborador também editou,
o *Git* vai sinalizar um **conflito**.

\

O conflito é detetado apenas quando tentarmos sincronizar com
um repositório remoto (`pull` ou `push`).

## Resolver Conflitos

* O *Git* **não resolve o conflito sozinho**
* O utilizador que provoca o conflito deve:

1. editar os ficheiros afetados e juntar as alterções
2. registar um novo *commit* de resolução
3. enviar a resolução para o repositório remoto

## Exemplo

~~~bash
git pull
# CONFLICT (content): Merge conflict in file.txt
~~~


~~~
<<<<<<< HEAD:file.txt
Hello world
=======
Goodbye
>>>>>>> 77976da35a11db4... :file.txt
~~~~

\

Entre `<<<<<<` e  `=====` é a **modificação local**.

Entre `======` e `>>>>>>`  é a **modificação remota**.

## Resolver o conflito

Editamos `file.txt` e juntamos as modificações:

~~~
Hello world
Goodbye
~~~

\

Registamos um novo *commit* de resolução:

~~~bash
git add file.txt
git commit -m "resolver conflito"
~~~

## Resolver o conflito (cont.)

Por fim, fazemos o `push` da resolução
para o repositório remoto.

~~~bash
git push
~~~


## Sumário


`clone`

:    copiar um repositório remoto

`add`

:    adicionar ficheiros alterados à àrea de estágio


`commit`

:     registar alterações no repositório local

`push`

:     enviar alterações ao repositório remoto

`pull`

:     pedir alterações do repositório remoto






# Recomendações

## Alguns cuidados a ter

* Fazer bons *commits*:
    - use o *git add* para juntar apenas as alterações relacionadas 
    - escolha *boas mensagens*: o **porquê** do commit,
	  não a quais os ficheiros (desnecessário!) 
	
* Ter em atenção que, se alterarmos a história do repositório de forma
  descuidada, não estamos apenas a afectar-nos mas também aos nossos
  colegas de trabalho.

## Exemplos de más mensagens

~~~bash
git commit -m "Últimas alterações."
git commit -m "Alterações do Pedro."
git commit -m "Adiciona o Jogador.java."
git commit -m "Alterações no Jogador.java."
git commit -m "Adiciona cenas."
git commit -m "Revision"
git commit -m "Blablabla"
git commit -m "WTFWTFWTF"
~~~

## Exemplos de boas mensagens


~~~bash
git commit -m "Resolve o bug do prémio"
git commit -m "Remove duplicação de código"
git commit -m "Acrescenta contagem de pontuação"
~~~

# Extras

## Mudar nomes

P: Como fazer para mudar o nome de um ficheiro
ou diretório que foi registado no *Git*?

\

R: Usamos `git mv` para mudar o nome de um
ficheiro preservando a história de alterações.

```bash
git mv nome-atual nome-novo
```

## Desfazer modificações

P: Editei um ficheiro na área de trabalho,
mas agora quero desfazer essas alterações.

\ 

R: Usamos `git checkout` para reverter modificações de volta
para o estado registado no último  *commit*:


~~~bash
git checkout -- nome-do-ficheiro
~~~

## Desfazer *stagging*

P: Adicionei um ficheiro à área de estágio, mas
afinal não quero incluí-lo no próximo  *commit*.

\

R: Usamos `git reset HEAD` para remover um ficheiro da área de estágio:

~~~bash
git reset HEAD nome-do-ficheiro
~~~



## Referências

* [Git Community Book](http://git-scm.com/book/en/v2)
* [Pro Git](http://progit.org/)
* [Git Reference](http://gitref.org/)
* [Github](http://github.com/)
* [Atlassian git tutorial](https://www.atlassian.com/git/tutorials/)
* [Git immersion](http://gitimmersion.com/)


## GUIs para *Git*

* [Sourcetree](http://www.sourcetreeapp.com) (MacOS, Windows)
* [Giggle](http://live.gnome.org/giggle) (Linux)


## 

<p align="center">
![git_commit](images/git.png)\
</p>
