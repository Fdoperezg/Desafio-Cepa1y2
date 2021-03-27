require 'rails_helper'

RSpec.describe WinesController, :type​ => :controller​​ do
    describe 'GET index' do
        it 'returns a successful response' do
            @user = User.create(email: 'test@gmail.com', password: '12345678')
            sign_in @user
            get :index
            expect(response).to be_successful
        end
     
        it 'assigns wines' do
            @user = User.create(email: 'test@gmail.com', password: '12345678', editor: true)
            sign_in @user
            @wine = Wine.create(name: 'Gran vino diaulo', score: '58')
            get :index
            expect(Wine.count).to eq(1)
        end
    
        it 'renders the index template' do
            @user = User.create(email: 'test@gmail.com', password: '12345678')
            sign_in @user
            get :index
            expect(response).to render_template('index')
        end

        it 'renders the show template' do
            @user = User.create(email: 'test@gmail.com', password: '12345678')
            sign_in @user
            wine = Wine.create(name: 'Gran vino diaulo', score: '58')
            get :show, params: {id:wine.id} 
            expect(response).to render_template('show')
        end
    end
end
