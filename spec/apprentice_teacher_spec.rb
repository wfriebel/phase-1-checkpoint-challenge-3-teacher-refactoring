require_relative '../apprentice_teacher'

describe ApprenticeTeacher do
  let(:rey) { ApprenticeTeacher.new({name: "Rey", age: 21}) }
  let(:default_apprentice) { ApprenticeTeacher.new }

  it "allows the name to change" do
    rey.name = "Rey"
    expect(rey.name).to eq("Rey")
  end

  it "offers high fives" do
    expect(rey.offer_high_five).to eq("High five!")
  end

  it "does not have performance rating available because ApprenticeTeacher has no rating" do
    expect{rey.send(:performance_rating)}.to raise_error(NoMethodError)
  end

  describe "default behavior" do
    it "fills in '' for name" do
      expect(default_apprentice.name).to eq('')
    end

    it "sets age to 0" do
      expect(default_apprentice.age).to be(0)
    end

    it "sets target raise to 800" do
      expect(default_apprentice.target_raise).to be(800)
    end
  end

  context "#set_phase" do
    it "starts off in phase 3" do
      expect(rey.phase).to be(3)
    end

    it "changes the phase" do
      rey.set_phase(1)
      expect(rey.phase).to be(1)
    end

    it "responds with enthusiasm" do
      response = rey.set_phase(1)
      expect(response).to eq("Cool, I've always wanted to teach phase 1!")
    end
  end

  context "#teach_stuff" do
    it "teaches stuff in a confident manner" do
      response = rey.teach_stuff
      expect(response).to eq("Listen, class, this is how everything works. *drops crazy knowledge bomb* ... You're welcome.")
    end
  end

  describe "salary functionality" do
    it "has a readable target raise of 800" do
      expect(rey.target_raise).to be(800)
    end

    it "allows the setting of salary" do
      # ONE MEEEEEELLION DOLLARS!!!
      rey.salary = 1000000
      expect(rey.salary).to be (1000000)
    end

    it "increases salary with a good performance review" do
      rey.salary = 1000000
      rey.set_performance_rating(85)
      expect(rey.salary).to be(1000800)
    end
  end

  describe "feedback acceptance" do
    before(:each) do
      rey.salary = 1000000
    end

    it "is gracious" do
      response = rey.set_performance_rating(15)
      expect(response).to eq("Oh, well -- thanks to this actionable, specific, and kind feedback, I'll do better next time.")
    end

    it "celebrates good feedback" do
      response = rey.set_performance_rating(100)
      expect(response).to eq("Yay, I'm a great employee!")
    end
  end
end
