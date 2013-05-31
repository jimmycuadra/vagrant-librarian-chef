module VagrantPlugins
  module LibrarianChef
    class Config < Vagrant.plugin(2, :config)
      attr_accessor :cheffile_dir

      def initialize
        @cheffile_dir = UNSET_VALUE
      end

      def finalize!
        @cheffile_dir = nil if @cheffile_dir == UNSET_VALUE
      end

      def cheffile_path
        @cheffile_path ||= @cheffile_dir ? File.join(@cheffile_dir, 'Cheffile') : 'Cheffile'
      end
    end
  end
end
