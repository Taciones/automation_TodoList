class HomePage
    include RSpec::Matchers
    include Capybara::DSL

    def go
        visit "/"

        begin
            assert_selector(ELEMENTS["home_page"]["todo_section"])
        rescue
            $error = "Não foi possivel carregar a página corretamente."
            raise $error
        end
    end

    def new_todo(name)
        
        find(ELEMENTS["home_page"]["input_new_todo"]).set(name).send_keys :enter
        sleep 2
        find(ELEMENTS["home_page"]["input_new_todo"]).send_keys :enter
        
    end

    def edit_todo(nome,novo_nome)
        
        item = find(ELEMENTS["home_page"]["all_todos"], :text => nome)
        item.double_click
        item.fill_in(with: novo_nome).send_keys :enter
        begin
            expect(find(ELEMENTS["home_page"]["all_todos"])).to have_text(novo_nome)
        rescue
            $error = "Não foi possivel editar a lista com sucesso."
            raise $error
        end

    end
    def delete_todo(nome)
        item = find(ELEMENTS["home_page"]["all_todos"], :text => nome)
        item.hover
        find(ELEMENTS["home_page"]["delete_button"], visible: true).click
        begin
            expect(page).not_to have_text(nome)
        rescue
            $error = "Não foi possivel editar a lista com sucesso."
            raise $error
        end

    end

    
end