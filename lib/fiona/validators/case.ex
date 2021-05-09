defmodule Fiona.Validators.Case do
  use Fiona, :validator

  alias Fiona.Validators.Applicant

  @individual_or_company ~w(individual company)s

  embedded_schema do
    embeds_many :applicants, Applicant
    field :adults, :integer
    field :dependants, :integer
    field :expat, :boolean
    field :firsttime_buyer, :boolean
    field :firsttime_landlord, :boolean
    field :individual_or_company, :string
    field :joint_applicants_different_properties, :boolean
    field :portfolio, :boolean
    field :single_or_joint, :string
    field :topslicing, :boolean
  end

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [
      :adults,
      :dependants,
      :expat,
      :firsttime_buyer,
      :firsttime_landlord,
      :individual_or_company
    ])
    |> cast_embed(:applicants)
    |> validate_required([
      :applicants,
      :adults,
      :dependants,
      :expat,
      :firsttime_buyer,
      :firsttime_landlord,
      :individual_or_company
    ])
    |> validate_number(:adults, greater_than_or_equal_to: 0)
    |> validate_number(:dependants, greater_than_or_equal_to: 0)
    |> validate_inclusion(:individual_or_company, @individual_or_company)
  end
end
