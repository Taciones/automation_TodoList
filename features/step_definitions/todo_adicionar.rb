Dado('que eu consiga acessar o aplicativo com sucesso') do
  @home_page.go
    
end
  
  Dado('consigo incluir um novo item de nome {string}') do | nome_todo |
    @nome_todo = nome_todo
    @home_page.new_todo(@nome_todo)
  end
  
  Então('a terefa deve ser incluida com sucesso') do
    
     expect(find(ELEMENTS["home_page"]["all_todos"])).to have_text(@nome_todo)
  end

  Dado('consigo alterar a tarefa inserida anteriormente para {string}') do | novo_nome |
    @novo_nome = novo_nome
    @home_page.edit_todo(@nome_todo,@novo_nome)
    
  end

  Então('quando solicitar para deletar a tarefa') do
    @home_page.delete_todo(@novo_nome)
  end
  
  Então('a tarefa deve ser excluida com sucesso') do
    begin
      expect(page).not_to have_text(@novo_nome)
    rescue
        $error = "Não foi possivel deletar item da lista com sucesso."
        raise $error
    end
    sleep 5
  end
  