--[[
	SHA stands for Secure Hashing Algorithm; a hashing algorithm is a one-way cryptographic function
	Note that SHA-256 is the same thing as SHA-2; the 2 refers to the version, whereas 256 refers to the number of bits 
--]]

local SHA256 = {
	
}

function SHA256:Sign(Message, PrivateKey) -- returns unique signature for message
	
end

function SHA256:Verify(Message, Signature, PublicKey) -- verifies whether signature valid
	
end

function SHA256:GenerateKeys(Input)
	
end

return SHA256
