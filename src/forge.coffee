# Use CS's built in class builder for extra awesome (and extensibility if you want
# to add your own features as it behaves like a normal prototypal object).
class Selector
  # The data object is where all the elements are stored.
  data: []
  # Because it's a custom object, we need to define a length in order to natively
  # call object.length
  length: 0
  # Fortunately CS also has built in constructors for methods, making this really
  # easy.
  constructor: (@selector) ->
    # Our list of search functions (class, name and tag).
    list =
      '.': 'sByClassName'
      '@': 'sByName'
      '=': 'sByTagName'
    # Let's initialize our local data object as an array (for storing elements).
    @data = []
    # We iterate through all the elements in the page that match our selector from
    # the list, and then we slice off the first character to use as the query.
    # e.g. if we supply '.hello' then it becomes:
    # document['getelement' + 'sByClassName']('hello')
    for el in document['getElement' + list[@selector[0]]](@selector.slice(1))
      # For each one we push it into [data] and iterate over length
      @data.push(el)
      @length++

# Add the function to the window object (coffee builds private constructors by
# default).
window.$ = (str) -> new Selector(str) if /^\W/.test(str)