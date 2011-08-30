class Bathub.AppController extends Batman.Controller
    index: ->   
        @render false
        
    submitSearch: =>
        @redirect 'user'
        
    user: (query) ->            
        Bathub.set 'searched', no
        Bathub.set 'loading', yes

        $.ajax 'https://api.github.com/users/'+ encodeURI(Bathub.query),
            dataType: 'jsonp'
            success: (data) ->
                Bathub.set 'loading', no
                Bathub.set 'searched', yes
                
                Bathub.User.all.forEach (u) -> u.destroy()
                user = new Bathub.User data.data
                user.save (error, record) ->
                    throw error if error
        
    followers: (query) =>
        Bathub.set 'searched', no
        Bathub.set 'loading', yes
        
        $.ajax 'https://api.github.com/users/'+ encodeURI(Bathub.query) + '/followers?page' + Bathub.currentPage + '&per_page=' + Bathub.pageSize,
            dataType: 'jsonp'
            success: @processUsersSuccess
                    
    following: (query) =>
        Bathub.set 'searched', no
        Bathub.set 'loading', yes

        $.ajax 'https://api.github.com/users/'+ encodeURI(Bathub.query) + '/following?page' + Bathub.currentPage + '&per_page=' + Bathub.pageSize,
            dataType: 'jsonp'
            success: @processUsersSuccess
            
    processUsersSuccess: (data) =>
        Bathub.set 'loading', no
        Bathub.set 'searched', yes
        
        Bathub.User.all.forEach (u) -> u.destroy()
        for obj in data.data
            user = new Bathub.User obj
            user.save (error, record) ->
                throw error if error