require "singleton"

module Bloo
  class Classifier
    include Singleton

    def initialize
      @categories = config[:categories]
      @classifier = ClassifierReborn::Bayes.new(@categories, auto_categorize: true)
      train
    end

    def train
      config[:datasets].each { |f| train_with_file f }
    end

    def classify(sentence)
      classifier.classify sentence
    end

    private

    attr_reader :classifier

    def config
      Bloo.config[:classifier]
    end

    def train_with_file(file)
      File.open(file, "r").each_line do |line|
        parts = line.split(":").map(&:strip)
        train_sentence(category: parts.first, sentence: parts.last, include_name: true)
      end
    end

    def train_sentence(category:, sentence:, include_name: false)
      own_name = config[:own_name]
      classifier.train(category, sentence)
      classifier.train(category, "#{own_name} #{sentence}") if include_name
    end
  end
end
