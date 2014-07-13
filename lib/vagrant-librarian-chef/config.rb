module VagrantPlugins
  module LibrarianChef
    class Config < Vagrant.plugin(2, :config)
      # The path to the directory containing the Cheffile.
      # @return [String] The path.
      attr_accessor :cheffile_dir

      # Whether or not the plugin is enabled. If disabled, it will have no effect.
      # @return [Boolean] The value of the enabled flag.
      attr_accessor :enabled

      def initialize
        @cheffile_dir = UNSET_VALUE
        @enabled      = true
      end

      def finalize!
        @cheffile_dir = "." if @cheffile_dir == UNSET_VALUE
      end

      def cheffile_path
        @cheffile_path ||= @cheffile_dir ? File.join(@cheffile_dir, 'Cheffile') : 'Cheffile'
      end
    end
  end
end
