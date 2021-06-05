# language: pt


Funcionalidade: Testar Todo E2E
    Eu como usuario de Todo list
    Preciso ser capaz de incluir, editar e deletar uma tarefa

    
    Contexto: Carregar aplicação com sucesso
        Dado que eu consiga acessar o aplicativo com sucesso 
    
    
    Cenário: Ações basicas de ediçao da lista
        Quando consigo incluir um novo item de nome "teste"
        Então a terefa deve ser incluida com sucesso
        E consigo alterar a tarefa inserida anteriormente para "novo_teste"
        E quando solicitar para deletar a tarefa
        Então a tarefa deve ser excluida com sucesso