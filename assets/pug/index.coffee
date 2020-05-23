$(".nav-link").click ->
  $(".navbar-toggler").click()
app = new Vue
  el: ".vue"
  data:
    tulis: "tambah"
    list: []
    input: null
    index_edit: null
  methods:
    balik: (x) ->
      x.slice().reverse()
    hapus: (n) ->
      Vue.delete @list, @list.length - 1 - n
      localStorage.setItem "list", JSON.stringify @list
    form: ->
      if @tulis is "tambah"
        @list.push @input
        @input = null
        localStorage.setItem "list", JSON.stringify @list
      else
        @list[@index_edit] = @input
        @input = null
        @tulis = "tambah"
        localStorage.setItem "list", JSON.stringify @list
    mau_edit: (n) ->
      n_sebenarnya = @list.length - 1 - n 
      @tulis = "edit"
      @input = @list[n_sebenarnya]
      @index_edit = n_sebenarnya
  mounted: ->
    if localStorage.list
      @list = JSON.parse localStorage.list