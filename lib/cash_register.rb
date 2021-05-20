class CashRegister
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    attr_accessor :discount, :total, :items, :last_item

    def add_item(title, price, quantity=1)
        @total += price * quantity
        @last_item = price * quantity
        i = 0
        while i < quantity
            @items << title
            i+= 1
        end
        
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            discount_percentage = 1 - (@discount.to_f / 100)
            @total = @total * discount_percentage
            "After the discount, the total comes to $#{@total.round}."
        end
    end

    def void_last_transaction
        @total = @total - @last_item
        @items = @items.pop
    end
end