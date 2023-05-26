module Mutations
  module Concerns
    module UserValidation
      def validate_password(inputs)
        if inputs[:password] != inputs[:password_confirmation]
          raise GraphQL::ExecutionError, "Password and password confirmation must match"
        end
      end

      def validate_email(inputs)
        if User.find_by(email: inputs[:email])
          raise GraphQL::ExecutionError, "Email already in use"
        end
      end

      def valide_document_number(inputs)
        if User.find_by(document_number: inputs[:document_number])
          raise GraphQL::ExecutionError, "Document number already in use"
        end
      end

      def validate_accept_terms_of_use(inputs)
        unless inputs[:accept_terms_of_use]
          raise GraphQL::ExecutionError, "You must accept the terms of use"
        end
      end

      def name_normalize(name)
        name.split.map(&:capitalize).join(' ')
      end

      def email_normalize(email)
        unless email.include?("@")
          raise GraphQL::ExecutionError, "Email invalid"
        end

        email.downcase
      end

      def regex_phone(phone)
        phone.gsub(/[^0-9]/, '')
      end

      def regex_document_number(document_number)
        document_number.gsub(/[^0-9]/, '')
      end
    end
  end
end