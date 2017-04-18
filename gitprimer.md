---
title: Introdução ao *Git*
author: Pedro Vasconcelos, DCC/FCUP
date: Abril 2017
...

# Introdução ao *Git*

## Esta apresentação

* Introdução ao uso do sistema de controlo de versões *Git*
* Direcionado para estudantes dos primeiros anos
* Necessita apenas de ferramentas básicas
       - editor de texto, *shell*,  *browser web*
	   - em sistemas Unix, Linux, MacOS

Slides:

~~~bash
git clone https://github.com/pbv/gitprimer
~~~

# Conceitos

## Sistemas de controlo de versões

Sistemas de controlo de versões (VCS) são ferramentas para:

* arquivar ficheiros de um projeto (código-fonte e outros)
* registar alterações durante o desenvolvimento
* desfazer alterações ou recuperar versões anteriores
* sincronizar  diferentes computadores
* colaborar com programadores 
* separar "troncos" de desenvolvimento (e.g.\ produção/desenvolvimento)


## Sistemas locais

Os primeiros *VCS* registavam modificações de ficheiros apenas numa
base de dados local.

\

Exemplos: *SCCS*, *RCS*.

## Sistemas locais (2)

<p align="center">
![image](images/local-version-control-600.png)
</p>


## Sistemas locais (3)

Permitem:

* registar e desfazer edições;
* recuperar versões anteriores.

Não permitem:

* sincronização entre computadores;
* colaboração entre programadores.


## Sistemas centralizados

Os *sistemas centralizados* registam alterações numa base de dados
central; todos os clientes utilizam a mesma base de dados.

\

Exemplos: *CVS*, *SVN*

## Sistemas centralizados (2)

<p align="center">
![image](images/centralized-800px.png)
</p>



## Sistemas centralizados (3)

Vantagens sobre os sistemas locais:

* sincronização entre computadores
* colaboração entre programadores

Limitações:

* não permitem trabalhar *off-line*
  (é necessário acesso ao servidor para registar alterações)
* o servidor constitui um *ponto crítico de falha*



## Sistemas distribuídos

Nos sistemas distribuidos cada cópia do repositório mantém 
também a *base de dados de modificações*.

\

Exemplos: *GNU arch*, *Darcs*, *Mercurial*, *Git*.


## Sistemas distribuídos (2)

<p align="center">
![image](images/distributed-600.png)
</p>


## Sistemas distribuidos (3)

Vantagens sobre sistemas centralizados:

* todas as cópias do repositório contêm a historia completa
* permitem registar alterações mesmo sem acesso a rede
* não há um ponto crítico de falha: qualquer cópia
  do repositório contém a história completa
* facilitam a introdução de mudanças experimentais
  separadas das estáveis ("*branching*")

Desvantagens:

* necessitam de mais espaço em disco 
* a utilização pode ser mais complexa


# <img src="images/Git-Logo-2Color.png" width=300/>

## <img src="images/Git-Logo-2Color.png" width=250/>

* Um sistema de controlo de versões distribuído 
* Desenvolvido desde 2005 para o código do *kernel* Linux
* Muito usado em projetos *open-source*
* Características:
	* conceção simples mas poderosa
	* adequado a projectos grandes (muitos ficheiros e história longa)
	* eficiente em espaço e recursos computacionais
	* suporte para desenvolvimento não-linear ("*branching*")


## Porquê usar?

* Sincronização entre computador pessoal e da universidade
      - diga adeus às *pen drives*
* Permite experimentar modificações sem medo 
      - podemos reverter facilmente se necessário
* Repositórios remotos funcionam como *backup* 
* As mensagens de *commits* são um registo histórico do
  desenvolvimento
* Não apenas para código: documentação, relatórios, dissertações


## Como funciona

* Cada repositório consiste
  de um conjunto de ficheiros e sub-diretórios
* Quando registamos uma modificação (*commit*),
  o *Git* guarda um *snapshot* de *todos* os ficheiros 

<p align="center">
  <img src="images/snapshots.png" width=600/>
</p>
(NB: ficheiros inalterados são guardados como  *referências*)




## Integridade 

* O *Git* associa um *hash* (40 carateres hexadecimais) a cada
  *snapshot*, e.g.:

~~~
  34ac2a6552252987aa493b52f8696cd6d3b00373
~~~

* Garante que o conteúdo dos ficheiros não foi corrompido
* Serve também para identificar cada *snapshot* 

<p align="center">
![image](images/commit-hashes.png)
</p>




## Repositórios locais e remotos

* Quase todas as operações com *Git* são **locais**:
       - inicializar repositórios
	   - acrescentar/remover ficheiros
	   - registar modificações (*commit*)
	   - listar a história
	   - ...
* Mas o *Git* permite também *sincronizar*
  de/para repositórios remotos
* Um repositório remoto é apenas um diretório *Git* 
  noutro computador na rede!


## *Hosting* de repositórios

GitHub

:      [https://github.com/](https://github.com/)

GitLab

:      [https://gitlab.com/](https://gitlab.com/)

\

Necessitam de registo, mas permitem criar contas gratuitas.


# Utilização 

## Comando `git`

Utilizamos o comando `git` para as várias operações:

> `git` operação arg1 arg2 ...

Exemplo:

~~~bash
git log --oneline
git help
~~~


## Configuração inicial 

~~~bash
git config --global user.name "My name"
git config --global user.email my@email.domain
~~~

\

Configurar editor de texto (opcional):

~~~bash
git config --global core.editor emacs
~~~

\

Listar configurações:

```bash
git config --list
```


## Inicializar um repositório 

```bash
mkdir my-project
cd my-project
git init
```

* cria um diretório `my-project/.git` para meta-dados 
* o repositório está inicialmente *vazio*;
  devemos adicionar ficheiros e/ou sub-diretórios


## Adicionar ficheiros

~~~bash
# editar ficheiros 
# e.g. src/foo.c, src/bar.h, README.txt
git add src/foo.c
git add src/bar.h
git add README.txt
~~~
\

Podemos adicionar vários ficheiros de uma só vez:

~~~bash
git add src/foo.c src/bar.h README.txt
~~~


\

Os ficheiros ficam na *área de estágio*; temos de fazer 
*commit* para registar na base de dados do *Git*.

## Primeiro *commit*

```bash
git commit -m "initialized repository"
```
\

Se omitir a opção `-m`, o *Git* abre um editor de texto.


##  Modificar ou acrescentar

Depois de modificar algum(s) dos ficheiros 
(e.g.\ usando um editor de texto) devemos:

1. adicionar os ficheiros modificados à àrea de estágio
2. registar um *commit* com uma mensagem descritiva.

~~~bash
#  editar ficheiro README.txt
#  criar ficheiro LICENSE.txt
git add README.txt LICENSE.txt
git commit -m "modified and created files"
~~~

## Modificar ou acrescentar (2)

Podemos optar por registar as modificações
em dois *commits* separados:

~~~bash
#  editar ficheiro README.txt
#  criar ficheiro LICENSE.txt
git add README.txt 
git commit -m "modified file"
git add LICENSE.txt
git commit -m "created file"
~~~



## Estados 

------------  -----------------------------------------------------
*Committed*    guardados na base de dados local 
*Modified*     modificados em relação à versão guardada
*Staged*       marcados para entrar no próximo *commit*
------------  ------------------------------------------------------

<p align="center">
<img src="images/areas.png" width=600/>
</p>



## Consultar o estado


~~~bash
git status
~~~

`Changes to be commited`

:     ficheiros modificados **que serão incluidos** no próximo *commit*

`Changes not staged for commit`

:     ficheiros modificados mas ainda **não incluidos** no próximo *commit*

`Untracked files`

:     ficheiros na área de trabalho que o *Git* não está a gerir


## Outras consultas


```bash
git diff  # listar modificações 
git log   # listar o histórico de commits
```
\

Exemplos 

~~~bash
git diff 
git diff src/foo.c
git log --oneline
git log --since=01/04/2017 --author="Pedro"
~~~

(Use `--help` para obter ajuda completa.)

## *Checkout*


O *Git* permite "viajar no tempo" de desenvolvimento do
projeto.

\

Usamos `git checkout` para reverter o diretório de trabalho para
*snapshots* específicos.



## Exemplo

Listar todos os *snapshots* (mais recente primeiro):

~~~bash
git log --all --oneline
~~~

> ~~~
> 7fd2d99 third commit
> 7cf2ce7 second commit
> 432bffa first commit
> ~~~

~~~bash
# reverter à primeira versão
git checkout 432bffa

# avançar até à última versão
git checkout 7fd2d99
~~~






# Sincronização e colaboração

## Repositórios remotos

Em *Git* todos os repositórios têm a mesma estrutura
e suportam os mesmos comandos.

\

Um *repositório remoto* é apenas
um diretório *Git* que está localizado noutro computador.


## Copiar um repositório remoto

Se o repositório remoto já foi inicializado:

~~~bash
git clone <url-remoto>
~~~

* Accesso por HTTPS ou SSH
* Obtemos uma cópia completa podemos editar livremente
* Cria um repositório local num novo
  diretório com nome do projeto


<!--
## Associar um repositório remoto

Se o repositório local já foi inicializado:

~~~bash
cd my-project
git remote add origin <url-remoto>
git push -u origin master
~~~
-->

## Modificar

Registamos alterações no repositório local
(tal como anteriormente).


~~~bash
# editar README src/foo.c
...
git add README src/foo.c
git commit
~~~

\

Este *commit* é registado *apenas* no repositório local;
ainda nada foi enviado ao servidor remoto!


## Enviar modificações 

Para enviar os seus *commits* locais
para o repositório remoto usamos o comando *push*.

~~~bash
git push
~~~

## Receber modificações

Para receber alterações que outros tenham enviado ao repositório remoto
usamos *pull*:

~~~bash
git pull
~~~

Este comando descarrega *commits* no repositório remoto feitos desde a
última vez aplica-os ao repositório local.


## Coordenar com colaboradores

* Crie um repositório num servidor *GitHub/GitLab*
* Usado como *ponto de sincronização* entre os computadores/colaboradores
* Começe usando com um único *branch* de desenvolvimento (*master*)
* Quando estiver mais experiência, pode introduzir *branches*
  distintos para desenvolvimento separado


## *Merging*

<img src="images/typical-merge.png" height=400 align="right"/>

* Juntar desenvolvimento divergente: operação
  de *merge*
* O *merge* introduz num novo *snapshot* que unifica
  os ramos divergentes
* O *Git* tenta fazer *merge* automático sempre que executamos
  `push` ou `pull`
* Mas: o *merge* automático falha em caso de **conflitos**


## Conflitos

Se dois *commits* separados modificarem 
um mesmo ficheiro o *Git* pode sinalizar um **conflito**.

\

O conflito é detetado quando tentarmos sincronizar com
um repositório remoto (`pull` ou `push`).

## Resolver conflitos

1. Editar os ficheiros afetados e juntar as alterações
2. Registar um novo *commit* de resolução
3. Efetuar `push` para o repositório remoto


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

## Resolver o conflito (1)

Editamos `file.txt` e juntamos as modificações:

~~~
Hello world
Goodbye
~~~

## Resolver o conflito (2)

Registamos um  *commit* de resolução:

~~~bash
git add file.txt
git commit -m "resolver conflito"
~~~

## Resolver o conflito (3)

Por fim, fazemos o `push` da resolução
para o repositório remoto.

~~~bash
git push
~~~


# Recomendações

## Escolher *commits*

* Use `git add` para juntar alterações relacionadas 
* Componha *boas mensagens*:
	   - não é útil dizer quais os ficheiros alterados
       - explicar o **sentido** do *commit*

## Exemplos 

### Más mensagens

~~~bash
git commit -m "revisão"
git commit -m "últimas alterações"
git commit -m "alterações do Pedro"
~~~

### Boas mensagens

~~~bash
git commit -m "resolve o bug do prémio"
git commit -m "remove duplicação de código"
git commit -m "acrescenta contagem de pontuação"
~~~

# Extras

## Mudar nomes

Como fazer para mudar o nome de um ficheiro
ou diretório?

### Solução

~~~bash
git mv <nome-atual> <nome-novo>
~~~

## Desfazer modificações

Editei um ficheiro na área de trabalho,
mas agora quero desfazer essas alterações.

### Solução

~~~bash
git checkout -- <ficheiro>
~~~

(Reverte modificações para o estado registado no último  *commit*.)


## Desfazer *stagging*

Adicionei um ficheiro à área de estágio, mas
afinal não quero incluí-lo no próximo  *commit*.

### Solução

~~~bash
git reset HEAD <ficheiro>
~~~

## Sumário 

------------  -------------------------------------------
`init`                         inicializar um repositório
`clone`        copiar um repositório remoto
`add`          adicionar ficheiros à àrea de estágio
`commit`       registar alterações no repositório local
`checkout`     reverter para um *snapshot* específico
`push`         enviar alterações ao repositório remoto
`pull`         puxar alterações do repositório remoto
------------   --------------------------------------------


## Mais informação

* [Git Community Book](http://git-scm.com/book/en/v2)
* [Git Reference](http://gitref.org/)
* [Atlassian git tutorial](https://www.atlassian.com/git/tutorials/)
* [Git immersion](http://gitimmersion.com/)

## 

<p align="center">
<img src="images/in-case-of-fire.png" width=500/>
</p>
