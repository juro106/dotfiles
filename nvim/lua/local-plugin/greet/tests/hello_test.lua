describe("Example test", function()
    it("should add numbers correctly", function()
        local add = function(a, b) return a + b end
        assert.equals(4, add(2, 2))
    end)

    it("helloの出力は Hello", function()
        local hello = function() return "Hello" end
        local Word = hello()
        assert.are.same("Hello", Word)
    end)
end)
