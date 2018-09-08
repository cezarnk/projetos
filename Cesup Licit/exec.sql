select * from produtos

select * from linhas

select * from categorias

select p.nome as Equipamento, count(c.nome) as Qnt
from produtos as p
left join categorias as c on c.id = p.categoria_id group by p.nome

select p.codigo as Codigo, p.nome as Nome_Produto, l.nome as Nome_Linha from produtos as p
join linhas as l on p.linha_id = l.id
where l.nome like 'Fusio%'

select p.nome as Equipamento, c.nome as Membro from produtos as p
join categorias as c on c.id = p.categoria_id
where c.nome = 'Pernas'


select * from produtos as p
join categorias as c on c.id = p.categoria_id
join linhas as l on l.id = p.linha_id
