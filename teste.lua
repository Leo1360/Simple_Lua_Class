require('Class')

---@class Carro
Carro = Class:create("Carro",{
    motor="",
    combustivel=""
})

function Carro:start()
    print("Carro iniciou, motor= "..self.motor)
end


local fordk = Carro:new()

fordk.motor = "1.0"

fordk:start()


Fiat = Carro:extends("Fiat",{
    model=""
})

function Fiat:showModel()
    print(self.model)
end


local uno = Fiat:new()
uno.model = "Uno"

uno:start()
uno:showModel()


UnoMillie = Fiat:extends("Millie",{
    color=""
})

function UnoMillie:new()
    local obj = UnoMillie:instantiate()
    obj.model = "Uno"
    obj.motor = "1.0"
    return obj
end

function UnoMillie:tellColor()
    print(self.color)
    print(self.model)
    
end

local milieRosa = UnoMillie:new()
milieRosa.color = "rosa"
milieRosa:tellColor()

print("Fim")
