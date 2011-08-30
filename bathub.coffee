class Bathub extends Batman.App
    @global yes
  
    @controller 'app'
    @model 'user'
    
    @root 'app#index'
    
    #@route 'user/:username', 'app#user'
    #@route 'user/:username/followers', 'app#followers'
    #@route 'user/:username/following', 'app#following'
    
    @route 'user', 'app#user'
    @route 'followers', 'app#followers'
    @route 'following', 'app#following'
    
    @query: ''
    
    @pageSize: 48
    @currentPage: 1
    
    @loading: no
    @searched: no
    