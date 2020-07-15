class GroupSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name

  attribute :club_groups do |object|
    object.club_groups.map do |club_group|
      GroupClubGroupSerializer.new(club_group).serializable_hash
    end
end
end
