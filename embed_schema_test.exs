alias Fiona.Validators.Case

params = %{
  "applicants" => [
    %{
      "gender" => "male",
      "retirement_age" => "60",
      "barclays_premier" => "true",
      "tax_band" => "scottish_basic"
    }
  ],
  "adults" => "0",
  "dependants" => "24",
  "expat" => "true",
  "firsttime_buyer" => "false",
  "firsttime_landlord" => "false",
  "individual_or_company" => "company"
}

Case.changeset(%Case{}, params) |> IO.inspect()
