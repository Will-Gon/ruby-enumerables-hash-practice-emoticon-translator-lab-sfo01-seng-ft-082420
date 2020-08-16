# require modules here
require 'yaml'
require 'pry'

def load_library(path)
   emo_hash = {}
   emoticon = YAML.load_file(path)
    emoticon.each do |key, value|
         emo_hash[key] = {}
         emo_hash[key][:english] = value[0]
         emo_hash[key][:japanese] = value[1]
         #binding.pry
   end
   emo_hash
 end

def get_japanese_emoticon(path, english_emo)
    library = load_library(path)
    english_emo = library.keys.find do |key|
      library[key][:english] == english_emo
  end
    english_emo ? library[english_emo][:japanese] :"Sorry, that emoticon was not found"
end
 

def get_english_meaning(path, meaning)
  library = load_library(path)
  meaning = library.keys.find do |key|
    library[key][:japanese] == meaning
    #binding.pry
end
    meaning ? meaning :"Sorry, that emoticon was not found"
end

