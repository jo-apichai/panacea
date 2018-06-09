defmodule Panacea.UserFactory do
  defmacro __using__(_opts) do
    quote do
      def user_factory do
        %Panacea.Users.User{
          name: "#{Faker.Name.first_name()} #{Faker.Name.last_name()}",
          email: sequence(:email, &"email-#{&1}@example.com"),
          password: "P@ssw0rd"
        }
      end
    end
  end
end
