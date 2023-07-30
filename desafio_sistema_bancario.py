menu = """

[1] Depositar
[2] Sacar
[3] Extrato
[0] Sair

=> """
saldo = 0
limite = 500
extrato = ""
numero_saques = 0
LIMITE_SAQUES = 3

while True:

    opcao = input(menu)

    if opcao == "1":
        valor = float(input("Informe o valor do depósito: "))

        if valor > 0:
            saldo += valor
            extrato += f"Depósito: R$ {valor:.2f}\n"
        else:
            print("Operação inválida! Valor informado é incorreto.")

    elif opcao == "2":        
        valor = float(input("Informe o valor do saque: "))

        if valor > saldo:
            print("Operação inválida! Saldo insuficiente.")
        elif valor > limite:
            print("Operação inválida! Valor do saque maior que limite diário.")
        elif numero_saques >= LIMITE_SAQUES:
            print("Operação inválida! Excedido o número de saques diários.")
        elif valor > 0:
            saldo -= valor
            numero_saques += 1
            extrato += f"Saque: R$ {valor:.2f}\n"        
        else:
            print("Operação inválida! Valor informado é incorreto.")
       
    elif opcao == "3":
        print("\n")
        print(" EXTRATO ".center(25, "#"))
        print("Conta sem movimentações." if not extrato else extrato)
        print(f"\nSaldo: R$ {saldo:.2f}")
        print("".center(25, "#"))

    elif opcao == "0":
        break

    else:
        print("Operação inválida! favor selecionar uma opção válida.")
