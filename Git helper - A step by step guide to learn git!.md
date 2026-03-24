#### Git branch
Branchear es apuntar a un commit. En corto, son punteros a *snapshots* del trabajo realizado hasta el momento
```sh
git branch bugFix
```
##### Forzar movimiento de una branch a un commit
Es situacional y solo se puede hacer si head no apunta a esa branch.
```sh
git branch -f bugFix <commit al que me quiero mover>
```
#### Git merge
Une 2 branches en un unico commit. Normalmente un commit tiene un unico padre pero en este caso, el nuevo commit tendra como padres a ambos commits de cada branch. La branch sobre la que hago el merge se queda con este commit y si quiero tener ambas branches sobre el mismo debo mergear nuevamente
#### Git rebase
Copia y pega una serie de commits realizados sobre una branch en otra branch, como si se hubiesen hecho secuencialmente
##### Flag -i
Basicamente abre Vim para modificar como se rebasea, incluyendo/excluyendo commits. Es similar al cherry-Pick.
#### Git checkout
Lo que hace es mover el *HEAD* dentro de un working tree. El head es el commit donde se esta trabajando y puede ser una branch en especifico o un commit como tal. Puedo hacer checkout a un commit con su hash, a una branch o tambien a un commit a partir de otro con `main^` y `main~numero`
#### Git reset
Lo que hace es mandar el puntero branch `n` commits hacia atras. Estos cambios son locales si la branch es local
#### Git revert
Genera un nuevo commit que *revierte* los cambios realizados hasta un commit `n`
#### Git Cherry-Pick
Toma una serie de commits  y los copia y pega en una determinada branch. Similar a rebase pero puedo elegir commits especificos para esto
