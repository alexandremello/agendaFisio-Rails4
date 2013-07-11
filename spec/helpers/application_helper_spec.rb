require 'spec_helper'

describe ApplicationHelper do
	
	let(:datetime) { DateTime.new(2013, 07, 10, 19, 00, 00, '-3') }
  
  context 'format' do
  	it { helper.format_date(datetime).should == '10/07/2013' }

  	it { helper.format_time(datetime).should == '19h00min'}
  end

  context 'navigation menu' do
  	context 'as admin' do
  		login_admin
  		it {helper.nav_items.should == (render "nav_admin") }
  	end

  	context 'as user' do
      login_user
  		it { helper.nav_items.should == (render "nav_user") }
  	end
  end

 end