RSpec.feature "Phase banner", type: :feature do
  before do
    create(:user)
  end

  context 'when auditing' do
    scenario 'the user can see a BETA phase banner' do
      visit '/allocations'

      within('.phase-banner') do
        expect(page).to have_text('BETA')
      end
    end
  end
end
