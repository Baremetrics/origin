require "spec_helper"

describe Origin::Optional::BatchSize do

  let(:query) do
    Origin::Query.new
  end

  describe "#batch_size" do

    context "when provided no options" do

      let(:selection) do
        query.batch_size
      end

      it "does not add any options" do
        selection.options.should eq({})
      end

      it "returns the query" do
        selection.should eq(query)
      end

      it "returns a cloned query" do
        selection.should_not equal(query)
      end
    end

    context "when provided nil" do

      let(:selection) do
        query.batch_size(nil)
      end

      it "does not add any options" do
        selection.options.should eq({})
      end

      it "returns the query" do
        selection.should eq(query)
      end

      it "returns a cloned query" do
        selection.should_not equal(query)
      end
    end

    context "when provided arguments" do

      let(:selection) do
        query.batch_size(500)
      end

      it "adds the field options" do
        selection.options.should eq({ "batch_size" => 500 })
      end

      it "returns a cloned query" do
        selection.should_not equal(query)
      end
    end
  end
end
