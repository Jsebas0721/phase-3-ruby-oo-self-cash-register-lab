class CashRegister
   
    attr_accessor :discount, :total, :items_array, :last_transaction

    def initialize(discount = nil)
        @discount = discount
        @total = 0
        @items_array = []
        
    end

    def add_item(title, price, quantity = 1)
        @last_transaction = price * quantity
        if quantity > 1
           i = 0 
           while i < quantity
            self.items_array << title
            i += 1
           end
        else
            self.items_array << title
        end

        if  quantity > 0 
            self.total += (price * quantity)
        else
            self.total += price
        end
    end
    
    def apply_discount
        if self.discount
            self.total =  self.total - (self.discount * self.total / 100)
            return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end
    
    def items
        self.items_array
    end

    def void_last_transaction

        self.total -= self.last_transaction
    end


end

customer = CashRegister.new()

customer.add_item("Eggs", 2.00)
customer.add_item("Tomato", 2.00, 3)
puts customer.items