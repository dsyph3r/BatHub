class Bathub extends Batman.App
    @global yes
  
    @controller 'app'
    @model 'user'
    
    @root 'app#index'
    @query: ''
    
    @pageSize: 48
    @currentPage: 1
    
    @loading: no
    @searched: no
    