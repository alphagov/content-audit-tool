class DeleteInvalidAllocations < ActiveRecord::Migration[5.1]
  def up
    Allocation.where(uid: 'anyone').delete_all
  end
end
