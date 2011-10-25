require "spec_helper"

describe Origin::Selection::Near do

  let(:query) do
    Origin::Query.new
  end

  describe "#near" do

    context "when provided no criterion" do

      let(:selection) do
        query.near
      end

      it "does not add any criterion" do
        selection.selector.should eq({})
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
        query.near(nil)
      end

      it "does not add any criterion" do
        selection.selector.should eq({})
      end

      it "returns the query" do
        selection.should eq(query)
      end

      it "returns a cloned query" do
        selection.should_not equal(query)
      end
    end

    context "when provided a criterion" do

      let(:selection) do
        query.near(:users => [ 20, 21 ])
      end

      it "adds the $near expression" do
        selection.selector.should eq({
          :users => { "$near" => [ 20, 21 ] }
        })
      end

      it "returns a cloned query" do
        selection.should_not equal(query)
      end
    end

    context "when providing multiple criteria" do

      context "when the fields differ" do

        let(:selection) do
          query.near(
            :users => [ 20, 21 ],
            :comments => [ 20, 21 ]
          )
        end

        it "adds the $near expression" do
          selection.selector.should eq({
            :users => { "$near" => [ 20, 21 ] },
            :comments => { "$near" => [ 20, 21 ] }
          })
        end

        it "returns a cloned query" do
          selection.should_not equal(query)
        end
      end

      context "when the fields are the same" do

        let(:selection) do
          query.near(
            :users => [ 20, 21 ],
            :users => [ 20, 21 ]
          )
        end

        it "overrides the $near expression" do
          selection.selector.should eq({
            :users => { "$near" => [ 20, 21 ] }
          })
        end

        it "returns a cloned query" do
          selection.should_not equal(query)
        end
      end
    end

    context "when chaining multiple criteria" do

      context "when the fields differ" do

        let(:selection) do
          query.
            near(:users => [ 20, 21 ]).
            near(:comments => [ 20, 21 ])
        end

        it "adds the $near expression" do
          selection.selector.should eq({
            :users => { "$near" => [ 20, 21 ] },
            :comments => { "$near" => [ 20, 21 ] }
          })
        end

        it "returns a cloned query" do
          selection.should_not equal(query)
        end
      end

      context "when the fields are the same" do

        let(:selection) do
          query.
            near(:users => [ 20, 21 ]).
            near(:users => [ 20, 21 ])
        end

        it "overrides the $near expression" do
          selection.selector.should eq({
            :users => { "$near" => [ 20, 21 ] }
          })
        end

        it "returns a cloned query" do
          selection.should_not equal(query)
        end
      end
    end
  end

  describe Symbol do

    describe "#near" do

      let(:key) do
        :field.near
      end

      it "returns a selecton key" do
        key.should be_a(Origin::Selection::Key)
      end

      it "sets the name as the key" do
        key.name.should eq(:field)
      end

      it "sets the operator as $near" do
        key.operator.should eq("$near")
      end
    end
  end
end
