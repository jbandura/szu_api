module API
  module V1
    class Base < Grape::API
      mount API::V1::Students
      mount API::V1::StudentGroups
      mount API::V1::Payments
      mount API::V1::Courses
    end
  end
end
