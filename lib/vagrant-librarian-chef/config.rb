module VagrantPlugins
  module LibrarianChef
    class Config < Vagrant.plugin(2, :config)
      attr_accessor :cheffile_dir

      # @return [Boolean]
      #   disable of use Berks in Vagrant
      attr_accessor :enabled

      def initialize
        @cheffile_dir = UNSET_VALUE
        @enabled      = UNSET_VALUE
      end

      def finalize!
        @cheffile_dir = "." if @cheffile_dir == UNSET_VALUE
        @enabled      = File.exist?(cheffile_path) if @enabled == UNSET_VALUE
      end

      def cheffile_path
        @cheffile_path ||= @cheffile_dir ? File.join(@cheffile_dir, 'Cheffile') : 'Cheffile'
      end
    end
  end
end
