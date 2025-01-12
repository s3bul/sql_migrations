module SqlMigrations
  # Class that represents script file
  #
  class File
    attr_reader :name, :time, :date, :datetime, :database, :type, :path

    def initialize(path, database, type)
      @path     = path
      @database = database
      @type     = type.to_s

      @file, @base, @parent = elements(path)
      @date, @time, @name = match(@file) if @file
      @datetime = (@date.to_s + @time.to_s).to_i
    end

    def valid?
      [@name, @time, @date, @database, directories?].all?
    end

    def content
      ::File.read(@path)
    end

    def ==(other)
      datetime == other.datetime
    end

    def to_s
      @file.to_s
    end

    private

    def elements(path)
      _filename, _base_directory, _parent_directory =
        path.split(::File::SEPARATOR).last(3).reverse
    rescue ArgumentError => e
      puts "Invalid path: #{path}"
    end

    def match(filename)
      _, date, time, name =
        filename.match(/^(\d{8})_(\d{6})_(.*)?\.sql$/).to_a
      [date, time, name]
    end

    def directories?
      if @database == :default
        file_in_type_base_directory? || file_in_database_directory?
      else
        file_in_database_directory?
      end
    end

    def file_in_type_base_directory?
      @base == "#{@type}s"
    end

    def file_in_type_parent_directory?
      @parent == "#{@type}s"
    end

    def file_in_database_directory?
      file_in_type_parent_directory? &&
        (@base == @database.to_s)
    end
  end
end
