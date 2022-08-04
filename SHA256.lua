--[[
	SHA stands for Secure Hashing Algorithm; a hashing algorithm is a one-way cryptographic function
	Note that SHA-256 is the same thing as SHA-2; the 2 refers to the version, whereas 256 refers to the number of bits 
--]]

local SHA256 = {

}

-- let's ensure that everything is in ASCII so fits in a byte lmao
local function ConvertNumberTo8BitBinary(n) 
	local BinaryString = ""
	
	local p2 = 7
	
	while (p2 > -1) do
		if not (n > 0) then
			local left = 8 - #BinaryString
			BinaryString ..= string.rep("0", left)
			
			break
		end
		
		local r = math.pow(2, p2)
		
		if n < r then
			BinaryString ..= "0"
		else
			BinaryString ..= "1"
			n -= r 
		end
		
		p2 -= 1
	end
	
	return BinaryString
end

local function ConvertNumberToBinary(n)
	if n == 0 then
		return "0"
	end	
	
	local BinaryString = ""
	
	local p2 = 0
	local r = 1

	-- first we must find the biggest power of 2 that fits inside this
	
	while n >= r do
		p2 += 1 
		r = math.pow(2, p2)
	end
	
	local len = p2
	p2 -= 1 
	
	while (p2 > -1) do
		if not (n > 0) then
			local left = len - #BinaryString
			BinaryString ..= string.rep("0", left)

			break
		end

		local r = math.pow(2, p2)

		if n < r then
			BinaryString ..= "0"
		else
			BinaryString ..= "1"
			n -= r 
		end

		p2 -= 1
	end
	
	return BinaryString
end

local function ConvertStringTo8BitBinary(Message)
	local BinaryPhrase = ""

	for i = 1,#Message do
		local Ascii = string.byte(string.sub(Message, i, i))
		BinaryPhrase ..= ConvertNumberTo8BitBinary(Ascii)
	end
	
	return BinaryPhrase
end

function SHA256:Encrypt(Message)
	local Phrase = ConvertStringTo8BitBinary(Message)
	local PhraseSize = #Phrase
	
	Phrase ..= "1" -- for some reason SHA-256 adds a 1 not sure why
	
	local NumberOfZeros = 448 - (#Phrase % 512) -- 448 bits is 512 - 64 since 64 bits are allocated to more stuff
	
	if NumberOfZeros < 0 then
		-- we must split into 2 blocks
		
	end
	Phrase ..= string.rep("0", NumberOfZeros)
	
	Phrase ..= ConvertNumberTo8BitBinary(PhraseSize)
	
	return Phrase
end

function SHA256:Sign(Message, PrivateKey) -- returns unique signature for message

end

function SHA256:Verify(Message, Signature, PublicKey) -- verifies whether signature valid

end

function SHA256:GenerateKeys(Input)

end

return SHA256
