require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @users" do
      users = create_list(:user, 3)
      get :index
      expect(assigns(:users)).to match_array(users)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: user.to_param }
      expect(response).to be_successful
    end

    it "assigns @user" do
      get :show, params: { id: user.to_param }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end

    it "assigns a new user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: user.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_attributes) { attributes_for(:user) }

      it "creates a new User" do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to(User.last)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { attributes_for(:user, name: nil) }

      it "does not create a new User" do
        expect {
          post :create, params: { user: invalid_attributes }
        }.not_to change(User, :count)
      end

      it "renders the new template" do
        post :create, params: { user: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH/PUT #update" do
    let(:new_attributes) { { name: "New Name" } }

    context "with valid parameters" do
      it "updates the requested user" do
        put :update, params: { id: user.to_param, user: new_attributes }
        user.reload
        expect(user.name).to eq("New Name")
      end

      it "redirects to the user" do
        put :update, params: { id: user.to_param, user: new_attributes }
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { name: nil } }

      it "does not update the user" do
        put :update, params: { id: user.to_param, user: invalid_attributes }
        user.reload
        expect(user.name).not_to be_nil
      end

      it "renders the edit template" do
        put :update, params: { id: user.to_param, user: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    before { user }

    it "destroys the requested user" do
      expect {
        delete :destroy, params: { id: user.to_param }
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete :destroy, params: { id: user.to_param }
      expect(response).to redirect_to(users_path)
    end
  end
end
