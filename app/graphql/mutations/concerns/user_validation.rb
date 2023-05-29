module Mutations
  module Concerns
    module UserValidation
      def validate_password(inputs)
        if inputs[:password] != inputs[:password_confirmation]
          raise GraphQL::ExecutionError, "As senhas não coincidem"
        end
      end

      def validate_email(inputs)
        existing_user = User.find_by(email: inputs[:email])

        if existing_user && existing_user != inputs[:current_user]
          raise GraphQL::ExecutionError, "O e-mail já está em uso"
        end
      end

      def valide_document_number(inputs)
        existing_user = User.find_by(document_number: inputs[:document_number])

        if existing_user && existing_user != inputs[:current_user]
          raise GraphQL::ExecutionError, "O CPF já está em uso"
        end
      end

      def validate_accept_terms_of_use(inputs)
        unless inputs[:accept_terms_of_use]
          raise GraphQL::ExecutionError, "Você precisa aceitar os termos de uso"
        end
      end

      def name_normalize(name)
        name.split.map(&:capitalize).join(' ')
      end

      def email_normalize(email)
        unless email.include?("@")
          raise GraphQL::ExecutionError, "E-mail inválido"
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