defmodule Fiona.Validators.Applicant do
  use Fiona, :validator

  @genders ~w(male female)s
  @marital_statuses ~w(married living_with_partner single civil_partnership divorced separated widowed)s
  @low_rate_tax_bands ~w(none basic scottish_none scottish_starter scottish_basic)s
  @high_rate_tax_bands ~w(higher additional scottish_intermediate scottish_higher scottish_top)s
  @tax_bands @low_rate_tax_bands ++ @high_rate_tax_bands
  @minimum_age 18
  @retirement_ages @minimum_age..120

  embedded_schema do
    field :gender, :string
    field :marital_status, :string
    field :retirement_age, :integer
    field :tax_band, :string
    field :barclays_premier, :boolean
  end

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:gender, :marital_status, :retirement_age, :tax_band, :barclays_premier])
    |> validate_required([
      :retirement_age,
      :tax_band,
      :barclays_premier
    ])
    |> validate_inclusion(:gender, @genders)
    |> validate_inclusion(:marital_status, @marital_statuses)
    |> validate_inclusion(:tax_band, @tax_bands)
    |> validate_inclusion(:retirement_age, @retirement_ages)
  end
end
