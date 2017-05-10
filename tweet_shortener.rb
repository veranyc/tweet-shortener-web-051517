require 'pry'
# Write your code here.
def dictionary
  dictionary = {
  "Hello" => "hi",
#  "to"||"two"||"too" => "2",
  "to" => "2",
  "two" => "2",
  "too" => "2",
  #"for"||"four" => "4",
  "for" => "4",
  "four" => "4",
  "be" => "b",
  "you" => "u",
  "at" => "@",
  "and" => "&"
}
end

def word_substituter(tweet)
#split up the tweet string into an array of string for each word
#replace elements in the array based on changes made during the enumeration. I need to use the .collect method for this.
  tweet.split(" ").collect do |word|
    #compare each word in the array to the keys in dictionary
    #if word == dictionary.key then change word to the value in the key/value pair
    #note - I have to use the downcase method so that all comparisons are apple to apple. When I ran the bulk_tweet_shortener I ran into issues where the substitutions didn't occur because the tweet has an
    #uppercase word (e.g. "For" and all the dictionary keys are downcase e.g. "for")
    if dictionary.key? (word.downcase)
       word = dictionary[word.downcase]
     else
      #no match then add just the word before moving on
       word
    end
  #take what is returned after the iteration and join the words together in the array to form one string as the final tweet
  end.join(" ")
end

def bulk_tweet_shortener(tweet_array)
  tweet_array.each do |tweet|
      #binding.pry
    tweet = word_substituter(tweet)
    puts tweet
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length >= 140
    tweet = word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  if tweet.length >= 140
    tweet = tweet[0..136] + "..."
  else
    tweet
  end
end
