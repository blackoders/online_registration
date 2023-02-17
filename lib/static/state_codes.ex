defmodule Static.StateCodes do
  def get_code(state) do
    codes = %{
      Andaman_and_Nicobar:	"AN",
	Andhra_Pradesh:	"AP",
	Arunachal_Pradesh:	"AR",
	Assam:	"AS",
	Bihar:	"BR",
	Chandigarh:	"CH",
	Dadra_and_Nagar_Haveli:	"DN",
	Daman_and_Diu:	"DD",
	Delhi:	"DL",
	Goa:	"GA",
	Gujarat:	"GJ",
	Haryana:	"HR",
	Himachal_Pradesh:	"HP",
	Jammu_and_Kashmir:	"JK",
	Karnataka:	"KA",
	Kerala:	"KL",
	Lakshadweep:	"LD",
	Madhya_Pradesh:	"MP",
	Maharashtra:	"MH",
	Manipur:	"MN",
	Meghalaya:	"ML",
	Mizoram:	"MZ",
	Nagaland:	"NL",
	Orissa:	"OR",
	Pondicherry:	"PY",
	Punjab:	"PN",
	Rajasthan:	"RJ",
	Sikkim:	"SK",
	TamilNadu:	"TN",
	Tripura:	"TR",
	Uttar_Pradesh:	"UP",
	West_Bengal:	"WB",
    }

    Map.get(codes,state)

  end

end
