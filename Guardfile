# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'nanoc' do
  watch('config.yaml') # Change this to config.yaml if you use the old config file name
  watch('lib/site.yml')
  watch('Rules')
  watch(%r!^(content|layouts|lib)/.+\.rb!)
end

