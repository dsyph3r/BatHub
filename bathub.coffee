class Bathub extends Batman.App
    @global yes
  
    @controller 'app'
    @root 'app#index'
    @query: ''
    
    @pageSize: 48
    @currentPage: 1
    
    @loading: no
    @searched: no
    
class Bathub.User extends Batman.Model
    @global 'yes'
    
    @persist Batman.LocalStorage