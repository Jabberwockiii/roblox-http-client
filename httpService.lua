local HttpService = game:GetService("HttpService")
local URL_PASTEBIN_NEW_PASTE = "http://11.1.1.1:32056/create/?scene=intimate_bar"
local data = {
	room_state = {
		actors = { {
			id = 1,
			prop = {
				type = "player",
				name = "Paul",
				role = "",
				work = "",
				interest = "",
				age = "",
				gender = "",
				nature = "",
				talking_style = "humorous",
				current_state = "poor",
				relations = { }
			}
		}, {
			id = 2,
			prop = {
				type = "npc",
				name = "Sandy",
				gender = "female"
			}
		} }
	},
	gpt3_config = { },
	room_config = {
		rounds = 3
	}
}
local dataField = HttpService:JSONEncode(data)
print(dataField)
local response = HttpService:PostAsync(URL_PASTEBIN_NEW_PASTE, dataField)
print(response)
URL_act = "http://11.1.1.1:32056/act/"
local action = {
	src = 1,
	target = 2,
	text = "Did you hear about the crime happening in the town?"
}
local actionField = HttpService:JSONEncode(action)
local responeAct = HttpService:PostAsync(URL_act, actionField)
print(HttpService:JSONDecode(responeAct))

-- get 
local URL_get = "http://11.1.1.1:32056/simulation/?n_max_steps=15"
local responseGet = HttpService:GetAsync(URL_get)
print(responseGet)
local decoded = HttpService:JSONDecode(responseGet)
print("decoded")
print(decoded)
workspace.Dummy.Head.Dialog.InitialPrompt = decoded[1].text
while true do
	local scriptContent = game.StarterGui.ScreenGui.TextBox.Text
	print(scriptContent)
	wait(1)
end 
