class Bathub.AppController extends Batman.Controller
    index: ->   
        
    submitSearch: =>
        Bathub.set 'searched', no
        Bathub.set 'loading', yes
        
        Bathub.User.all.forEach (u) -> u.destroy()
        
        $.ajax 'https://api.github.com/users/'+ encodeURI(Bathub.query) + '/followers?page' + Bathub.currentPage + '&per_page=' + Bathub.pageSize,
            dataType: 'jsonp'
            success: (data) ->
                Bathub.set 'loading', no
                Bathub.set 'searched', yes
                for obj in data.data
                    user = new Bathub.User obj
                    user.save (error, record) ->
                        throw error if error