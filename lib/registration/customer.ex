defmodule Registration.Customer do
         def is_valid(customer_details) do
              %{name: name, aadhar: aadhar} = customer_details

                if  check_name(name) && check_aadhar(aadhar) == true do
                  true
                end
         end

        def check_name(name) do
          if String.valid?(name) == true do
            if String.length(name) >= 3 do
              IO.inspect(name)
              true
            end
          else
          false
        end
      end

      def check_aadhar(aadhar) do
        if is_integer(aadhar) == true do
          IO.inspect(aadhar)
         count =
          aadhar
          |> Integer.digits
          |> length

          if count == 12 do
            true
          end
        else
          false
        end


      end


end
