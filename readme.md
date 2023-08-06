
  

# Class

  

  

A biblioteca de classes adiciona a capacidade de criar e estender classes do lua, além de sobrescrever métodos.

  

  

## Modo de usar

  

  

### Criar classe

  

  

Para criar uma classe basta chamar o método **create()** conforme abaixo

  

  

Carro = Class:create(nome,{Atributos})

  
  

Podemos também passar uma tabela com os atributos da classe para o **create()** para simplificar a declaração
  

Carro = Class:create("Carro",{

nome="",

marca=""

})

  

  

## Construtores

  

Por padrão existe um construtor padrão que apenas cria uma nova instancia vazia ele pode ser utilizado chamando o método **new()**

  

  

local uno = Carro:new()

  

Podemos sobrescrever esse construtor e utilizar o método **instantiate()** para criar uma nova instancia vazia

  

  

function Carro:new(nome,marca)

local obj = Carro:instantiate()

obj.nome = nome

obj.marca = marca

return obj

end


  

  

## Herança

  

Para estender uma classe basta utilizar o método **extends()**

  

  

Uno = Carro:extends("UNO"{

ano = 0

})