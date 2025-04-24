while True:
    phrase = input("Скажи что-нибудь: ")
    
    if phrase.lower() in ["выход", "exit", "quit"]:
        print("Пока")
        break

    print("Попугай сказал:", phrase)
