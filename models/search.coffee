class Bathub.Search extends Batman.Model
    @global 'yes'
    
    @persist Batman.LocalStorage
    
    @classAccessor 'all',
        get: ->
            unless @all
                @all = new Batman.SortableSet
                @all.sortBy "id desc"
            @all
