require 'rubygems'
require 'ramaze'

Ramaze.options.cache.session = Ramaze::Cache::Marshal

Ramaze.options.roots = [__DIR__]

# Initialize controllers and models
require __DIR__('controller/init')
require __DIR__('model/init')
require __DIR__('view/init')
require __DIR__('lib/init')
