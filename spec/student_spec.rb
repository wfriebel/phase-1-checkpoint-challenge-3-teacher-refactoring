require_relative '../student'

describe Student do
  let(:amir) { Student.new({name: "Amir Fayek", age: 21}) }

  it "offers high fives" do
    expect(amir.offer_high_five).to eq("High five!")
  end

  context "#set_phase" do
    it "responds graciously on phase repeat" do
      response = amir.set_phase(1)
      expect(response).to eq("I'm doing phase 1 again because I put my learning first. I'm gonna rock it!")
    end

    it "responds with nervous excitement upon moving up" do
      response = amir.set_phase(2)
      expect(response).to eq("Oooh, phase 2. I hope I'm ready!")
    end
  end

  context '#learn_stuff' do
    it "can learn stuff" do
      response = amir.learn_stuff
      expect(response).to eq("WHOA! I've never thought of it quite like that before. Now I feel like a genius!")
    end

    it "cannot teach stuff" do
      expect{amir.send(:teach_stuff)}.to raise_error(NoMethodError)
      expect(amir.respond_to? :teach_stuff).to be false
    end

    it "cannot receive a raise" do
      expect{amir.send(:receive_raise, 100)}.to raise_error(NoMethodError)
      expect(amir.respond_to? :receive_raise).to be false
    end
  end

  it "allows the name to be updated" do
    amir.name = "Mama Bear"
    expect(amir.name).to eq("Mama Bear")
  end
end
