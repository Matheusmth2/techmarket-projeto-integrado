document.getElementById("formulario").addEventListener("submit", function(event) {
    event.preventDefault();

    const cpf = document.getElementById("cpf").value.trim();
    const dataNascimento = document.getElementById("dataNascimento").value;
    const telefone = document.getElementById("telefone").value.trim();
    const mensagemErro = document.getElementById("mensagemErro");

    mensagemErro.textContent = ""; // limpa mensagens anteriores

    // Validar CPF (somente 11 dígitos numéricos)
    if (!/^\d{11}$/.test(cpf)) {
        mensagemErro.textContent = "CPF inválido. Deve conter exatamente 11 dígitos numéricos.";
        return;
    }

    // Validar Data de Nascimento
    const hoje = new Date();
    const nascimento = new Date(dataNascimento);
    const idade = hoje.getFullYear() - nascimento.getFullYear();
    const mes = hoje.getMonth() - nascimento.getMonth();
    const dia = hoje.getDate() - nascimento.getDate();

    if (!dataNascimento || nascimento > hoje || idade < 18 || (idade === 18 && (mes < 0 || (mes === 0 && dia < 0)))) {
        mensagemErro.textContent = "Você precisa ter pelo menos 18 anos.";
        return;
    }

    // Validar telefone (11 dígitos)
    if (!/^\d{11}$/.test(telefone)) {
        mensagemErro.textContent = "Telefone inválido. Use o formato 11 dígitos: DDD + número.";
        return;
    }

    // Se tudo estiver certo
    alert("Formulário enviado com sucesso!");
});
