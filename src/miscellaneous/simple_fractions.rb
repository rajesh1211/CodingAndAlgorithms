nom = 1
dom = 6
# nom = 50
# dom = 22



num = nom
fraction_found = false
array = []
counter = 0
start_inserting = false
non_fraction = 0
while ! fraction_found do
  if num < dom
    num = num * 10
    start_inserting = true
  else
    non_fraction = num/dom
  end
  value = num/dom
  rem = num%dom
  if start_inserting
    if array.size == 0
      array << {
        value: value,
        rem: rem
      }
    else
      if ! array.detect {|i| i[:rem] == rem}.nil?
        array << {
          value: value,
          rem: rem
        }
        fraction_found = true
      else
        array << {
          value: value,
          rem: rem
        }
      end
    end
  end
  num = rem
end
puts non_fraction
puts array
