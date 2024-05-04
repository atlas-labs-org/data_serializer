--[[
This work is licensed under the Creative Commons Attribution-NoDerivatives 4.0 International License.
To view a copy of this license, visit https://creativecommons.org/licenses/by-nd/4.0/
You are free to share this code for non-commercial purposes as long as you give appropriate credit and do not create derivative works.

Attribution should include the following information:
Original Creator: MochaTheDev (@MochaTheDev)
Original Source: https://github.com/atlas-labs-org/data_serializer

NOTE: You may share and distribute this script, but you are not allowed to change, remix, or create derivative works based on this script.
]]--

-------------------------------------------------------------------

local HttpService = game:GetService("HttpService")

local s_ = {}

-- Wrapper for serialize
function s_.Serialize(data)
	local success, result = xpcall(
		function()
			return HttpService:JSONEncode(data)
		end,
		function(err)
			return "Error in serialization: " .. err
		end
	)
	return success and result or nil
end

-- Wrapper for deserialize
function s_.Deserialize(data)
	local success, result = xpcall(
		function()
			if data and string.len(data) > 0 then
				return HttpService:JSONDecode(data)
			else
				error("Data not provided or empty")
			end
		end,
		function(err)
			return "Error in deserialization: " .. err
		end
	)
	return success and result or nil
end

return s_