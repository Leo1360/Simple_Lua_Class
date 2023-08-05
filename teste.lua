require('Class')

---@class Carro
Carro = Class:create("Carro",{
    motor="",
    combustivel=""
})

function Carro:start()
    print("Carro iniciou, motor= "..self.motor)
end

Fiat = Carro:extends("Fiat",{
    model=""
})

function Fiat:showModel()
    print(self.model)
end

local fordk = Carro:new()

fordk.motor = "1.0"

fordk:start()


local uno = Fiat:new()
uno.model = "Uno"

uno:start()
uno:showModel()

print("Fim")

