class Calendar < Resource
  field :content        , type: String

  def as_json
    {
      _id: id,
      user: user.as_json
    }
  end
end
