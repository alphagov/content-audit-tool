class RemoveNumberOfPdfsAndNumberOfWordFilesFromContentItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :content_items, :number_of_pdfs, :integer
    remove_column :content_items, :number_of_word_files, :integer
  end
end
